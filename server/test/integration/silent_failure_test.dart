import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/clock.dart';
import 'package:child_server/src/services/notifications/notification_service.dart';
import 'package:child_server/src/services/notifications/silent_failure_watch.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Ловля тихих сбоев', (sessionBuilder, endpoints) {
    late Session session;
    late Child child;
    late Driver driver;

    setUp(() async {
      session = sessionBuilder.build();

      final family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365202222'),
      );
      await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365202222',
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
          phone: '+99365102222',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0022 AH',
        ),
      );
    });

    /// Часы, выставленные на местное время Ашхабада.
    TestClock clockAtLocal(DateTime localMoment) =>
        TestClock(AshgabatTime.toUtc(localMoment));

    Future<Ride> ride({
      required DateTime date,
      required RideStatus status,
      String plannedTime = '07:30',
      int? driverId,
    }) {
      return Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          driverId: driverId ?? driver.id,
          date: date,
          plannedTime: plannedTime,
          status: status,
        ),
      );
    }

    test(
      'после 20:00 неподтверждённая завтрашняя поездка зовёт диспетчера',
      () async {
        // 20:30 по Ашхабаду 23 сентября, поездка на 24-е не подтверждена.
        final clock = clockAtLocal(DateTime.utc(2026, 9, 23, 20, 30));
        final service = NotificationService(clock: clock);
        await ride(
          date: DateTime.utc(2026, 9, 24),
          status: RideStatus.scheduled,
        );

        final problems = await SilentFailureWatch.check(
          session,
          notifications: service,
        );

        expect(problems, 1);
        final tasks = await DispatcherTask.db.find(session);
        expect(tasks.single.kind, DispatcherTaskKind.rideNotConfirmed);
        expect(tasks.single.text, contains('Аман'));

        // Водителю ушло напоминание.
        final reminders = await NotificationOutbox.db.find(
          session,
          where: (row) => row.recipientRole.equals(AccountRole.driver),
        );
        expect(reminders, hasLength(1));
        expect(reminders.single.recipientPhone, driver.phone);
      },
    );

    test('до 20:00 никого не дёргаем', () async {
      final clock = clockAtLocal(DateTime.utc(2026, 9, 23, 19, 30));
      await ride(
        date: DateTime.utc(2026, 9, 24),
        status: RideStatus.scheduled,
      );

      final problems = await SilentFailureWatch.check(
        session,
        notifications: NotificationService(clock: clock),
      );

      expect(problems, 0);
      expect(await DispatcherTask.db.find(session), isEmpty);
    });

    test(
      'подтвердил, но не выехал за 10 минут до подачи — задача диспетчеру',
      () async {
        // Подача в 07:30, сейчас 07:21 по Ашхабаду.
        final clock = clockAtLocal(DateTime.utc(2026, 9, 23, 7, 21));
        final today = AshgabatTime.dateOf(clock.now());
        await ride(date: today, status: RideStatus.confirmed);

        final problems = await SilentFailureWatch.check(
          session,
          notifications: NotificationService(clock: clock),
        );

        expect(problems, 1);
        final tasks = await DispatcherTask.db.find(session);
        expect(tasks.single.kind, DispatcherTaskKind.driverNotDeparted);
      },
    );

    test('выехавшую поездку не трогаем', () async {
      final clock = clockAtLocal(DateTime.utc(2026, 9, 23, 7, 21));
      final today = AshgabatTime.dateOf(clock.now());
      await ride(date: today, status: RideStatus.enRoute);

      final problems = await SilentFailureWatch.check(
        session,
        notifications: NotificationService(clock: clock),
      );

      expect(problems, 0);
    });

    test('повторные проверки не плодят задачи', () async {
      final clock = clockAtLocal(DateTime.utc(2026, 9, 23, 7, 21));
      final today = AshgabatTime.dateOf(clock.now());
      await ride(date: today, status: RideStatus.confirmed);
      final service = NotificationService(clock: clock);

      await SilentFailureWatch.check(session, notifications: service);
      clock.advance(const Duration(minutes: 1));
      await SilentFailureWatch.check(session, notifications: service);

      expect(await DispatcherTask.db.find(session), hasLength(1));
    });
  });
}
