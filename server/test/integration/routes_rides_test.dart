import 'package:child_server/src/generated/protocol.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Маршруты и поездки', (sessionBuilder, endpoints) {
    late Session session;
    late Family family;
    late Parent parent;
    late Child child;
    late Driver driver;
    late TestSessionBuilder asParent;
    late TestSessionBuilder asDriver;
    late TestSessionBuilder asDispatcher;

    setUp(() async {
      session = sessionBuilder.build();

      family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365200111'),
      );
      parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365200111',
          name: 'Огулджан',
          role: ParentRole.owner,
        ),
      );
      child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365100111',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0002 AH',
        ),
      );

      // Водитель сдал обучение: без этого маршруты не назначаются.
      await TrainingResult.db.insertRow(
        session,
        TrainingResult(
          driverId: driver.id!,
          correct: 10,
          total: 10,
          passed: true,
        ),
      );

      asParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${parent.id}',
          {const Scope('parent')},
        ),
      );
      asDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${driver.id}',
          {const Scope('driver')},
        ),
      );
      asDispatcher = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'dispatcher:1',
          {const Scope('dispatcher')},
        ),
      );
    });

    RouteTemplate draft({List<int>? weekdays}) => RouteTemplate(
      childId: child.id!,
      weekdays: weekdays ?? [1, 2, 3, 4, 5, 6, 7],
      pickupTime: '07:30',
      fromAddress: 'ул. Героглы 1',
      direction: RouteDirection.toInstitution,
      // Родитель мог бы попробовать назначить водителя и цену сам —
      // сервер обязан их сбросить.
      driverId: driver.id,
      pricePerRideTenge: 999,
      active: true,
    );

    test('заявка родителя создаётся неактивной, без водителя и цены', () async {
      final created = await endpoints.routes.requestRoute(asParent, draft());

      expect(created.active, isFalse);
      expect(created.driverId, isNull);
      expect(created.pricePerRideTenge, 0);
      expect(await endpoints.routes.myRoutes(asParent), hasLength(1));
    });

    test('родитель не может заказать маршрут чужому ребёнку', () async {
      final otherFamily = await Family.db.insertRow(
        session,
        Family(name: 'Семья Атаевых', ownerPhone: '+99365200222'),
      );
      final otherChild = await Child.db.insertRow(
        session,
        Child(familyId: otherFamily.id!, name: 'Сельби', codeWord: 'deňiz'),
      );

      await expectLater(
        endpoints.routes.requestRoute(
          asParent,
          draft()..childId = otherChild.id!,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('активация назначает водителя и сразу создаёт поездки', () async {
      final requested = await endpoints.routes.requestRoute(asParent, draft());

      final activated = await endpoints.directory.activateRoute(
        asDispatcher,
        routeId: requested.id!,
        driverId: driver.id!,
        pricePerRideTenge: 35,
      );

      expect(activated.active, isTrue);
      expect(activated.driverId, driver.id);
      expect(activated.pricePerRideTenge, 35);

      // Поездки созданы на сегодня и завтра по Ашхабаду.
      final rides = await Ride.db.find(session);
      expect(rides.map((r) => r.date).toSet(), {
        AshgabatTime.today(),
        AshgabatTime.tomorrow(),
      });
      expect(await endpoints.rides.tomorrow(asDriver), hasLength(1));
    });

    test('водитель подтверждает завтрашнюю поездку', () async {
      final requested = await endpoints.routes.requestRoute(asParent, draft());
      await endpoints.directory.activateRoute(
        asDispatcher,
        routeId: requested.id!,
        driverId: driver.id!,
        pricePerRideTenge: 35,
      );
      final ride = (await endpoints.rides.tomorrow(asDriver)).single.ride;

      final confirmed = await endpoints.rides.confirm(asDriver, ride.id!);

      expect(confirmed.status, RideStatus.confirmed);
      expect(confirmed.confirmedAt, isNotNull);
      final events = await RideEvent.db.find(
        session,
        where: (e) => e.rideId.equals(ride.id),
      );
      expect(events.single.type, RideEventType.confirmed);
      expect(events.single.byRole, AccountRole.driver);
    });

    test('отказ требует причину и снимает водителя с поездки', () async {
      final requested = await endpoints.routes.requestRoute(asParent, draft());
      await endpoints.directory.activateRoute(
        asDispatcher,
        routeId: requested.id!,
        driverId: driver.id!,
        pricePerRideTenge: 35,
      );
      final ride = (await endpoints.rides.tomorrow(asDriver)).single.ride;

      await expectLater(
        endpoints.rides.decline(asDriver, ride.id!, '   '),
        throwsA(isA<Exception>()),
      );

      final declined = await endpoints.rides.decline(
        asDriver,
        ride.id!,
        'Машина в ремонте',
      );

      expect(declined.status, RideStatus.cancelledNoDriver);
      expect(declined.driverId, isNull);
      final events = await RideEvent.db.find(
        session,
        where: (e) => e.rideId.equals(ride.id),
      );
      expect(events.single.note, 'Машина в ремонте');
    });

    test('чужую поездку водитель не видит и не меняет', () async {
      final otherDriver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365100333',
          name: 'Майя',
          carModel: 'Hyundai',
          carPlate: 'MA 0003 AH',
        ),
      );
      final ride = await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          driverId: otherDriver.id,
          date: AshgabatTime.tomorrow(),
          plannedTime: '07:30',
          status: RideStatus.scheduled,
        ),
      );

      expect(await endpoints.rides.tomorrow(asDriver), isEmpty);
      await expectLater(
        endpoints.rides.confirm(asDriver, ride.id!),
        throwsA(isA<Exception>()),
      );
    });
  });
}
