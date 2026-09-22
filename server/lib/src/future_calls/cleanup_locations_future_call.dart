import 'package:serverpod/serverpod.dart';

import '../services/rides/ride_schedule.dart';
import '../services/rides/ride_tracking.dart';

/// Ежедневная уборка: удаляет точки трека старше срока хранения.
///
/// Трек ребёнка не должен лежать в базе дольше, чем нужно для разбора
/// спорных ситуаций (30 дней).
class CleanupLocationsFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) =>
      cleanupLocations(session);

  /// Удаляет устаревшие точки и планирует следующую уборку.
  Future<void> cleanupLocations(Session session) async {
    final deleted = await RideTracking.deleteExpired(session);
    session.log('Уборка трека: удалено точек $deleted');
    await scheduleNextLocationCleanup(session.serverpod);
  }
}
