import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/money/ledger_service.dart';
import '../services/notifications/notification_service.dart';
import '../services/rides/ride_tracking.dart';
import '../services/rides/ride_view_builder.dart';
import 'session_subject.dart';

/// Маршруты глазами родителя: заявка и свои маршруты (MVP_PLAN §7).
///
/// Активирует заявки диспетчер — в DirectoryEndpoint.
class RoutesEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('parent')};

  /// Заявка родителя на регулярный маршрут. Активной её делает диспетчер.
  Future<RouteTemplate> requestRoute(
    Session session,
    RouteTemplate draft,
  ) async {
    final parent = await session.requireParent();
    final child = await Child.db.findById(session, draft.childId);
    if (child == null || child.familyId != parent.familyId) {
      throw Exception('Ребёнок не из вашей семьи');
    }

    return RouteTemplate.db.insertRow(
      session,
      draft.copyWith(
        id: null,
        // Водителя и цену назначает диспетчер при активации.
        driverId: null,
        pricePerRideTenge: 0,
        active: false,
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  /// Маршруты детей вошедшего родителя.
  Future<List<RouteTemplate>> myRoutes(Session session) async {
    final parent = await session.requireParent();
    final children = await Child.db.find(
      session,
      where: (c) => c.familyId.equals(parent.familyId),
    );
    final ids = children.map((c) => c.id!).toList();
    if (ids.isEmpty) return [];
    return RouteTemplate.db.find(
      session,
      where: (t) => t.childId.inSet(ids.toSet()),
      orderBy: (t) => t.pickupTime,
    );
  }

  /// События поездки своего ребёнка — лента «что происходило».
  Future<List<RideEvent>> rideEvents(Session session, int rideId) async {
    await _requireOwnRide(session, rideId);
    return RideEvent.db.find(
      session,
      where: (e) => e.rideId.equals(rideId),
      orderBy: (e) => e.at,
    );
  }

  /// Трек поездки ребёнка: путь, который уже проехали.
  Future<List<RideLocation>> rideTrack(Session session, int rideId) async {
    await _requireOwnRide(session, rideId);
    return RideLocation.db.find(
      session,
      where: (row) => row.rideId.equals(rideId),
      orderBy: (row) => row.at,
    );
  }

  /// Положение машины в реальном времени (WebSocket).
  ///
  /// Поток живёт, пока открыт экран поездки: родитель видит машину,
  /// пока она едет.
  Stream<RideLocation> watchRideLocation(Session session, int rideId) async* {
    await _requireOwnRide(session, rideId);

    // Сначала отдаём последнюю известную точку, чтобы карта не была пустой.
    final last = await RideLocation.db.findFirstRow(
      session,
      where: (row) => row.rideId.equals(rideId),
      orderBy: (row) => row.at,
      orderDescending: true,
    );
    if (last != null) yield last;

    yield* session.messages.createStream<RideLocation>(
      RideTracking.channelFor(rideId),
    );
  }

  /// Поездка принадлежит ребёнку из семьи вошедшего родителя.
  Future<Ride> _requireOwnRide(Session session, int rideId) async {
    final parent = await session.requireParent();
    final ride = await Ride.db.findById(session, rideId);
    if (ride == null) throw Exception('Поездка не найдена');

    // Ребёнок семьи может ехать в общей машине: проверяем места.
    final children = await Child.db.find(
      session,
      where: (c) => c.familyId.equals(parent.familyId),
    );
    final ids = children.map((child) => child.id!).toSet();
    final seat = await RideSeat.db.findFirstRow(
      session,
      where: (row) => row.rideId.equals(rideId) & row.childId.inSet(ids),
    );
    if (seat == null && !ids.contains(ride.childId)) {
      throw Exception('Поездка не вашего ребёнка');
    }
    return ride;
  }

  /// Баланс семьи: остаток, ожидающие пополнения и история операций.
  Future<BalanceView> myBalance(Session session) async {
    final parent = await session.requireParent();
    return LedgerService().balanceView(session, parent.familyId);
  }

  /// Лента уведомлений семьи: что и когда отправляли.
  Future<List<NotificationOutbox>> myNotifications(Session session) async {
    final parent = await session.requireParent();
    return NotificationOutbox.db.find(
      session,
      where: (row) => row.familyId.equals(parent.familyId),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
      limit: 100,
    );
  }

  /// Приложение подтверждает получение push: SMS по этому событию
  /// больше не нужна.
  Future<void> ackNotification(Session session, int outboxId) async {
    final parent = await session.requireParent();
    final row = await NotificationOutbox.db.findById(session, outboxId);
    if (row == null || row.familyId != parent.familyId) return;
    await NotificationService().ack(session, outboxId);
  }

  /// Учреждения — родитель выбирает, куда возить ребёнка.
  Future<List<Institution>> institutions(Session session) =>
      Institution.db.find(session, orderBy: (i) => i.name);

  /// Поездки детей семьи на сегодня и завтра (по Ашхабаду).
  Future<List<RideView>> myUpcomingRides(Session session) async {
    final parent = await session.requireParent();
    final children = await Child.db.find(
      session,
      where: (c) => c.familyId.equals(parent.familyId),
    );
    final ids = children.map((c) => c.id!).toSet();
    if (ids.isEmpty) return [];

    final from = AshgabatTime.today();
    final to = AshgabatTime.tomorrow();
    // В пуле ребёнок может ехать в чужой поездке: ищем по местам.
    final seats = await RideSeat.db.find(
      session,
      where: (seat) => seat.childId.inSet(ids),
    );
    final rideIds = seats.map((seat) => seat.rideId).toSet();

    final rides = await Ride.db.find(
      session,
      where: (r) =>
          (r.childId.inSet(ids) | r.id.inSet(rideIds)) &
          (r.date >= from) &
          (r.date <= to),
      orderBy: (r) => r.date,
    );
    // Родитель видит только своих детей — чужие имена и адреса скрыты.
    return RideViewBuilder.build(session, rides, onlyChildIds: ids);
  }
}
