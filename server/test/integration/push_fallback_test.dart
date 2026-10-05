import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/clock.dart';
import 'package:child_server/src/services/notifications/notification_service.dart';
import 'package:child_server/src/services/notifications/push_availability.dart';
import 'package:child_server/src/services/notifications/push_gateway.dart';
import 'package:child_server/src/services/sms/sms_gateway.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// Push, который «успешно отправлен» в закрытую сеть.
class _CountingPush implements PushGateway {
  int calls = 0;

  @override
  Future<bool> send(
    Session session, {
    required String recipientPhone,
    required String title,
    required String body,
    required int outboxId,
  }) async {
    calls++;
    return true;
  }
}

class _CapturedSms implements SmsGateway {
  final messages = <String>[];

  @override
  Future<void> send(
    Session session, {
    required String phone,
    required String body,
  }) async {
    messages.add(body);
  }
}

/// План Б: что происходит, когда FCM недоступен.
///
/// Сервис разворачивается на туркменском хостинге, откуда сервисы Google
/// могут быть закрыты. Самое опасное здесь — не отказ, а тишина: push
/// «отправлен успешно» до первого таймаута, и никто ничего не замечает,
/// пока родители не перестанут доверять сервису.
void main() {
  group('Проверка доступности FCM', () {
    test('результат кэшируется, сеть не дёргается на каждое событие', () async {
      var probes = 0;
      final availability = _FakeAvailability(
        answer: true,
        onProbe: () => probes++,
      );

      expect(await availability.isAvailable(), isTrue);
      expect(await availability.isAvailable(), isTrue);
      expect(await availability.isAvailable(), isTrue);

      expect(probes, 1, reason: 'очередь ходит часто, сеть — нет');
    });

    test('после провала перепроверяем чаще, чем после успеха', () {
      final availability = PushAvailability();

      expect(
        availability.recheckAfterFailure,
        lessThan(availability.recheckAfter),
        reason: 'каждый час на плане Б стоит денег за SMS',
      );
    });

    test('недоступный хост — это false, а не исключение', () async {
      // Сервер не должен падать оттого, что FCM закрыт.
      final availability = PushAvailability(
        host: 'fcm.invalid.example',
        timeout: const Duration(milliseconds: 300),
      );

      expect(await availability.probe(), isFalse);
    });
  });

  withServerpod('План Б при недоступном FCM', (sessionBuilder, endpoints) {
    late Session session;
    late TestClock clock;
    late _CountingPush push;
    late _CapturedSms sms;
    late Family family;
    late Parent parent;
    late Child child;
    late Driver driver;
    late Ride ride;

    setUp(() async {
      session = sessionBuilder.build();
      clock = TestClock(DateTime.now().toUtc());
      push = _CountingPush();
      sms = _CapturedSms();

      family = await Family.db.insertRow(
        session,
        Family(name: 'Ниязовы', ownerPhone: '+99365200001'),
      );
      parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365200001',
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
          phone: '+99365100001',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 1234 AH',
          vettingStatus: VettingStatus.verified,
        ),
      );
      ride = await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          driverId: driver.id,
          date: DateTime.utc(2026, 10, 5),
          plannedTime: '07:30',
          status: RideStatus.enRoute,
        ),
      );
    });

    NotificationService service({required bool fcmUp}) => NotificationService(
      clock: clock,
      push: push,
      sms: sms,
      availability: _FakeAvailability(answer: fcmUp),
    );

    Future<void> notify(NotificationService notifications) async {
      final event = await RideEvent.db.insertRow(
        session,
        RideEvent(
          rideId: ride.id!,
          type: RideEventType.enRoute,
          at: clock.now(),
          byRole: AccountRole.driver,
          clientEventId: 'fallback-${clock.now().microsecondsSinceEpoch}',
        ),
      );
      await notifications.enqueueRideEvent(
        session,
        ride: ride,
        event: event,
        child: child,
        family: family,
        driver: driver,
        parents: [parent],
      );
      await notifications.processQueue(session);
    }

    test('FCM доступен — уходит обычный push', () async {
      await notify(service(fcmUp: true));

      expect(push.calls, 1);
      final rows = await NotificationOutbox.db.find(
        session,
        where: (row) => row.channel.equals(NotificationChannel.push),
      );
      expect(rows.single.status, NotificationStatus.sent);
    });

    test(
      'FCM недоступен — push не зовём, уведомление уходит в приложение',
      () async {
        await notify(service(fcmUp: false));

        expect(
          push.calls,
          0,
          reason: 'стучаться в закрытую сеть на каждое событие бессмысленно',
        );

        // Строка очереди всё равно считается доставленной: сервер положил
        // её в канал приложения. Дошла ли — покажет ack, как и с push.
        final rows = await NotificationOutbox.db.find(
          session,
          where: (row) => row.channel.equals(NotificationChannel.push),
        );
        expect(rows.single.status, NotificationStatus.sent);
      },
    );

    test('о переходе на план Б узнаёт диспетчер', () async {
      await notify(service(fcmUp: false));

      final tasks = await DispatcherTask.db.find(
        session,
        where: (task) => task.kind.equals(DispatcherTaskKind.systemDegraded),
      );
      expect(tasks, hasLength(1));
      expect(tasks.single.text, contains('FCM недоступен'));
    });

    test('одна задача в сутки, а не на каждое уведомление', () async {
      final notifications = service(fcmUp: false);
      await notify(notifications);
      clock.advance(const Duration(minutes: 30));
      await notify(notifications);
      clock.advance(const Duration(hours: 2));
      await notify(notifications);

      final tasks = await DispatcherTask.db.find(
        session,
        where: (task) => task.kind.equals(DispatcherTaskKind.systemDegraded),
      );
      expect(
        tasks,
        hasLength(1),
        reason: 'это состояние, а не происшествие: список задач не засыпаем',
      );
    });

    test('критичное событие и на плане Б уходит по SMS', () async {
      final notifications = service(fcmUp: false);
      final event = await RideEvent.db.insertRow(
        session,
        RideEvent(
          rideId: ride.id!,
          type: RideEventType.pickedUp,
          at: clock.now(),
          byRole: AccountRole.driver,
          clientEventId: 'fallback-critical',
        ),
      );
      await notifications.enqueueRideEvent(
        session,
        ride: ride,
        event: event,
        child: child,
        family: family,
        driver: driver,
        parents: [parent],
      );
      await notifications.processQueue(session);

      expect(
        sms.messages.any((m) => m.contains('Мерет')),
        isTrue,
        reason: 'SMS на плане Б — не дубль, а основной канал',
      );
    });

    test('заголовок уведомления — на языке семьи', () async {
      await Family.db.updateRow(session, family.copyWith(locale: 'en'));
      final refreshed = (await Family.db.findById(session, family.id!))!;

      final notifications = service(fcmUp: true);
      final event = await RideEvent.db.insertRow(
        session,
        RideEvent(
          rideId: ride.id!,
          type: RideEventType.enRoute,
          at: clock.now(),
          byRole: AccountRole.driver,
          clientEventId: 'locale-title',
        ),
      );
      await notifications.enqueueRideEvent(
        session,
        ride: ride,
        event: event,
        child: child,
        family: refreshed,
        driver: driver,
        parents: [parent],
      );
      await notifications.processQueue(session);

      // Текст уже был на языке семьи; теперь и заголовок push тоже.
      final rows = await NotificationOutbox.db.find(
        session,
        where: (row) => row.channel.equals(NotificationChannel.push),
      );
      expect(rows.single.body, contains('on the way'));
    });
  });
}

/// Проверка доступности с заранее известным ответом.
class _FakeAvailability extends PushAvailability {
  _FakeAvailability({required this.answer, this.onProbe});

  final bool answer;
  final void Function()? onProbe;

  @override
  Future<bool> probe() async {
    onProbe?.call();
    return answer;
  }
}
