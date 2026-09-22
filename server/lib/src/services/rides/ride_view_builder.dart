import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

/// Собирает поездки вместе с именами ребёнка, водителя и адресами.
///
/// Один проход по справочникам вместо запроса на каждую строку списка.
abstract final class RideViewBuilder {
  static Future<List<RideView>> build(
    Session session,
    List<Ride> rides,
  ) async {
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

    return [
      for (final ride in rides)
        () {
          final child = childById[ride.childId];
          final template = ride.templateId == null
              ? null
              : templateById[ride.templateId];
          final institution = template?.toInstitutionId == null
              ? null
              : institutionById[template!.toInstitutionId];
          return RideView(
            ride: ride,
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
