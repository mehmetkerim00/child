import 'package:core_domain/core_domain.dart' as domain;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

/// Трек поездки: приём точек от водителя и раздача их родителю.
///
/// Геолокация пишется **только во время активной поездки** — от «Выехал»
/// до «Передал». Вне этого окна сервер отклоняет точки, даже если
/// приложение по ошибке продолжит их слать.
abstract final class RideTracking {
  /// Сколько дней храним трек. Дольше он не нужен: разбор спорных
  /// ситуаций укладывается в этот срок, а это данные о перемещении ребёнка.
  static const retention = Duration(days: 30);

  /// Канал трансляции точек родителю.
  static String channelFor(int rideId) => 'ride_location_$rideId';

  /// Правило одно на приложение и сервер — оно живёт в core_domain.
  static bool isTrackable(Ride ride) =>
      domain.RideStatus.values.byName(ride.status.name).allowsLocationTracking;

  /// Сохраняет точки и рассылает последнюю слушателям (родителю).
  ///
  /// Если поездка уже не активна, точки отбрасываются и приложению
  /// возвращается запрет — оно выключит геолокацию.
  static Future<TrackingState> store(
    Session session,
    Ride ride,
    List<RideLocationPoint> points,
  ) async {
    if (!isTrackable(ride)) {
      return TrackingState(trackingAllowed: false, accepted: 0);
    }
    if (points.isEmpty) {
      return TrackingState(trackingAllowed: true, accepted: 0);
    }

    final rows = [
      for (final point in points)
        RideLocation(
          rideId: ride.id!,
          at: point.at.toUtc(),
          lat: point.lat,
          lng: point.lng,
          speedKmh: point.speedKmh,
          accuracyM: point.accuracyM,
        ),
    ]..sort((a, b) => a.at.compareTo(b.at));

    await RideLocation.db.insert(session, rows);

    // Родителю интересна последняя известная позиция машины.
    await session.messages.postMessage(channelFor(ride.id!), rows.last);

    return TrackingState(trackingAllowed: true, accepted: rows.length);
  }

  /// Удаляет точки старше срока хранения. Возвращает число удалённых.
  static Future<int> deleteExpired(Session session) async {
    final threshold = DateTime.now().toUtc().subtract(retention);
    final deleted = await RideLocation.db.deleteWhere(
      session,
      where: (row) => row.at < threshold,
    );
    return deleted.length;
  }
}
