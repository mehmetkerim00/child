import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/rides/ride_view_builder.dart';
import 'session_subject.dart';

/// Поездки глазами водителя: сегодня, завтра и подтверждение накануне.
///
/// Подтверждение завтрашних поездок — защита от «тихого сбоя»
/// (MVP_PLAN §6): диспетчер узнаёт о проблеме вечером, а не утром.
class RidesEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('driver')};

  /// Поездки водителя на сегодня.
  Future<List<RideView>> today(Session session) async {
    final driver = await session.requireDriver();
    return RideViewBuilder.build(
      session,
      await _ridesOn(session, driver.id!, AshgabatTime.today()),
    );
  }

  /// Поездки водителя на завтра — экран подтверждения.
  Future<List<RideView>> tomorrow(Session session) async {
    final driver = await session.requireDriver();
    return RideViewBuilder.build(
      session,
      await _ridesOn(session, driver.id!, AshgabatTime.tomorrow()),
    );
  }

  /// Водитель подтверждает поездку: «завтра выйду».
  Future<Ride> confirm(Session session, int rideId) async {
    final ride = await _myRide(session, rideId);
    final now = DateTime.now().toUtc();

    final confirmed = await Ride.db.updateRow(
      session,
      ride.copyWith(status: RideStatus.confirmed, confirmedAt: now),
    );
    await RideEvent.db.insertRow(
      session,
      RideEvent(
        rideId: ride.id!,
        type: RideEventType.confirmed,
        at: now,
        byRole: AccountRole.driver,
      ),
    );
    return confirmed;
  }

  /// Водитель не может выйти: причина обязательна и уходит диспетчеру.
  Future<Ride> decline(Session session, int rideId, String reason) async {
    if (reason.trim().isEmpty) {
      throw Exception('Нужно указать причину');
    }
    final ride = await _myRide(session, rideId);
    final now = DateTime.now().toUtc();

    // Поездка остаётся в расписании, но без водителя: диспетчер видит её
    // в красной колонке и назначает резервного из круга семьи.
    final declined = await Ride.db.updateRow(
      session,
      ride.copyWith(
        status: RideStatus.cancelledNoDriver,
        confirmedAt: null,
        driverId: null,
      ),
    );
    await RideEvent.db.insertRow(
      session,
      RideEvent(
        rideId: ride.id!,
        type: RideEventType.cancelledNoDriver,
        at: now,
        byRole: AccountRole.driver,
        note: reason.trim(),
      ),
    );
    return declined;
  }

  /// Местная дата «завтра» по Ашхабаду: приложение не считает её само.
  Future<DateTime> tomorrowDate(Session session) async =>
      AshgabatTime.tomorrow();

  Future<List<Ride>> _ridesOn(Session session, int driverId, DateTime date) {
    return Ride.db.find(
      session,
      where: (r) => r.driverId.equals(driverId) & r.date.equals(date),
      orderBy: (r) => r.plannedTime,
    );
  }

  /// Поездка этого водителя — чужую не отдаём и не меняем.
  Future<Ride> _myRide(Session session, int rideId) async {
    final driver = await session.requireDriver();
    final ride = await Ride.db.findById(session, rideId);
    if (ride == null || ride.driverId != driver.id) {
      throw Exception('Поездка не найдена');
    }
    return ride;
  }
}
