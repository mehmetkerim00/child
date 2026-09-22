import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Health endpoint', (sessionBuilder, endpoints) {
    test('ping возвращает ok и версию сервера', () async {
      final health = await endpoints.health.ping(sessionBuilder);
      expect(health.status, 'ok');
      expect(health.serverVersion, isNotEmpty);
    });
  });
}
