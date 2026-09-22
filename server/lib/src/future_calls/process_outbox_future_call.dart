import 'package:serverpod/serverpod.dart';

import '../services/notifications/notification_service.dart';
import '../services/notifications/outbox_schedule.dart';
import '../services/notifications/silent_failure_watch.dart';

/// Воркер очереди уведомлений: работает раз в минуту.
///
/// Он и отправляет push/SMS, и ловит «тихие сбои» — всё, что должно
/// случиться само, без участия человека.
class ProcessOutboxFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) =>
      processOutbox(session);

  /// Один проход очереди и проверок, затем планирование следующего.
  Future<void> processOutbox(Session session) async {
    final notifications = NotificationService();
    final handled = await notifications.processQueue(session);
    final problems = await SilentFailureWatch.check(
      session,
      notifications: notifications,
    );
    if (handled > 0 || problems > 0) {
      session.log('Очередь уведомлений: $handled, задач диспетчеру: $problems');
    }
    await scheduleNextOutboxRun(session.serverpod);
  }
}
