import 'default_server_url_io.dart'
    if (dart.library.js_interop) 'default_server_url_web.dart';

/// Среда сборки: `--dart-define=FLAVOR=dev|prod`.
enum Flavor { dev, prod }

/// Настройки приложения, задаваемые при сборке через `--dart-define`.
class AppConfig {
  const AppConfig({required this.flavor, required this.serverUrl});

  /// FLAVOR (по умолчанию dev) и SERVER_URL (по умолчанию локальный сервер).
  factory AppConfig.fromEnvironment() {
    const flavorName = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    const serverUrl = String.fromEnvironment('SERVER_URL');
    return AppConfig(
      flavor: Flavor.values.asNameMap()[flavorName] ?? Flavor.dev,
      serverUrl: serverUrl.isEmpty ? defaultServerUrl() : serverUrl,
    );
  }

  final Flavor flavor;

  /// Адрес API Serverpod, со слэшем на конце.
  final String serverUrl;
}
