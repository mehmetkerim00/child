import 'package:serverpod/serverpod.dart';

import '../services/rides/ride_generator.dart';
import '../services/rides/ride_schedule.dart';

/// Ночная задача: создаёт поездки на завтра и переставляет себя
/// на следующую полночь по Ашхабаду.
class GenerateRidesFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) =>
      generateUpcoming(session);

  /// Создаёт поездки и планирует следующий запуск.
  ///
  /// Отдельный метод нужен, чтобы Serverpod сгенерировал типобезопасный
  /// вызов `futureCalls.callAtTime(...).generateRides.generateUpcoming()`.
  Future<void> generateUpcoming(Session session) async {
    final created = await RideGenerator.generateUpcoming(session);
    session.log('Генератор поездок: создано $created');
    await scheduleNextRideGeneration(session.serverpod);
  }
}
