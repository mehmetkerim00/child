import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/money/ledger_service.dart';
import '../services/rides/ride_flow.dart';
import '../services/rides/ride_tracking.dart';
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
        clientEventId: const Uuid().v4(),
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
        clientEventId: const Uuid().v4(),
        type: RideEventType.cancelledNoDriver,
        at: now,
        byRole: AccountRole.driver,
        note: reason.trim(),
      ),
    );
    return declined;
  }

  /// Принимает событие этапа поездки: «Выехал», «Забрал», «Передал» и так
  /// далее. Работает и для событий из офлайн-очереди, отправленных позже.
  Future<Ride> submitEvent(
    Session session,
    int rideId,
    RideEventSubmission submission,
  ) async {
    final ride = await _myRide(session, rideId);
    final child = await Child.db.findById(session, ride.childId);

    // Код учреждения берём из шаблона маршрута поездки.
    final template = ride.templateId == null
        ? null
        : await RouteTemplate.db.findById(session, ride.templateId!);
    final institution = template?.toInstitutionId == null
        ? null
        : await Institution.db.findById(session, template!.toInstitutionId!);

    return RideFlow.applyEvent(
      session,
      ride: ride,
      submission: submission,
      byRole: AccountRole.driver,
      codeWord: child?.codeWord ?? '',
      institutionCode: institution?.handoverCode ?? '',
    );
  }

  /// Приём точек трека от приложения водителя.
  ///
  /// Сервер сам решает, можно ли писать геолокацию: вне активной поездки
  /// точки отбрасываются и приложению возвращается запрет.
  Future<TrackingState> pushLocations(
    Session session,
    int rideId,
    List<RideLocationPoint> points,
  ) async {
    final ride = await _myRide(session, rideId);
    return RideTracking.store(session, ride, points);
  }

  /// События поездки — лента для водителя.
  Future<List<RideEvent>> events(Session session, int rideId) async {
    await _myRide(session, rideId);
    return RideEvent.db.find(
      session,
      where: (e) => e.rideId.equals(rideId),
      orderBy: (e) => e.at,
    );
  }

  /// Семьи из «круга» водителя — кому он может принять наличные.
  Future<List<Family>> myFamilies(Session session) async {
    final driver = await session.requireDriver();
    final circle = await FamilyCircle.db.find(
      session,
      where: (row) => row.driverId.equals(driver.id),
    );
    final ids = circle.map((row) => row.familyId).toSet();
    if (ids.isEmpty) return [];
    return Family.db.find(
      session,
      where: (row) => row.id.inSet(ids),
      orderBy: (row) => row.name,
    );
  }

  /// Водитель принял наличные от родителя.
  ///
  /// Это ещё не зачисление: деньги попадут в книгу операций после
  /// подтверждения диспетчером.
  Future<CashTopUp> recordCashTopUp(
    Session session, {
    required int familyId,
    required int amountTenge,
    bool hasSignature = false,
    String? note,
  }) async {
    final driver = await session.requireDriver();

    // Чужой семье наличные не принимаем.
    final inCircle = await FamilyCircle.db.findFirstRow(
      session,
      where: (row) =>
          row.driverId.equals(driver.id) & row.familyId.equals(familyId),
    );
    if (inCircle == null) {
      throw Exception('Эта семья не закреплена за вами');
    }

    return LedgerService().recordCashTopUp(
      session,
      familyId: familyId,
      driverId: driver.id!,
      amountTenge: amountTenge,
      hasSignature: hasSignature,
      note: note,
    );
  }

  /// Пополнения, которые водитель принял за последние дни.
  Future<List<CashTopUp>> myCashTopUps(Session session) async {
    final driver = await session.requireDriver();
    return CashTopUp.db.find(
      session,
      where: (row) => row.driverId.equals(driver.id),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
      limit: 50,
    );
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
