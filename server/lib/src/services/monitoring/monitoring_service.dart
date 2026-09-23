import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../clock.dart';
import '../notifications/notification_service.dart';

/// Наблюдение за живым сервисом.
///
/// Самое опасное в перевозке детей — тишина (MVP_PLAN §6). Сервер уже
/// ловит тихие сбои конкретных поездок; здесь он следит за собой: не
/// встала ли очередь уведомлений, не перестали ли уходить SMS, не
/// осталась ли поездка без водителя.
///
/// Чего этот класс сделать не может — сообщить о собственном падении.
/// Для этого есть внешний сторож `tools/watchdog.sh`, который живёт на
/// другой машине (docs/monitoring.md).
class MonitoringService {
  MonitoringService({this.clock = const Clock(), NotificationService? notify})
    : notifications = notify ?? NotificationService();

  final Clock clock;
  final NotificationService notifications;

  /// Уведомление, которое ждёт отправки дольше этого, — встала очередь.
  ///
  /// Воркер ходит раз в минуту, ack ждём 90 секунд: пять минут — это
  /// уже не «чуть задержалось».
  static const queueStuckMinutes = 5;

  /// Столько недоставленных за час — шлюз сломан, а не «бывает».
  static const failedPerHourLimit = 5;

  /// Дольше этого SMS идёт слишком долго, чтобы на неё полагаться.
  static const smsLatencyLimitSeconds = 120;

  /// Снимок состояния. Ничего не меняет — можно звать хоть каждую минуту.
  Future<SystemHealth> snapshot(Session session) async {
    final now = clock.now();
    final hourAgo = now.subtract(const Duration(hours: 1));
    final today = AshgabatTime.dateOf(now);
    final tomorrow = AshgabatTime.addDays(today, 1);
    final problems = <String>[];

    var databaseOk = true;
    List<NotificationOutbox> queued = const [];
    List<NotificationOutbox> recent = const [];
    List<Ride> todayRides = const [];
    var openTasks = 0;

    try {
      queued = await NotificationOutbox.db.find(
        session,
        where: (row) => row.status.equals(NotificationStatus.queued),
      );
      recent = await NotificationOutbox.db.find(
        session,
        where: (row) => row.createdAt > hourAgo,
      );
      // Сегодня и завтра: поездка без водителя на завтра — это та самая
      // тишина, которую надо услышать вечером, а не в семь утра.
      todayRides = await Ride.db.find(
        session,
        where: (row) => row.date.equals(today) | row.date.equals(tomorrow),
      );
      openTasks = await DispatcherTask.db.count(
        session,
        where: (row) => row.resolvedAt.equals(null),
      );
    } catch (error) {
      databaseOk = false;
      problems.add('База не отвечает: $error');
    }

    // Возраст самого старого ожидающего: очередь встала или просто занята.
    var oldestMinutes = 0;
    for (final row in queued) {
      final age = now.difference(row.createdAt).inMinutes;
      if (age > oldestMinutes) oldestMinutes = age;
    }

    final sentSms = recent
        .where(
          (row) => row.channel == NotificationChannel.sms && row.sentAt != null,
        )
        .toList();
    final latency = sentSms.isEmpty
        ? 0
        : sentSms
                  .map((row) => row.sentAt!.difference(row.createdAt).inSeconds)
                  .reduce((a, b) => a + b) ~/
              sentSms.length;

    final failed = recent
        .where((row) => row.status == NotificationStatus.failed)
        .length;

    // Отменённые семьёй не считаем: машина им и не нужна.
    final withoutDriver = todayRides
        .where(
          (ride) =>
              ride.driverId == null &&
              ride.status != RideStatus.cancelledByFamily,
        )
        .length;

    if (oldestMinutes >= queueStuckMinutes) {
      problems.add(
        'Очередь уведомлений встала: самое старое ждёт $oldestMinutes мин',
      );
    }
    if (failed >= failedPerHourLimit) {
      problems.add('Не доставлено уведомлений за час: $failed');
    }
    if (latency >= smsLatencyLimitSeconds) {
      problems.add('SMS идут $latency с — на них нельзя полагаться');
    }
    if (withoutDriver > 0) {
      problems.add('Поездок без водителя (сегодня и завтра): $withoutDriver');
    }

    return SystemHealth(
      at: now,
      databaseOk: databaseOk,
      queued: queued.length,
      oldestQueuedMinutes: oldestMinutes,
      failedLastHour: failed,
      smsLastHour: sentSms.length,
      smsLatencySeconds: latency,
      ridesToday: todayRides.length,
      ridesWithoutDriver: withoutDriver,
      openTasks: openTasks,
      problems: problems,
    );
  }

  /// Проход сторожа: если что-то деградировало — зовём людей.
  ///
  /// Задача диспетчеру создаётся с ключом на сутки и на текст проблемы:
  /// одна и та же беда не должна каждую минуту плодить новые задачи и
  /// превращать список в шум, в котором ничего не видно.
  Future<SystemHealth> check(Session session) async {
    final health = await snapshot(session);
    if (health.problems.isEmpty) return health;

    final day = AshgabatTime.dateOf(health.at).toIso8601String();
    final hour = health.at.hour;

    for (final problem in health.problems) {
      await notifications.createTask(
        session,
        kind: DispatcherTaskKind.systemDegraded,
        dedupeKey: 'monitor:$day:$hour:${problem.hashCode}',
        text: problem,
      );
    }

    // Владельцу — только если сервис действительно сыпется: он не должен
    // получать SMS из-за одной поездки без водителя.
    final serious = !health.databaseOk || health.problems.length > 1;
    if (serious) {
      final owners = await OwnerAccount.db.find(
        session,
        where: (row) => row.active.equals(true),
      );
      for (final owner in owners) {
        await notifications.enqueueMessage(
          session,
          dedupeKey: 'monitor-owner:$day:$hour:${owner.id}',
          eventKind: 'system.degraded',
          phone: owner.phone,
          role: AccountRole.owner,
          body: 'Child: сбой сервиса. ${health.problems.join('. ')}',
          critical: true,
        );
      }
    }

    return health;
  }
}
