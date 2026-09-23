import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

/// Пулинг: несколько детей в одной машине.
///
/// Сосед и одноклассник едут вместе — семье дешевле, водителю доходнее
/// (RESEARCH.md). Но безопасность не размывается: каждого ребёнка
/// забирают по кодовому слову его семьи и передают отдельно.
abstract final class RidePool {
  /// Места поездки по порядку посадки.
  static Future<List<RideSeat>> seats(Session session, int rideId) {
    return RideSeat.db.find(
      session,
      where: (seat) => seat.rideId.equals(rideId),
      orderBy: (seat) => seat.pickupOrder,
    );
  }

  /// Активные места: отменённые семьёй не считаются.
  static Future<List<RideSeat>> activeSeats(Session session, int rideId) async {
    final all = await seats(session, rideId);
    return all.where((seat) => seat.cancelledAt == null).toList();
  }

  /// Создаёт место для ребёнка в поездке.
  static Future<RideSeat> addSeat(
    Session session, {
    required int rideId,
    required int childId,
    int? templateId,
    int pickupOrder = 1,
    int seatPriceTenge = 0,
  }) {
    return RideSeat.db.insertRow(
      session,
      RideSeat(
        rideId: rideId,
        childId: childId,
        templateId: templateId,
        pickupOrder: pickupOrder,
        seatPriceTenge: seatPriceTenge,
      ),
    );
  }

  /// Отмечает посадку ребёнка. Возвращает место или null, если его нет.
  static Future<RideSeat?> markPickedUp(
    Session session, {
    required int rideId,
    required int childId,
    required DateTime at,
  }) async {
    final seat = await _seatFor(session, rideId, childId);
    if (seat == null || seat.pickedUpAt != null) return seat;
    return RideSeat.db.updateRow(session, seat.copyWith(pickedUpAt: at));
  }

  /// Отмечает передачу ребёнка принимающему.
  static Future<RideSeat?> markHandedOver(
    Session session, {
    required int rideId,
    required int childId,
    required DateTime at,
  }) async {
    final seat = await _seatFor(session, rideId, childId);
    if (seat == null || seat.handedOverAt != null) return seat;
    return RideSeat.db.updateRow(session, seat.copyWith(handedOverAt: at));
  }

  /// Семья отменила поездку ребёнка на сегодня.
  static Future<RideSeat?> cancelSeat(
    Session session, {
    required int rideId,
    required int childId,
    required DateTime at,
  }) async {
    final seat = await _seatFor(session, rideId, childId);
    if (seat == null) return null;
    return RideSeat.db.updateRow(session, seat.copyWith(cancelledAt: at));
  }

  /// Все ли дети уже в машине.
  static Future<bool> allPickedUp(Session session, int rideId) async {
    final active = await activeSeats(session, rideId);
    return active.isNotEmpty && active.every((seat) => seat.pickedUpAt != null);
  }

  /// Все ли дети переданы — только тогда поездка завершена.
  static Future<bool> allHandedOver(Session session, int rideId) async {
    final active = await activeSeats(session, rideId);
    return active.isNotEmpty &&
        active.every((seat) => seat.handedOverAt != null);
  }

  /// Проверяет, влезет ли ещё один ребёнок в машину водителя.
  ///
  /// Считаются и места, и детские кресла: ребёнок, которому нужно кресло,
  /// не поедет, если кресла заняты.
  static Future<PoolCapacity> capacityFor(
    Session session, {
    required int rideId,
    required Driver driver,
    Child? candidate,
  }) async {
    final active = await activeSeats(session, rideId);
    final children = <Child>[];
    for (final seat in active) {
      final child = await Child.db.findById(session, seat.childId);
      if (child != null) children.add(child);
    }

    final usedSeats = children.length;
    final usedChildSeats = children.where((c) => c.needsChildSeat).length;
    final needsChildSeat = candidate?.needsChildSeat ?? false;

    final seatsLeft = driver.seats - usedSeats;
    final childSeatsLeft = driver.childSeats - usedChildSeats;

    return PoolCapacity(
      seatsLeft: seatsLeft,
      childSeatsLeft: childSeatsLeft,
      fits: seatsLeft > 0 && (!needsChildSeat || childSeatsLeft > 0),
    );
  }

  static Future<RideSeat?> _seatFor(
    Session session,
    int rideId,
    int childId,
  ) {
    return RideSeat.db.findFirstRow(
      session,
      where: (seat) =>
          seat.rideId.equals(rideId) & seat.childId.equals(childId),
    );
  }
}
