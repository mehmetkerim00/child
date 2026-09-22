import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../clock.dart';
import '../sms/sms_gateway.dart';
import 'notification_texts.dart';
import 'push_gateway.dart';

/// Каскад доставки уведомлений (MVP_PLAN §6).
///
/// Правило проекта: ни одно критическое событие не полагается только на
/// push. Пуши в Туркменистане теряются, поэтому:
/// 1. событие кладётся в очередь для каждого получателя;
/// 2. уходит push, приложение подтверждает получение (ack);
/// 3. нет ack за 90 секунд — уходит SMS;
/// 4. критические события уходят по SMS сразу, не дожидаясь ack;
/// 5. SMS не доставлена после повторов — задача диспетчеру позвонить.
class NotificationService {
  /// Шлюзы по умолчанию берутся из текущей конфигурации сервера,
  /// в тестах подменяются вместе с часами.
  NotificationService({
    this.clock = const Clock(),
    PushGateway? push,
    SmsGateway? sms,
  }) : push = push ?? pushGateway,
       sms = sms ?? smsGateway;

  final Clock clock;
  final PushGateway push;
  final SmsGateway sms;

  /// Сколько ждём подтверждения push, прежде чем слать SMS.
  static const ackWindow = Duration(seconds: 90);

  /// Паузы между повторами: первая почти сразу, дальше реже.
  static const backoff = [
    Duration(minutes: 1),
    Duration(minutes: 5),
    Duration(minutes: 15),
  ];

  /// Больше попыток не делаем — зовём диспетчера.
  static const maxAttempts = 3;

  /// Антишторм: не больше стольких SMS на один номер за окно.
  static const smsRateLimit = 6;
  static const smsRateWindow = Duration(minutes: 15);

  // --- Постановка в очередь -------------------------------------------------

  /// Ставит в очередь уведомления о событии поездки.
  ///
  /// Повторный вызов с тем же событием ничего не дублирует.
  Future<List<NotificationOutbox>> enqueueRideEvent(
    Session session, {
    required Ride ride,
    required RideEvent event,
    required Child child,
    required Family family,
    Driver? driver,
    List<Parent>? parents,
  }) async {
    final recipients =
        parents ??
        await Parent.db.find(
          session,
          where: (p) => p.familyId.equals(family.id),
        );
    if (recipients.isEmpty) return [];

    final critical = NotificationTexts.isCritical(event.type);
    // Семья могла попросить только критические SMS.
    final smsAllowed = critical || family.smsLevel == SmsLevel.all;
    final now = clock.now();
    final localTime = AshgabatTime.toLocal(event.at);
    final time =
        '${localTime.hour.toString().padLeft(2, '0')}:'
        '${localTime.minute.toString().padLeft(2, '0')}';

    final body = NotificationTexts.forParent(
      type: event.type,
      locale: family.locale,
      childName: child.name,
      driverName: driver?.name ?? '',
      time: time,
      note: event.note,
    );

    final created = <NotificationOutbox>[];
    for (final parent in recipients) {
      // Push уходит всегда: он бесплатный и быстрый.
      final pushRow = await _enqueue(
        session,
        dedupeKey: 'event:${event.id}:${parent.id}:push',
        eventKind: NotificationTexts.eventKind(event.type),
        critical: critical,
        phone: parent.phone,
        role: AccountRole.parent,
        channel: NotificationChannel.push,
        body: body,
        rideId: ride.id,
        familyId: family.id,
        now: now,
        // Ждём подтверждения только по некритическим: критические
        // дублируются SMS немедленно.
        ackDeadline: critical ? null : now.add(ackWindow),
      );
      if (pushRow != null) created.add(pushRow);

      if (smsAllowed && critical) {
        final smsRow = await _enqueue(
          session,
          dedupeKey: 'event:${event.id}:${parent.id}:sms',
          eventKind: NotificationTexts.eventKind(event.type),
          critical: true,
          phone: parent.phone,
          role: AccountRole.parent,
          channel: NotificationChannel.sms,
          body: body,
          rideId: ride.id,
          familyId: family.id,
          now: now,
        );
        if (smsRow != null) created.add(smsRow);
      }
    }
    return created;
  }

  /// Ставит в очередь произвольное сообщение (напоминания водителю,
  /// сообщения диспетчера).
  Future<NotificationOutbox?> enqueueMessage(
    Session session, {
    required String dedupeKey,
    required String eventKind,
    required String phone,
    required AccountRole role,
    required String body,
    bool critical = false,
    int? rideId,
    int? familyId,
  }) {
    final now = clock.now();
    return _enqueue(
      session,
      dedupeKey: dedupeKey,
      eventKind: eventKind,
      critical: critical,
      phone: phone,
      role: role,
      channel: NotificationChannel.push,
      body: body,
      rideId: rideId,
      familyId: familyId,
      now: now,
      ackDeadline: critical ? null : now.add(ackWindow),
    );
  }

  /// Ручная SMS из консоли диспетчера: уходит сразу, минуя push.
  Future<NotificationOutbox?> enqueueManualSms(
    Session session, {
    required String phone,
    required String body,
  }) {
    final now = clock.now();
    return _enqueue(
      session,
      dedupeKey: 'manual:${now.microsecondsSinceEpoch}:$phone',
      eventKind: 'dispatcher.manual',
      critical: true,
      phone: phone,
      role: AccountRole.dispatcher,
      channel: NotificationChannel.sms,
      body: body,
      now: now,
    );
  }

  /// Приложение подтвердило получение push — SMS по этому событию не нужна.
  Future<void> ack(Session session, int outboxId) async {
    final row = await NotificationOutbox.db.findById(session, outboxId);
    if (row == null || row.ackedAt != null) return;
    await NotificationOutbox.db.updateRow(
      session,
      row.copyWith(
        ackedAt: clock.now(),
        status: NotificationStatus.acked,
      ),
    );
  }

  // --- Обработка очереди ----------------------------------------------------

  /// Один проход воркера: отправляет готовое, включает SMS-фолбэк,
  /// повторяет неудачное и зовёт диспетчера, когда ничего не помогло.
  ///
  /// Возвращает, сколько строк обработано.
  Future<int> processQueue(Session session) async {
    final now = clock.now();
    var handled = 0;

    // 1. Push без подтверждения — включаем SMS-фолбэк.
    final awaitingAck = await NotificationOutbox.db.find(
      session,
      where: (row) =>
          row.channel.equals(NotificationChannel.push) &
          row.status.equals(NotificationStatus.sent) &
          row.ackedAt.equals(null) &
          (row.ackDeadline <= now),
    );
    for (final row in awaitingAck) {
      await _fallbackToSms(session, row, now);
      handled++;
    }

    // 2. Отправляем всё, чему настало время.
    final pending = await NotificationOutbox.db.find(
      session,
      where: (row) => row.status.equals(NotificationStatus.queued),
      orderBy: (row) => row.createdAt,
    );
    for (final row in pending) {
      final notBefore = row.nextAttemptAt;
      if (notBefore != null && notBefore.isAfter(now)) continue;
      await _deliver(session, row, now);
      handled++;
    }
    return handled;
  }

  Future<void> _deliver(
    Session session,
    NotificationOutbox row,
    DateTime now,
  ) async {
    if (row.channel == NotificationChannel.sms &&
        !await _smsRateLimitAllows(session, row, now)) {
      // Шторм уведомлений: откладываем, но не теряем.
      await NotificationOutbox.db.updateRow(
        session,
        row.copyWith(
          nextAttemptAt: now.add(smsRateWindow),
          lastError: 'Превышен лимит SMS на номер',
        ),
      );
      return;
    }

    var delivered = false;
    String? error;
    try {
      if (row.channel == NotificationChannel.push) {
        delivered = await push.send(
          session,
          recipientPhone: row.recipientPhone,
          title: NotificationTexts.title(
            row.recipientRole == AccountRole.parent ? 'ru' : 'ru',
          ),
          body: row.body,
          outboxId: row.id!,
        );
      } else {
        await sms.send(session, phone: row.recipientPhone, body: row.body);
        delivered = true;
      }
    } catch (e) {
      error = e.toString();
    }

    if (delivered) {
      await NotificationOutbox.db.updateRow(
        session,
        row.copyWith(
          status: NotificationStatus.sent,
          sentAt: now,
          attempts: row.attempts + 1,
          nextAttemptAt: null,
        ),
      );
      return;
    }

    await _retryOrEscalate(session, row, now, error ?? 'Не доставлено');
  }

  /// Повтор с нарастающей паузой, а когда попытки кончились — диспетчеру.
  Future<void> _retryOrEscalate(
    Session session,
    NotificationOutbox row,
    DateTime now,
    String error,
  ) async {
    final attempts = row.attempts + 1;
    if (attempts >= maxAttempts) {
      await NotificationOutbox.db.updateRow(
        session,
        row.copyWith(
          status: NotificationStatus.failed,
          attempts: attempts,
          lastError: error,
          nextAttemptAt: null,
        ),
      );
      await createTask(
        session,
        kind: DispatcherTaskKind.notificationUndelivered,
        dedupeKey: 'undelivered:${row.id}',
        text:
            'Не доставлено ${row.recipientPhone}: «${row.body}». '
            'Нужно позвонить вручную.',
        rideId: row.rideId,
        familyId: row.familyId,
      );
      return;
    }

    await NotificationOutbox.db.updateRow(
      session,
      row.copyWith(
        attempts: attempts,
        status: NotificationStatus.queued,
        lastError: error,
        nextAttemptAt: now.add(backoff[attempts - 1]),
      ),
    );
  }

  /// Push не подтвердили — ставим SMS по тому же событию.
  Future<void> _fallbackToSms(
    Session session,
    NotificationOutbox pushRow,
    DateTime now,
  ) async {
    await NotificationOutbox.db.updateRow(
      session,
      pushRow.copyWith(
        status: NotificationStatus.failed,
        lastError: 'Нет подтверждения за ${ackWindow.inSeconds} с',
      ),
    );

    // Семья могла попросить только критические SMS.
    final family = pushRow.familyId == null
        ? null
        : await Family.db.findById(session, pushRow.familyId!);
    if (family != null &&
        family.smsLevel == SmsLevel.critical &&
        !pushRow.critical) {
      return;
    }

    await _enqueue(
      session,
      dedupeKey: '${pushRow.dedupeKey}:fallback',
      eventKind: pushRow.eventKind,
      critical: pushRow.critical,
      phone: pushRow.recipientPhone,
      role: pushRow.recipientRole,
      channel: NotificationChannel.sms,
      body: pushRow.body,
      rideId: pushRow.rideId,
      familyId: pushRow.familyId,
      now: now,
    );
  }

  /// Сколько SMS уже ушло на этот номер за окно.
  Future<bool> _smsRateLimitAllows(
    Session session,
    NotificationOutbox row,
    DateTime now,
  ) async {
    final since = now.subtract(smsRateWindow);
    final recent = await NotificationOutbox.db.count(
      session,
      where: (r) =>
          r.channel.equals(NotificationChannel.sms) &
          r.recipientPhone.equals(row.recipientPhone) &
          r.status.equals(NotificationStatus.sent) &
          (r.sentAt > since),
    );
    return recent < smsRateLimit;
  }

  // --- Задачи диспетчеру ----------------------------------------------------

  /// Создаёт задачу диспетчеру. Одна и та же проблема не плодит дубликаты.
  Future<DispatcherTask?> createTask(
    Session session, {
    required DispatcherTaskKind kind,
    required String dedupeKey,
    required String text,
    int? rideId,
    int? familyId,
    int? driverId,
  }) async {
    final existing = await DispatcherTask.db.findFirstRow(
      session,
      where: (task) => task.dedupeKey.equals(dedupeKey),
    );
    if (existing != null) return null;

    return DispatcherTask.db.insertRow(
      session,
      DispatcherTask(
        kind: kind,
        text: text,
        rideId: rideId,
        familyId: familyId,
        driverId: driverId,
        dedupeKey: dedupeKey,
        createdAt: clock.now(),
      ),
    );
  }

  /// Вставка в очередь с защитой от дублей.
  Future<NotificationOutbox?> _enqueue(
    Session session, {
    required String dedupeKey,
    required String eventKind,
    required bool critical,
    required String phone,
    required AccountRole role,
    required NotificationChannel channel,
    required String body,
    required DateTime now,
    int? rideId,
    int? familyId,
    DateTime? ackDeadline,
  }) async {
    final existing = await NotificationOutbox.db.findFirstRow(
      session,
      where: (row) => row.dedupeKey.equals(dedupeKey),
    );
    if (existing != null) return null;

    return NotificationOutbox.db.insertRow(
      session,
      NotificationOutbox(
        dedupeKey: dedupeKey,
        eventKind: eventKind,
        critical: critical,
        recipientPhone: phone,
        recipientRole: role,
        channel: channel,
        body: body,
        rideId: rideId,
        familyId: familyId,
        createdAt: now,
        ackDeadline: ackDeadline,
      ),
    );
  }
}
