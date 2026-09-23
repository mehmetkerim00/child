import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/clock.dart';
import 'package:child_server/src/services/monitoring/error_reporter.dart';
import 'package:child_server/src/services/monitoring/monitoring_service.dart';
import 'package:child_server/src/services/notifications/notification_service.dart';
import 'package:child_server/src/services/notifications/push_gateway.dart';
import 'package:child_server/src/services/sms/sms_gateway.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

class _CapturedSms implements SmsGateway {
  final messages = <String>[];

  @override
  Future<void> send(
    Session session, {
    required String phone,
    required String body,
  }) async {
    messages.add('$phone: $body');
  }
}

class _SilentPush implements PushGateway {
  @override
  Future<bool> send(
    Session session, {
    required String recipientPhone,
    required String title,
    required String body,
    required int outboxId,
  }) async => true;
}

/// Сторож сервиса.
///
/// Проверяем не «метрики считаются», а то, что сервис замечает свои
/// поломки сам. Встала очередь уведомлений — значит родители перестали
/// получать «ребёнка забрали», и узнать об этом нужно до вечера.
void main() {
  withServerpod('Мониторинг', (sessionBuilder, endpoints) {
    late Session session;
    late TestClock clock;
    late MonitoringService monitor;
    late _CapturedSms sms;
    late OwnerAccount owner;

    setUp(() async {
      session = sessionBuilder.build();
      // Отсчёт от настоящего момента: эндпоинт владельца работает с
      // обычными часами, и выдуманная дата разошлась бы с ним.
      clock = TestClock(DateTime.now().toUtc());
      sms = _CapturedSms();
      monitor = MonitoringService(
        clock: clock,
        notify: NotificationService(
          clock: clock,
          push: _SilentPush(),
          sms: sms,
        ),
      );

      owner = await OwnerAccount.db.insertRow(
        session,
        OwnerAccount(phone: '+99365001111', name: 'Владелец'),
      );
    });

    Future<NotificationOutbox> queued({
      required Duration age,
      NotificationStatus status = NotificationStatus.queued,
      DateTime? sentAt,
    }) {
      return NotificationOutbox.db.insertRow(
        session,
        NotificationOutbox(
          dedupeKey: 'test:${clock.now().microsecondsSinceEpoch}:$age',
          eventKind: 'ride.pickedUp',
          recipientPhone: '+99365200001',
          recipientRole: AccountRole.parent,
          channel: NotificationChannel.sms,
          status: status,
          body: 'Ребёнка забрали',
          createdAt: clock.now().subtract(age),
          sentAt: sentAt,
        ),
      );
    }

    test('спокойный сервис не поднимает тревогу', () async {
      await queued(
        age: const Duration(minutes: 1),
        status: NotificationStatus.sent,
        sentAt: clock.now(),
      );

      final health = await monitor.check(session);
      await monitor.notifications.processQueue(session);

      expect(health.problems, isEmpty);
      expect(health.databaseOk, isTrue);
      expect(sms.messages, isEmpty, reason: 'владельца не будят без повода');
      expect(await DispatcherTask.db.count(session), 0);
    });

    test('вставшая очередь — это задача диспетчеру', () async {
      await queued(age: const Duration(minutes: 20));

      final health = await monitor.check(session);

      expect(health.queued, 1);
      expect(health.oldestQueuedMinutes, 20);
      expect(health.problems.single, contains('Очередь уведомлений встала'));

      final tasks = await DispatcherTask.db.find(session);
      expect(tasks.single.kind, DispatcherTaskKind.systemDegraded);
    });

    test('одна и та же беда не плодит задачи каждые пять минут', () async {
      await queued(age: const Duration(minutes: 20));

      await monitor.check(session);
      await monitor.check(session);
      await monitor.check(session);

      expect(
        await DispatcherTask.db.count(session),
        1,
        reason: 'список задач должен оставаться читаемым',
      );
    });

    test('медленные SMS видно по задержке', () async {
      final now = clock.now();
      await queued(
        age: const Duration(minutes: 10),
        status: NotificationStatus.sent,
        sentAt: now,
      );

      final health = await monitor.check(session);

      expect(health.smsLastHour, 1);
      expect(health.smsLatencySeconds, 600);
      expect(
        health.problems.any((p) => p.contains('SMS идут')),
        isTrue,
        reason: 'на SMS, которые идут десять минут, полагаться нельзя',
      );
    });

    test('серьёзный сбой будит владельца по SMS', () async {
      // Две разные беды сразу: очередь встала и SMS не уходят.
      await queued(age: const Duration(minutes: 30));
      for (var i = 0; i < MonitoringService.failedPerHourLimit; i++) {
        await queued(
          age: Duration(minutes: 10 + i),
          status: NotificationStatus.failed,
        );
      }

      final health = await monitor.check(session);
      // Критичное уведомление уходит SMS сразу, без ожидания ack, но
      // отправляет его всё та же очередь.
      await monitor.notifications.processQueue(session);

      expect(health.problems.length, greaterThan(1));
      expect(
        sms.messages.where((m) => m.contains(owner.phone)),
        isNotEmpty,
        reason: 'владелец узнаёт о сбое раньше, чем родители',
      );
    });

    test('поездка без водителя — тоже деградация', () async {
      final family = await Family.db.insertRow(
        session,
        Family(name: 'Ниязовы', ownerPhone: '+99365200001'),
      );
      final child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          date: AshgabatTime.dateOf(clock.now()),
          plannedTime: '07:30',
          status: RideStatus.scheduled,
        ),
      );

      final health = await monitor.check(session);

      expect(health.ridesToday, 1);
      expect(health.ridesWithoutDriver, 1);
      expect(health.problems.any((p) => p.contains('без водителя')), isTrue);
    });

    test('поездку без машины на завтра видно уже вечером', () async {
      final family = await Family.db.insertRow(
        session,
        Family(name: 'Аннаевы', ownerPhone: '+99365200002'),
      );
      final child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Айна', codeWord: 'gün'),
      );
      await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          date: AshgabatTime.addDays(AshgabatTime.dateOf(clock.now()), 1),
          plannedTime: '07:30',
          status: RideStatus.cancelledNoDriver,
        ),
      );

      final health = await monitor.check(session);

      expect(
        health.ridesWithoutDriver,
        1,
        reason: 'искать машину надо вечером, а не в семь утра',
      );
    });

    test('владелец видит те же цифры, что и сторож', () async {
      await queued(age: const Duration(minutes: 20));

      final asOwner = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'owner:${owner.id}',
          {const Scope('owner')},
        ),
      );
      final health = await endpoints.owner.systemHealth(asOwner);

      expect(health.queued, 1);
      expect(health.problems, isNotEmpty);
    });
  });

  group('Сборщик ошибок', () {
    test('не роняет то, что наблюдает', () async {
      final result = await reportingErrors<int>(
        () async => throw StateError('обрыв связи с базой'),
        context: 'тест',
      );

      expect(result, isNull, reason: 'ошибка проглочена, но записана');
    });

    test('возвращает результат, когда всё хорошо', () async {
      final result = await reportingErrors<int>(() async => 42);

      expect(result, 42);
    });

    test('в Sentry не уходят телефоны', () {
      final reporter = SentryErrorReporter('https://key@sentry.local/1');

      final safe = reporter.safeMessageForTest(
        Exception('Родитель +99365200001 не найден'),
      );

      expect(safe, contains('<номер>'));
      expect(safe, isNot(contains('65200001')));
    });
  });
}
