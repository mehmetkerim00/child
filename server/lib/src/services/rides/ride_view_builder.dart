import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import 'ride_pool.dart';

/// Собирает поездки вместе с именами ребёнка, водителя и адресами.
///
/// Один проход по справочникам вместо запроса на каждую строку списка.
abstract final class RideViewBuilder {
  /// [onlyChildIds] — фильтр приватности: родителю отдаём только его детей,
  /// водителю и диспетчеру — всех.
  static Future<List<RideView>> build(
    Session session,
    List<Ride> rides, {
    Set<int>? onlyChildIds,
  }) async {
    if (rides.isEmpty) return [];

    final children = await Child.db.find(
      session,
      where: (c) => c.id.inSet(rides.map((r) => r.childId).toSet()),
    );
    final childById = {for (final child in children) child.id!: child};

    final driverIds = rides.map((r) => r.driverId).nonNulls.toSet();
    final drivers = driverIds.isEmpty
        ? <Driver>[]
        : await Driver.db.find(session, where: (d) => d.id.inSet(driverIds));
    final driverById = {for (final driver in drivers) driver.id!: driver};

    final templateIds = rides.map((r) => r.templateId).nonNulls.toSet();
    final templates = templateIds.isEmpty
        ? <RouteTemplate>[]
        : await RouteTemplate.db.find(
            session,
            where: (t) => t.id.inSet(templateIds),
          );
    final templateById = {for (final t in templates) t.id!: t};

    final institutionIds = templates
        .map((t) => t.toInstitutionId)
        .nonNulls
        .toSet();
    final institutions = institutionIds.isEmpty
        ? <Institution>[]
        : await Institution.db.find(
            session,
            where: (i) => i.id.inSet(institutionIds),
          );
    final institutionById = {for (final i in institutions) i.id!: i};

    final seatsByRide = <int, List<RideSeat>>{};
    for (final ride in rides) {
      seatsByRide[ride.id!] = await RidePool.activeSeats(session, ride.id!);
    }

    return [
      for (final ride in rides)
        () {
          final allSeats = seatsByRide[ride.id!] ?? const <RideSeat>[];
          // Родитель видит только своего ребёнка, но знает, сколько
          // всего детей в машине.
          final visibleSeats = onlyChildIds == null
              ? allSeats
              : allSeats
                    .where((seat) => onlyChildIds.contains(seat.childId))
                    .toList();
          final child = visibleSeats.isEmpty
              ? childById[ride.childId]
              : childById[visibleSeats.first.childId] ??
                    childById[ride.childId];
          final template = ride.templateId == null
              ? null
              : templateById[ride.templateId];
          final institution = template?.toInstitutionId == null
              ? null
              : institutionById[template!.toInstitutionId];
          return RideView(
            ride: ride,
            childrenInCar: allSeats.isEmpty ? 1 : allSeats.length,
            seats: visibleSeats,
            childName: child?.name ?? '',
            codeWord: child?.codeWord ?? '',
            fromAddress: template?.fromAddress ?? '',
            toName: institution?.name ?? template?.toAddress ?? '',
            driverName: ride.driverId == null
                ? null
                : driverById[ride.driverId]?.name,
          );
        }(),
    ];
  }
}
