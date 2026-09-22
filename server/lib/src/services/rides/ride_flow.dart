import 'package:core_domain/core_domain.dart' as domain;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../money/ledger_service.dart';
import '../notifications/notification_service.dart';

/// Применение событий поездки на сервере.
///
/// Правила переходов — общие с приложением (core_domain), поэтому события
/// из офлайн-очереди проверяются теми же условиями, что и онлайн.
abstract final class RideFlow {
  /// Переводит тип события в шаг для машины состояний.
  static domain.RideAction? actionOf(RideEventType type) => switch (type) {
    RideEventType.enRoute => domain.RideAction.depart,
    RideEventType.pickedUp => domain.RideAction.pickUp,
    RideEventType.inTransit => domain.RideAction.startTransit,
    RideEventType.arrived => domain.RideAction.arrive,
    RideEventType.handedOver => domain.RideAction.handOver,
    RideEventType.delayed => domain.RideAction.delay,
    RideEventType.cancelledNoDriver => domain.RideAction.cancelNoDriver,
    RideEventType.confirmed ||
    RideEventType.cancelledByFamily ||
    RideEventType.driverReplaced => null,
  };

  static domain.RideStatus toDomain(RideStatus status) =>
      domain.RideStatus.values.byName(status.name);

  static RideStatus fromDomain(domain.RideStatus status) =>
      RideStatus.values.byName(status.name);

  /// Записывает событие и двигает статус поездки.
  ///
  /// Повторная отправка того же события (офлайн-очередь шлёт до успеха)
  /// ничего не меняет и возвращает текущее состояние поездки.
  static Future<Ride> applyEvent(
    Session session, {
    required Ride ride,
    required RideEventSubmission submission,
    required AccountRole byRole,
    required String codeWord,
    required String institutionCode,
    NotificationService? notifications,
    LedgerService? ledger,
  }) async {
    final existing = await RideEvent.db.findFirstRow(
      session,
      where: (e) => e.clientEventId.equals(submission.clientEventId),
    );
    if (existing != null) return ride;

    final action = actionOf(submission.type);
    if (action == null) {
      throw RideFlowException(
        reason: RideFlowError.unsupportedEvent,
        currentStatus: ride.status,
      );
    }

    final step = domain.RideStep(
      action: action,
      // Кодовое слово проверяет сервер: приложение водителя лишь вводит его.
      codeWordMatches:
          submission.codeWord != null &&
          _matches(submission.codeWord!, codeWord),
      institutionCodeMatches:
          submission.institutionCode != null &&
          _matches(submission.institutionCode!, institutionCode),
      hasSignature: submission.hasSignature,
      reason: submission.note,
    );

    final transition = domain.RideStateMachine.apply(
      toDomain(ride.status),
      step,
    );

    if (transition is domain.RideTransitionDenied) {
      throw RideFlowException(
        reason: switch (transition.error) {
          domain.RideTransitionError.rideFinished => RideFlowError.rideFinished,
          domain.RideTransitionError.wrongOrder => RideFlowError.wrongOrder,
          domain.RideTransitionError.codeWordRequired =>
            RideFlowError.wrongCodeWord,
          domain.RideTransitionError.handoverProofRequired =>
            RideFlowError.handoverProofRequired,
          domain.RideTransitionError.reasonRequired =>
            RideFlowError.reasonRequired,
        },
        currentStatus: ride.status,
      );
    }

    final nextStatus = fromDomain(
      (transition as domain.RideTransitionAllowed).status,
    );

    final storedEvent = await RideEvent.db.insertRow(
      session,
      RideEvent(
        rideId: ride.id!,
        clientEventId: submission.clientEventId,
        type: submission.type,
        // Время события — местное время устройства в момент действия:
        // в офлайне оно приходит задним числом.
        at: submission.at.toUtc(),
        byRole: byRole,
        lat: submission.lat,
        lng: submission.lng,
        note: submission.note,
      ),
    );

    final updated = await Ride.db.updateRow(
      session,
      ride.copyWith(
        status: nextStatus,
        driverId: nextStatus == RideStatus.cancelledNoDriver
            ? null
            : ride.driverId,
      ),
    );

    // Поездка состоялась — списываем её стоимость. Повторные события
    // «передал» ничего не спишут: ключ идемпотентности один на поездку.
    if (nextStatus == RideStatus.handedOver) {
      await (ledger ?? LedgerService()).chargeRide(session, updated);
    }

    // Родитель узнаёт о каждом этапе: push, а критические события —
    // ещё и SMS (MVP_PLAN §6).
    await notifyRideEvent(
      session,
      ride: updated,
      event: storedEvent,
      notifications: notifications ?? NotificationService(),
    );

    return updated;
  }

  /// Ставит уведомления о событии поездки в очередь.
  static Future<void> notifyRideEvent(
    Session session, {
    required Ride ride,
    required RideEvent event,
    required NotificationService notifications,
  }) async {
    final child = await Child.db.findById(session, ride.childId);
    if (child == null) return;
    final family = await Family.db.findById(session, child.familyId);
    if (family == null) return;
    final driver = ride.driverId == null
        ? null
        : await Driver.db.findById(session, ride.driverId!);

    await notifications.enqueueRideEvent(
      session,
      ride: ride,
      event: event,
      child: child,
      family: family,
      driver: driver,
    );
  }

  /// Сравнение кодов: регистр и лишние пробелы значения не имеют —
  /// водитель вводит их на улице, в спешке.
  static bool _matches(String input, String expected) =>
      input.trim().toLowerCase() == expected.trim().toLowerCase();
}
