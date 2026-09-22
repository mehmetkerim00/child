import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
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
        pricePerRide: 0,
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
    final rides = await Ride.db.find(
      session,
      where: (r) => r.childId.inSet(ids) & (r.date >= from) & (r.date <= to),
      orderBy: (r) => r.date,
    );
    return RideViewBuilder.build(session, rides);
  }
}
