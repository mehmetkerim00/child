import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Версия бэкенда. Повышать при каждом релизе.
const serverVersion = '0.1.0';

/// Проверка связи: клиенты вызывают `client.health.ping()`.
class HealthEndpoint extends Endpoint {
  Future<ServerHealth> ping(Session session) async {
    return ServerHealth(
      status: 'ok',
      serverVersion: serverVersion,
      serverTime: DateTime.now().toUtc(),
    );
  }
}
