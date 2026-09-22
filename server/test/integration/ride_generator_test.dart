import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/rides/ride_generator.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// 22 сентября 2026 — вторник, 23-е — среда.
final _tuesdayLateUtc = DateTime.utc(2026, 9, 22, 22, 30);
final _wednesdayLocalDate = DateTime.utc(2026, 9, 23);

void main() {
  withServerpod('Генератор поездок', (sessionBuilder, endpoints) {
    late Session session;
    late Child child;
    late Driver driver;

    setUp(() async {
      session = sessionBuilder.build();

      final family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Тестовых', ownerPhone: '+99365200555'),
      );
      child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365100555',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0001 AH',
        ),
      );
    });

    Future<RouteTemplate> template({
      required List<int> weekdays,
      String pickupTime = '07:30',
      bool active = true,
    }) {
      return RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: weekdays,
          pickupTime: pickupTime,
          fromAddress: 'ул. Героглы 1',
          direction: RouteDirection.toInstitution,
          driverId: driver.id,
          pricePerRide: 30,
          active: active,
        ),
      );
    }

    test('поздний вечер вторника в UTC — это уже среда в Ашхабаде', () async {
      // Шаблон на среду. В UTC ещё вторник 22:30, но в Ашхабаде 03:30 среды,
      // поэтому поездка должна создаться именно на среду.
      await template(weekdays: [3]);

      final created = await RideGenerator.generateForDate(
        session,
        _tuesdayLateUtc,
      );

      expect(created, 1);
      final rides = await Ride.db.find(session);
      expect(rides.single.date, _wednesdayLocalDate);
    });

    test('шаблон на вторник в этот момент уже не срабатывает', () async {
      await template(weekdays: [2]);

      final created = await RideGenerator.generateForDate(
        session,
        _tuesdayLateUtc,
      );

      expect(created, 0);
      expect(await Ride.db.find(session), isEmpty);
    });

    test('время подачи и водитель берутся из шаблона', () async {
      await template(weekdays: [3], pickupTime: '06:45');

      await RideGenerator.generateForDate(session, _tuesdayLateUtc);

      final ride = (await Ride.db.find(session)).single;
      expect(ride.plannedTime, '06:45');
      expect(ride.driverId, driver.id);
      expect(ride.childId, child.id);
      expect(ride.status, RideStatus.scheduled);
      // Местное время 06:45 среды — это 01:45 UTC той же даты.
      expect(
        AshgabatTime.atLocalTime(ride.date, ride.plannedTime),
        DateTime.utc(2026, 9, 23, 1, 45),
      );
    });

    test('повторный запуск не создаёт дублей', () async {
      await template(weekdays: [3]);

      final first = await RideGenerator.generateForDate(
        session,
        _tuesdayLateUtc,
      );
      final second = await RideGenerator.generateForDate(
        session,
        _tuesdayLateUtc,
      );

      expect(first, 1);
      expect(second, 0);
      expect(await Ride.db.find(session), hasLength(1));
    });

    test('неактивный шаблон игнорируется', () async {
      await template(weekdays: [3], active: false);

      final created = await RideGenerator.generateForDate(
        session,
        _tuesdayLateUtc,
      );

      expect(created, 0);
    });

    test('generateUpcoming создаёт поездки на сегодня и завтра', () async {
      // Шаблон на все дни недели: попадут обе даты.
      await template(weekdays: [1, 2, 3, 4, 5, 6, 7]);

      final created = await RideGenerator.generateUpcoming(session);

      expect(created, 2);
      final dates = (await Ride.db.find(session)).map((r) => r.date).toSet();
      expect(dates, {AshgabatTime.today(), AshgabatTime.tomorrow()});
    });
  });
}
