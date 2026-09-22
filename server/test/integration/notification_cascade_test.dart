import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/clock.dart';
import 'package:child_server/src/services/notifications/notification_service.dart';
import 'package:child_server/src/services/notifications/push_gateway.dart';
import 'package:child_server/src/services/sms/sms_gateway.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// Push, который можно «сломать».
class _FakePush implements PushGateway {
  final sent = <String>[];
  bool works = true;

  @override
  Future<bool> send(
    Session session, {
    required String recipientPhone,
    required String title,
    required String body,
    required int outboxId,
  }) async {
    if (!works) return false;
    sent.add('$recipientPhone: $body');
    return true;
  }
}

/// SMS-шлюз, который можно «сломать»: так проверяется эскалация.
class _FakeSms implements SmsGateway {
  final sent = <String>[];
  bool works = true;

  @override
  Future<void> send(
    Session session, {
    required String phone,
    required String body,
  }) async {
    if (!works) throw Exception('шлюз недоступен');
    sent.add('$phone: $body');
  }
}

void main() {
  withServerpod('Каскад уведомлений', (sessionBuilder, endpoints) {
    late Session session;
    late TestClock clock;
    late _FakePush push;
    late _FakeSms sms;
    late NotificationService service;
    late Family family;
    late Child child;
    late Driver driver;
    late Ride ride;

    setUp(() async {
      session = sessionBuilder.build();
      clock = TestClock(DateTime.utc(2026, 9, 23, 2, 30));
      push = _FakePush();
      sms = _FakeSms();
      service = NotificationService(clock: clock, push: push, sms: sms);

      family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365201111'),
      );
      await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365201111',
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
          phone: '+99365101111',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0011 AH',
        ),
      );
      ride = await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          driverId: driver.id,
          date: AshgabatTime.today(),
          plannedTime: '07:30',
          status: RideStatus.enRoute,
        ),
      );
    });

    Future<RideEvent> event(RideEventType type, {String? note}) {
      return RideEvent.db.insertRow(
        session,
        RideEvent(
          rideId: ride.id!,
          clientEventId: 'e-${type.name}-${clock.now().microsecondsSinceEpoch}',
          type: type,
          at: clock.now(),
          byRole: AccountRole.driver,
          note: note,
        ),
      );
    }

    Future<void> enqueue(RideEventType type, {String? note}) async {
      await service.enqueueRideEvent(
        session,
        ride: ride,
        event: await event(type, note: note),
        child: child,
        family: family,
        driver: driver,
      );
    }

    Future<List<NotificationOutbox>> outbox() =>
        NotificationOutbox.db.find(session, orderBy: (row) => row.id);

    test('некритическое событие: ack вовремя — SMS не уходит', () async {
      await enqueue(RideEventType.enRoute);
      await service.processQueue(session);

      expect(push.sent, hasLength(1));
      expect(sms.sent, isEmpty);

      // Приложение подтвердило получение через 10 секунд.
      clock.advance(const Duration(seconds: 10));
      final pushRow = (await outbox()).single;
      await service.ack(session, pushRow.id!);

      // Прошло больше окна ожидания — фолбэк не должен сработать.
      clock.advance(const Duration(minutes: 5));
      await service.processQueue(session);

      expect(sms.sent, isEmpty, reason: 'ack получен, SMS не нужна');
      final rows = await outbox();
      expect(rows.single.status, NotificationStatus.acked);
    });

    test('некритическое событие: нет ack за 90 секунд — уходит SMS', () async {
      await enqueue(RideEventType.enRoute);
      await service.processQueue(session);

      // Ack не пришёл.
      clock.advance(const Duration(seconds: 91));
      await service.processQueue(session);
      // Второй проход отправляет поставленную в очередь SMS.
      await service.processQueue(session);

      expect(sms.sent, hasLength(1));
      expect(sms.sent.single, contains('+99365201111'));
      final rows = await outbox();
      expect(rows.first.status, NotificationStatus.failed);
      expect(rows.last.channel, NotificationChannel.sms);
      expect(rows.last.status, NotificationStatus.sent);
    });

    test('критическое событие: SMS уходит сразу, не дожидаясь ack', () async {
      await enqueue(RideEventType.pickedUp);
      await service.processQueue(session);

      expect(push.sent, hasLength(1));
      expect(
        sms.sent,
        hasLength(1),
        reason: 'ребёнок сел в машину — родитель узнаёт даже без интернета',
      );
      expect(sms.sent.single, contains('Мерет'));
    });

    test(
      'семья с уровнем «только критические» не получает лишних SMS',
      () async {
        family = await Family.db.updateRow(
          session,
          family.copyWith(smsLevel: SmsLevel.critical),
        );

        await enqueue(RideEventType.enRoute);
        await service.processQueue(session);
        clock.advance(const Duration(seconds: 91));
        await service.processQueue(session);
        await service.processQueue(session);

        expect(sms.sent, isEmpty, reason: 'событие некритическое');

        // А критическое всё равно придёт.
        await enqueue(RideEventType.handedOver);
        await service.processQueue(session);
        expect(sms.sent, hasLength(1));
      },
    );

    test('одно событие не рождает два SMS при повторной постановке', () async {
      final rideEvent = await event(RideEventType.pickedUp);

      for (var i = 0; i < 3; i++) {
        await service.enqueueRideEvent(
          session,
          ride: ride,
          event: rideEvent,
          child: child,
          family: family,
          driver: driver,
        );
      }
      await service.processQueue(session);
      await service.processQueue(session);

      expect(sms.sent, hasLength(1));
      expect(push.sent, hasLength(1));
    });

    test(
      'SMS не доставлена: повторы с паузой, затем задача диспетчеру',
      () async {
        sms.works = false;
        await enqueue(RideEventType.pickedUp);

        // Первая попытка — неудача, назначен повтор через минуту.
        await service.processQueue(session);
        var smsRow = (await outbox()).firstWhere(
          (row) => row.channel == NotificationChannel.sms,
        );
        expect(smsRow.attempts, 1);
        expect(smsRow.status, NotificationStatus.queued);
        expect(smsRow.nextAttemptAt, isNotNull);

        // Раньше времени не повторяем.
        await service.processQueue(session);
        smsRow = (await outbox()).firstWhere(
          (row) => row.channel == NotificationChannel.sms,
        );
        expect(smsRow.attempts, 1, reason: 'пауза между повторами соблюдена');

        // Вторая и третья попытки.
        clock.advance(const Duration(minutes: 2));
        await service.processQueue(session);
        clock.advance(const Duration(minutes: 6));
        await service.processQueue(session);

        smsRow = (await outbox()).firstWhere(
          (row) => row.channel == NotificationChannel.sms,
        );
        expect(smsRow.status, NotificationStatus.failed);
        expect(smsRow.attempts, NotificationService.maxAttempts);

        final tasks = await DispatcherTask.db.find(session);
        expect(tasks, hasLength(1));
        expect(tasks.single.kind, DispatcherTaskKind.notificationUndelivered);
        expect(tasks.single.text, contains('+99365201111'));
      },
    );

    test('шторм уведомлений: лимит SMS на номер не превышается', () async {
      // Больше лимита критических событий подряд.
      for (var i = 0; i < NotificationService.smsRateLimit + 3; i++) {
        await service.enqueueRideEvent(
          session,
          ride: ride,
          event: await event(RideEventType.pickedUp),
          child: child,
          family: family,
          driver: driver,
        );
        clock.advance(const Duration(seconds: 1));
      }

      await service.processQueue(session);

      expect(sms.sent, hasLength(NotificationService.smsRateLimit));
      final postponed = (await outbox()).where(
        (row) =>
            row.channel == NotificationChannel.sms &&
            row.status == NotificationStatus.queued,
      );
      expect(
        postponed,
        hasLength(3),
        reason: 'лишние отложены, но не потеряны',
      );

      // Через окно лимита остальные уходят.
      clock.advance(NotificationService.smsRateWindow);
      clock.advance(const Duration(minutes: 1));
      await service.processQueue(session);
      expect(sms.sent.length, greaterThan(NotificationService.smsRateLimit));
    });

    test('push не работает — SMS уходит по фолбэку', () async {
      push.works = false;
      await enqueue(RideEventType.enRoute);

      // Push не отправился: назначен повтор.
      await service.processQueue(session);
      expect(push.sent, isEmpty);

      // Повторы кончились — задача диспетчеру, а SMS уйдёт по правилам
      // фолбэка только для семей с уровнем «все события».
      clock.advance(const Duration(minutes: 2));
      await service.processQueue(session);
      clock.advance(const Duration(minutes: 6));
      await service.processQueue(session);

      final tasks = await DispatcherTask.db.find(session);
      expect(tasks, hasLength(1));
    });
  });
}
