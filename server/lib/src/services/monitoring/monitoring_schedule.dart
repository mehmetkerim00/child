import 'package:serverpod/serverpod.dart';

import '../../generated/future_calls.dart';

/// Как часто сторож смотрит на сервис.
///
/// Пять минут — столько же, сколько «встала очередь»: чаще смотреть
/// не на что, реже — проблема успеет испортить утро.
const monitorInterval = Duration(minutes: 5);

/// Планирует следующий проход сторожа.
Future<void> scheduleNextMonitorRun(Serverpod pod) async {
  await pod.futureCalls
      .callWithDelay(monitorInterval, identifier: 'monitorSystem')
      .monitor
      .checkSystem();
}
