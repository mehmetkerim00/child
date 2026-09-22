import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/rides/ride_tracking.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Трек поездки', (sessionBuilder, endpoints) {
    late Session session;
    late Child child;
    late Driver driver;
    late Ride ride;
    late TestSessionBuilder asDriver;
    late TestSessionBuilder asParent;

    setUp(() async {
      session = sessionBuilder.build();

      final family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365200888'),
      );
      final parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365200888',
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
          phone: '+99365100888',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0008 AH',
        ),
      );
      ride = await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          driverId: driver.id,
          date: AshgabatTime.today(),
          plannedTime: '07:30',
          // Поездка ещё не началась: «Выехал» не нажимали.
          status: RideStatus.confirmed,
        ),
      );

      asDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${driver.id}',
          {const Scope('driver')},
        ),
      );
      asParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${parent.id}',
          {const Scope('parent')},
        ),
      );
    });

    List<RideLocationPoint> points({int count = 2, DateTime? at}) {
      final start = at ?? DateTime.now().toUtc();
      return [
        for (var i = 0; i < count; i++)
          RideLocationPoint(
            at: start.add(Duration(seconds: i * 7)),
            lat: 37.9601 + i * 0.0002,
            lng: 58.3261 + i * 0.0002,
            speedKmh: 34.5,
            accuracyM: 8,
          ),
      ];
    }

    Future<Ride> setStatus(RideStatus status) async {
      final updated = await Ride.db.updateRow(
        session,
        ride.copyWith(status: status),
      );
      ride = updated;
      return updated;
    }

    test('до выезда геолокация не пишется', () async {
      final state = await endpoints.rides.pushLocations(
        asDriver,
        ride.id!,
        points(),
      );

      expect(state.trackingAllowed, isFalse);
      expect(state.accepted, 0);
      expect(await RideLocation.db.find(session), isEmpty);
    });

    test('во время поездки точки сохраняются', () async {
      await setStatus(RideStatus.enRoute);

      final state = await endpoints.rides.pushLocations(
        asDriver,
        ride.id!,
        points(count: 3),
      );

      expect(state.trackingAllowed, isTrue);
      expect(state.accepted, 3);
      final stored = await RideLocation.db.find(session);
      expect(stored, hasLength(3));
      expect(stored.first.rideId, ride.id);
    });

    test('после передачи ребёнка запись прекращается', () async {
      await setStatus(RideStatus.enRoute);
      await endpoints.rides.pushLocations(asDriver, ride.id!, points());

      await setStatus(RideStatus.handedOver);
      final state = await endpoints.rides.pushLocations(
        asDriver,
        ride.id!,
        points(),
      );

      expect(
        state.trackingAllowed,
        isFalse,
        reason: 'приложение должно выключить геолокацию',
      );
      expect(await RideLocation.db.find(session), hasLength(2));
    });

    test('отменённая поездка тоже не пишется', () async {
      await setStatus(RideStatus.cancelledNoDriver);

      final state = await endpoints.rides.pushLocations(
        asDriver,
        ride.id!,
        points(),
      );

      expect(state.trackingAllowed, isFalse);
      expect(await RideLocation.db.find(session), isEmpty);
    });

    test('родитель видит трек своей поездки', () async {
      await setStatus(RideStatus.inTransit);
      await endpoints.rides.pushLocations(asDriver, ride.id!, points(count: 2));

      final track = await endpoints.routes.rideTrack(asParent, ride.id!);

      expect(track, hasLength(2));
      expect(track.first.at.isBefore(track.last.at), isTrue);
    });

    test('чужую поездку родитель не видит', () async {
      final otherFamily = await Family.db.insertRow(
        session,
        Family(name: 'Семья Атаевых', ownerPhone: '+99365200999'),
      );
      final otherParent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: otherFamily.id!,
          phone: '+99365200999',
          name: 'Бегенч',
          role: ParentRole.owner,
        ),
      );
      final asOtherParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${otherParent.id}',
          {const Scope('parent')},
        ),
      );

      await expectLater(
        endpoints.routes.rideTrack(asOtherParent, ride.id!),
        throwsA(isA<Exception>()),
      );
    });

    test('точки старше 30 дней удаляются уборкой', () async {
      await setStatus(RideStatus.inTransit);

      // Свежие точки.
      await endpoints.rides.pushLocations(asDriver, ride.id!, points());
      // Старые точки кладём напрямую: через API их уже не отправить.
      final old = DateTime.now().toUtc().subtract(const Duration(days: 31));
      await RideLocation.db.insert(session, [
        RideLocation(rideId: ride.id!, at: old, lat: 37.95, lng: 58.32),
        RideLocation(
          rideId: ride.id!,
          at: old.add(const Duration(minutes: 1)),
          lat: 37.951,
          lng: 58.321,
        ),
      ]);

      final deleted = await RideTracking.deleteExpired(session);

      expect(deleted, 2);
      final left = await RideLocation.db.find(session);
      expect(left, hasLength(2));
      expect(
        left.every(
          (row) => row.at.isAfter(
            DateTime.now().toUtc().subtract(RideTracking.retention),
          ),
        ),
        isTrue,
      );
    });
  });
}
