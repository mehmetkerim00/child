import 'package:serverpod/serverpod.dart';

import '../services/monitoring/monitoring_schedule.dart';
import '../services/monitoring/monitoring_service.dart';
import '../services/security/rate_limiter.dart';

/// Сторож сервиса: раз в пять минут смотрит, не сыплется ли что-нибудь.
///
/// Он живёт внутри сервера и потому не может сообщить о его падении —
/// для этого есть внешний `tools/watchdog.sh` на другой машине
/// (docs/monitoring.md).
class MonitorFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) =>
      checkSystem(session);

  /// Один проход проверок и планирование следующего.
  Future<void> checkSystem(Session session) async {
    final health = await MonitoringService().check(session);
    if (health.problems.isNotEmpty) {
      session.log(
        'Мониторинг: ${health.problems.join('; ')}',
        level: LogLevel.warning,
      );
    }

    // Заодно убираем старые отметки ограничителя частоты: отдельная
    // задача ради одного DELETE не нужна.
    await RateLimiter().cleanup(session);

    await scheduleNextMonitorRun(session.serverpod);
  }
}
