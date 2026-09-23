import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/rides/ride_pool.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

const _seatPrice = 2500;

void main() {
  withServerpod('Пулинг: несколько детей в машине', (
    sessionBuilder,
    endpoints,
  ) {
    late Session session;
    late Institution school;
    late Driver driver;
    late TestSessionBuilder asDriver;
    late TestSessionBuilder asDispatcher;

    setUp(() async {
      session = sessionBuilder.build();

      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365105555',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0055 AH',
          // Три места, одно детское кресло.
          seats: 3,
          childSeats: 1,
        ),
      );
      school = await Institution.db.insertRow(
        session,
        Institution(
          type: InstitutionType.school,
          name: 'Школа №20',
          address: 'ул. Героглы 45',
          handoverCode: '2024',
        ),
      );
      final dispatcher = await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365005555', name: 'Мерджен'),
      );

      asDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${driver.id}',
          {const Scope('driver')},
        ),
      );
      asDispatcher = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'dispatcher:${dispatcher.id}',
          {const Scope('dispatcher')},
        ),
      );
    });

    /// Семья с ребёнком, маршрутом и поездкой на сегодня.
    Future<({Family family, Child child, Ride ride, Parent parent})> family(
      String name,
      String phone,
      String codeWord, {
      String pickupTime = '07:30',
      bool needsChildSeat = false,
    }) async {
      final fam = await Family.db.insertRow(
        session,
        Family(name: name, ownerPhone: phone),
      );
      final parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: fam.id!,
          phone: phone,
          name: name,
          role: ParentRole.owner,
        ),
      );
      final child = await Child.db.insertRow(
        session,
        Child(
          familyId: fam.id!,
          name: 'Ребёнок $name',
          codeWord: codeWord,
          needsChildSeat: needsChildSeat,
        ),
      );
      final template = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1, 2, 3, 4, 5, 6, 7],
          pickupTime: pickupTime,
          fromAddress: 'ул. Героглы, дом $name',
          toInstitutionId: school.id,
          direction: RouteDirection.toInstitution,
          driverId: driver.id,
          pricePerRideTenge: _seatPrice,
          active: true,
        ),
      );
      final ride = await Ride.db.insertRow(
        session,
        Ride(
          templateId: template.id,
          childId: child.id!,
          driverId: driver.id,
          date: AshgabatTime.today(),
          plannedTime: pickupTime,
          status: RideStatus.scheduled,
        ),
      );
      await RidePool.addSeat(
        session,
        rideId: ride.id!,
        childId: child.id!,
        templateId: template.id,
        seatPriceTenge: _seatPrice,
      );
      return (family: fam, child: child, ride: ride, parent: parent);
    }

    test(
      'диспетчер видит совместимые поездки: то же время и учреждение',
      () async {
        final first = await family('Ниязовых', '+99365201001', 'ýyldyz');
        await family(
          'Атаевых',
          '+99365201002',
          'deňiz',
          pickupTime: '07:40',
        );
        // Слишком рано — не предлагаем.
        await family(
          'Сапаровых',
          '+99365201003',
          'gülälek',
          pickupTime: '06:00',
        );

        final candidates = await endpoints.directory.poolCandidates(
          asDispatcher,
          first.ride.id!,
          maxTimeDiffMinutes: 20,
        );

        expect(candidates, hasLength(1));
        expect(candidates.single.timeDiffMinutes, 10);
        expect(candidates.single.toName, 'Школа №20');
      },
    );

    test('объединение в пул: дети едут в одной машине', () async {
      final first = await family('Ниязовых', '+99365201001', 'ýyldyz');
      final second = await family('Атаевых', '+99365201002', 'deňiz');
      final third = await family('Сапаровых', '+99365201003', 'gülälek');

      await endpoints.directory.mergeIntoPool(
        asDispatcher,
        rideId: first.ride.id!,
        rideIds: [second.ride.id!, third.ride.id!],
      );

      final seats = await RidePool.seats(session, first.ride.id!);
      expect(seats, hasLength(3));
      expect(
        seats.map((seat) => seat.pickupOrder).toList(),
        [1, 2, 3],
        reason: 'порядок посадки сохраняется',
      );
      // Лишние поездки исчезли: ребёнок едет в общей машине.
      expect(await Ride.db.find(session), hasLength(1));
    });

    test('в машину нельзя посадить больше, чем в ней мест', () async {
      final first = await family('Ниязовых', '+99365201001', 'ýyldyz');
      final second = await family('Атаевых', '+99365201002', 'deňiz');
      final third = await family('Сапаровых', '+99365201003', 'gülälek');
      final fourth = await family('Мурадовых', '+99365201004', 'asman');

      await endpoints.directory.mergeIntoPool(
        asDispatcher,
        rideId: first.ride.id!,
        rideIds: [second.ride.id!, third.ride.id!],
      );

      await expectLater(
        endpoints.directory.mergeIntoPool(
          asDispatcher,
          rideId: first.ride.id!,
          rideIds: [fourth.ride.id!],
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('второй ребёнок с креслом не поедет: кресло одно', () async {
      final first = await family(
        'Ниязовых',
        '+99365201001',
        'ýyldyz',
        needsChildSeat: true,
      );
      final second = await family(
        'Атаевых',
        '+99365201002',
        'deňiz',
        needsChildSeat: true,
      );

      await expectLater(
        endpoints.directory.mergeIntoPool(
          asDispatcher,
          rideId: first.ride.id!,
          rideIds: [second.ride.id!],
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('каждого ребёнка забирают по кодовому слову его семьи', () async {
      final first = await family('Ниязовых', '+99365201001', 'ýyldyz');
      final second = await family('Атаевых', '+99365201002', 'deňiz');
      await endpoints.directory.mergeIntoPool(
        asDispatcher,
        rideId: first.ride.id!,
        rideIds: [second.ride.id!],
      );
      final rideId = first.ride.id!;

      var counter = 0;
      RideEventSubmission event(
        RideEventType type, {
        int? childId,
        String? codeWord,
        String? institutionCode,
      }) => RideEventSubmission(
        clientEventId: 'pool-${counter++}',
        type: type,
        at: DateTime.now().toUtc(),
        childId: childId,
        codeWord: codeWord,
        institutionCode: institutionCode,
      );

      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(RideEventType.enRoute),
      );

      // Чужое кодовое слово не подходит: у каждой семьи своё.
      await expectLater(
        endpoints.rides.submitEvent(
          asDriver,
          rideId,
          event(
            RideEventType.pickedUp,
            childId: second.child.id,
            codeWord: 'ýyldyz',
          ),
        ),
        throwsA(
          isA<RideFlowException>().having(
            (e) => e.reason,
            'reason',
            RideFlowError.wrongCodeWord,
          ),
        ),
      );

      // Своё — подходит.
      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(
          RideEventType.pickedUp,
          childId: first.child.id,
          codeWord: 'ýyldyz',
        ),
      );
      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(
          RideEventType.pickedUp,
          childId: second.child.id,
          codeWord: 'deňiz',
        ),
      );

      expect(await RidePool.allPickedUp(session, rideId), isTrue);
    });

    test('поездка завершается, только когда переданы все дети', () async {
      final first = await family('Ниязовых', '+99365201001', 'ýyldyz');
      final second = await family('Атаевых', '+99365201002', 'deňiz');
      await endpoints.directory.mergeIntoPool(
        asDispatcher,
        rideId: first.ride.id!,
        rideIds: [second.ride.id!],
      );
      final rideId = first.ride.id!;

      var counter = 0;
      RideEventSubmission event(
        RideEventType type, {
        int? childId,
        String? codeWord,
        String? institutionCode,
      }) => RideEventSubmission(
        clientEventId: 'handover-${counter++}',
        type: type,
        at: DateTime.now().toUtc(),
        childId: childId,
        codeWord: codeWord,
        institutionCode: institutionCode,
      );

      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(RideEventType.enRoute),
      );
      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(
          RideEventType.pickedUp,
          childId: first.child.id,
          codeWord: 'ýyldyz',
        ),
      );
      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(
          RideEventType.pickedUp,
          childId: second.child.id,
          codeWord: 'deňiz',
        ),
      );
      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(RideEventType.inTransit),
      );
      await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(RideEventType.arrived),
      );

      // Передали первого — поездка продолжается.
      var ride = await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(
          RideEventType.handedOver,
          childId: first.child.id,
          institutionCode: '2024',
        ),
      );
      expect(
        ride.status,
        RideStatus.arrived,
        reason: 'машина ещё на остановке, второй ребёнок в салоне',
      );

      // Передали второго — только теперь поездка завершена.
      ride = await endpoints.rides.submitEvent(
        asDriver,
        rideId,
        event(
          RideEventType.handedOver,
          childId: second.child.id,
          institutionCode: '2024',
        ),
      );
      expect(ride.status, RideStatus.handedOver);

      // Каждая семья заплатила за своё место.
      final entries = await LedgerEntry.db.find(session);
      expect(entries, hasLength(2));
      expect(
        entries.map((entry) => entry.amountTenge).toSet(),
        {-_seatPrice},
      );
      expect(
        entries.map((entry) => entry.familyId).toSet(),
        {first.family.id, second.family.id},
        reason: 'списания по семьям независимы',
      );
    });

    test('родитель не видит чужих детей в общей машине', () async {
      final first = await family('Ниязовых', '+99365201001', 'ýyldyz');
      final second = await family('Атаевых', '+99365201002', 'deňiz');
      await endpoints.directory.mergeIntoPool(
        asDispatcher,
        rideId: first.ride.id!,
        rideIds: [second.ride.id!],
      );

      final asFirstParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${first.parent.id}',
          {const Scope('parent')},
        ),
      );

      final rides = await endpoints.routes.myUpcomingRides(asFirstParent);
      expect(rides, hasLength(1));

      final view = rides.single;
      expect(view.childName, first.child.name);
      expect(view.childrenInCar, 2, reason: 'число детей видно');
      expect(view.seats, hasLength(1), reason: 'а сами дети — только свои');
      expect(view.seats!.single.childId, first.child.id);
    });
  });
}
