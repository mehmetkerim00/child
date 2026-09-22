import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../generated/future_calls.dart';

/// Ставит следующий запуск генератора поездок на ближайшую местную
/// полночь (00:05 по Ашхабаду).
Future<void> scheduleNextRideGeneration(Serverpod pod) async {
  final nextLocalDay = AshgabatTime.addDays(AshgabatTime.today(), 1);
  await pod.futureCalls
      .callAtTime(
        AshgabatTime.atLocalTime(nextLocalDay, '00:05'),
        identifier: 'generateRides',
      )
      .generateRides
      .generateUpcoming();
}
