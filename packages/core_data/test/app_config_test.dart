import 'package:core_data/core_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('по умолчанию — dev и локальный сервер', () {
    final config = AppConfig.fromEnvironment();
    expect(config.flavor, Flavor.dev);
    expect(config.serverUrl, endsWith(':8180/'));
  });
}
