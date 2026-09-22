import 'package:serverpod/serverpod.dart';

import '../../generated/future_calls.dart';

/// Как часто воркер разбирает очередь уведомлений.
///
/// Минута — компромисс: ack ждём 90 секунд, значит фолбэк на SMS
/// сработает не позже чем через 2,5 минуты после события.
const outboxInterval = Duration(minutes: 1);

/// Планирует следующий проход очереди уведомлений.
Future<void> scheduleNextOutboxRun(Serverpod pod) async {
  await pod.futureCalls
      .callWithDelay(outboxInterval, identifier: 'processOutbox')
      .processOutbox
      .processOutbox();
}
