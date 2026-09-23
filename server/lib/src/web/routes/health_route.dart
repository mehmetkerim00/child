import 'dart:convert';

import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../../health/health_endpoint.dart' show serverVersion;

/// Публичная проверка живости: `/health`.
///
/// Её опрашивает внешний сторож с другой машины (`tools/watchdog.sh`):
/// сервер не может сообщить о собственном падении, это должен делать
/// кто-то снаружи.
///
/// Наружу отдаётся минимум — жив ли процесс и отвечает ли база. Длина
/// очереди и расход SMS доступны владельцу в приложении: по открытым
/// счётчикам видно, сколько у сервиса поездок и когда он занят.
class HealthRoute extends Route {
  @override
  Future<Result> handleCall(Session session, Request request) async {
    var databaseOk = true;
    try {
      await Family.db.count(session, limit: 1);
    } catch (_) {
      databaseOk = false;
    }

    final body = {
      'status': databaseOk ? 'ok' : 'degraded',
      'version': serverVersion,
      'time': DateTime.now().toUtc().toIso8601String(),
    };

    return Response(
      databaseOk ? 200 : 503,
      body: Body.fromString(jsonEncode(body), mimeType: MimeType.json),
      headers: Headers.build(
        (mh) => mh.cacheControl = CacheControlHeader(noStore: true),
      ),
    );
  }
}
