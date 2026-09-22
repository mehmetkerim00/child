import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import 'notification_service.dart';
import 'notification_texts.dart';

/// Ловля «тихих сбоев» (MVP_PLAN §6).
///
/// Самое опасное в перевозке ребёнка — не авария, а тишина: водитель
/// заболел и не вышел, а узнают об этом, когда ребёнок остался у подъезда.
/// Поэтому сервер сам проверяет расписание и зовёт диспетчера заранее.
abstract final class SilentFailureWatch {
  /// До этого часа водитель должен подтвердить завтрашние поездки.
  static const confirmDeadlineHour = 20;

  /// За сколько до времени подачи ждём статус «Выехал».
  static const departureGrace = Duration(minutes: 10);

  /// Один проход: напоминания водителям и задачи диспетчеру.
  static Future<int> check(
    Session session, {
    required NotificationService notifications,
  }) async {
    final now = notifications.clock.now();
    var problems = 0;

    problems += await _checkTomorrowConfirmations(session, notifications, now);
    problems += await _checkDepartures(session, notifications, now);
    return problems;
  }

  /// После 20:00 неподтверждённая завтрашняя поездка — уже проблема.
  static Future<int> _checkTomorrowConfirmations(
    Session session,
    NotificationService notifications,
    DateTime now,
  ) async {
    final local = AshgabatTime.toLocal(now);
    if (local.hour < confirmDeadlineHour) return 0;

    final tomorrow = AshgabatTime.addDays(AshgabatTime.dateOf(now), 1);
    // И неподтверждённые, и те, от которых водитель уже отказался:
    // к утру обе ситуации означают, что ребёнка некому везти.
    final rides = await Ride.db.find(
      session,
      where: (r) =>
          r.date.equals(tomorrow) &
          (r.status.equals(RideStatus.scheduled) |
              r.status.equals(RideStatus.cancelledNoDriver)),
    );

    var count = 0;
    for (final ride in rides) {
      final child = await Child.db.findById(session, ride.childId);
      final driver = ride.driverId == null
          ? null
          : await Driver.db.findById(session, ride.driverId!);

      // Водителю — напоминание, диспетчеру — задача.
      if (driver != null && child != null) {
        await notifications.enqueueMessage(
          session,
          dedupeKey: 'confirm-reminder:${ride.id}',
          eventKind: 'ride.confirmReminder',
          phone: driver.phone,
          role: AccountRole.driver,
          critical: true,
          body: NotificationTexts.forDriver(
            locale: 'ru',
            childName: child.name,
            time: ride.plannedTime,
          ),
          rideId: ride.id,
        );
      }

      await notifications.createTask(
        session,
        kind: ride.driverId == null
            ? DispatcherTaskKind.rideWithoutDriver
            : DispatcherTaskKind.rideNotConfirmed,
        dedupeKey: 'not-confirmed:${ride.id}',
        text: ride.driverId == null
            ? 'Поездка ${ride.plannedTime} '
                  '(${child?.name ?? ''}) осталась без водителя на завтра.'
            : 'Водитель ${driver?.name ?? ''} не подтвердил поездку '
                  '${ride.plannedTime} (${child?.name ?? ''}) на завтра.',
        rideId: ride.id,
        driverId: ride.driverId,
        familyId: child?.familyId,
      );
      count++;
    }
    return count;
  }

  /// Подтвердил, но не выехал за 10 минут до подачи — зовём диспетчера
  /// раньше, чем проблему заметит родитель.
  static Future<int> _checkDepartures(
    Session session,
    NotificationService notifications,
    DateTime now,
  ) async {
    final today = AshgabatTime.dateOf(now);
    final rides = await Ride.db.find(
      session,
      where: (r) =>
          r.date.equals(today) &
          (r.status.equals(RideStatus.confirmed) |
              r.status.equals(RideStatus.scheduled)),
    );

    var count = 0;
    for (final ride in rides) {
      final plannedUtc = AshgabatTime.atLocalTime(ride.date, ride.plannedTime);
      if (now.isBefore(plannedUtc.subtract(departureGrace))) continue;

      final child = await Child.db.findById(session, ride.childId);
      final driver = ride.driverId == null
          ? null
          : await Driver.db.findById(session, ride.driverId!);

      await notifications.createTask(
        session,
        kind: DispatcherTaskKind.driverNotDeparted,
        dedupeKey: 'not-departed:${ride.id}',
        text:
            'Водитель ${driver?.name ?? 'не назначен'} не выехал на поездку '
            '${ride.plannedTime} (${child?.name ?? ''}).',
        rideId: ride.id,
        driverId: ride.driverId,
        familyId: child?.familyId,
      );
      count++;
    }
    return count;
  }
}
