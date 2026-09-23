import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/rides/ride_pool.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Кабинет учреждения', (sessionBuilder, endpoints) {
    late Session session;
    late Institution school;
    late Child child;
    late Parent parent;
    late Ride ride;
    late String token;
    late TestSessionBuilder asDispatcher;
    late TestSessionBuilder asParent;

    setUp(() async {
      session = sessionBuilder.build();

      school = await Institution.db.insertRow(
        session,
        Institution(
          type: InstitutionType.school,
          name: 'Школа №20',
          address: 'ул. Героглы 45',
          handoverCode: '2024',
        ),
      );
      final family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365206666'),
      );
      parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365206666',
          name: 'Огулджан',
          role: ParentRole.owner,
        ),
      );
      child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      final driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365106666',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0066 AH',
        ),
      );
      final template = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1, 2, 3, 4, 5, 6, 7],
          pickupTime: '07:30',
          fromAddress: 'ул. Героглы 1',
          toInstitutionId: school.id,
          direction: RouteDirection.toInstitution,
          driverId: driver.id,
          pricePerRideTenge: 3500,
          active: true,
        ),
      );
      ride = await Ride.db.insertRow(
        session,
        Ride(
          templateId: template.id,
          childId: child.id!,
          driverId: driver.id,
          date: AshgabatTime.today(),
          plannedTime: '07:30',
          status: RideStatus.scheduled,
        ),
      );
      await RidePool.addSeat(
        session,
        rideId: ride.id!,
        childId: child.id!,
        templateId: template.id,
        seatPriceTenge: 3500,
      );

      final dispatcher = await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365006666', name: 'Мерджен'),
      );
      asDispatcher = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'dispatcher:${dispatcher.id}',
          {const Scope('dispatcher')},
        ),
      );
      asParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${parent.id}',
          {const Scope('parent')},
        ),
      );

      token = await endpoints.institutionAdmin.issueAccess(
        asDispatcher,
        institutionId: school.id!,
        issuedTo: 'Воспитатель Гульнара',
      );
    });

    test('по ссылке видно, кого сегодня привезут', () async {
      final day = await endpoints.institution.dayView(
        sessionBuilder,
        token,
        date: null,
      );

      expect(day, isNotNull);
      expect(day!.institutionName, 'Школа №20');
      expect(day.arrivals, hasLength(1));
      expect(day.arrivals.single.childName, 'Мерет');
      expect(day.arrivals.single.plannedTime, '07:30');
      expect(day.arrivals.single.driverName, 'Аман');
    });

    test('чужой токен не открывает список', () async {
      final day = await endpoints.institution.dayView(
        sessionBuilder,
        'подобранный-токен',
        date: null,
      );
      expect(day, isNull);
    });

    test('отозванная ссылка перестаёт работать', () async {
      final accesses = await endpoints.institutionAdmin.accesses(
        asDispatcher,
        school.id!,
      );
      await endpoints.institutionAdmin.revokeAccess(
        asDispatcher,
        accesses.single.id!,
      );

      final day = await endpoints.institution.dayView(
        sessionBuilder,
        token,
        date: null,
      );
      expect(day, isNull);
    });

    test('«Принял(а)» — независимое подтверждение передачи', () async {
      final ok = await endpoints.institution.confirmArrival(
        sessionBuilder,
        token: token,
        rideId: ride.id!,
        childId: child.id!,
        confirmedBy: 'Гульнара',
      );
      expect(ok, isTrue);

      final seat = (await RidePool.seats(session, ride.id!)).single;
      expect(seat.confirmedByInstitutionAt, isNotNull);
      expect(seat.confirmedByInstitutionName, 'Гульнара');

      // Повторное нажатие ничего не ломает.
      await endpoints.institution.confirmArrival(
        sessionBuilder,
        token: token,
        rideId: ride.id!,
        childId: child.id!,
        confirmedBy: 'Кто-то другой',
      );
      final again = (await RidePool.seats(session, ride.id!)).single;
      expect(again.confirmedByInstitutionName, 'Гульнара');
    });

    test('заявленное отсутствие видно водителю и учреждению', () async {
      final declared = await endpoints.routes.declareAbsence(
        asParent,
        rideId: ride.id!,
        childId: child.id!,
        reason: 'Мерет заболел',
      );
      expect(declared, isTrue);

      // Учреждение видит причину.
      final day = await endpoints.institution.dayView(
        sessionBuilder,
        token,
        date: null,
      );
      expect(day!.arrivals.single.absenceReason, 'Мерет заболел');

      // Водителю ушло уведомление.
      final outbox = await NotificationOutbox.db.find(
        session,
        where: (row) => row.recipientRole.equals(AccountRole.driver),
      );
      expect(outbox, isNotEmpty);
      expect(outbox.first.body, contains('не едет'));
      expect(outbox.first.critical, isTrue);
    });

    test('отсутствие без причины не принимается', () async {
      await expectLater(
        endpoints.routes.declareAbsence(
          asParent,
          rideId: ride.id!,
          childId: child.id!,
          reason: '  ',
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('родитель не может отметить чужого ребёнка', () async {
      final otherFamily = await Family.db.insertRow(
        session,
        Family(name: 'Семья Чужих', ownerPhone: '+99365209911'),
      );
      final otherChild = await Child.db.insertRow(
        session,
        Child(familyId: otherFamily.id!, name: 'Чужой', codeWord: 'x'),
      );

      await expectLater(
        endpoints.routes.declareAbsence(
          asParent,
          rideId: ride.id!,
          childId: otherChild.id!,
          reason: 'болеет',
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
