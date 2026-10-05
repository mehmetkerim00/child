import 'default_server_url_io.dart'
    if (dart.library.js_interop) 'default_server_url_web.dart';

/// Среда сборки: `--dart-define=FLAVOR=dev|prod`.
enum Flavor { dev, prod }

/// Настройки приложения, задаваемые при сборке через `--dart-define`.
class AppConfig {
  const AppConfig({required this.flavor, required this.serverUrl});

  /// Адрес боевого сервера.
  ///
  /// Доменное имя, а не IP, и это принципиально: адрес зашит в APK,
  /// который стоит у семей. При переезде на другой хостинг меняется
  /// запись DNS, а не приложение на каждом телефоне — иначе переезд
  /// означает выпуск новой версии и просьбу ко всем её поставить.
  ///
  /// Домен к боевому запуску должен указывать на туркменский хостинг.
  static const defaultProdUrl = 'https://api.sagaman.tm/';

  /// FLAVOR (по умолчанию dev) и SERVER_URL.
  ///
  /// SERVER_URL задаётся при сборке: домашнему тесту — локальный адрес,
  /// боевой сборке — домен. Если не задан, prod берёт боевой домен, а
  /// dev — локальный сервер разработчика.
  factory AppConfig.fromEnvironment() {
    const flavorName = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    const serverUrl = String.fromEnvironment('SERVER_URL');
    final flavor = Flavor.values.asNameMap()[flavorName] ?? Flavor.dev;

    return AppConfig(
      flavor: flavor,
      serverUrl: serverUrl.isNotEmpty
          ? _normalize(serverUrl)
          : (flavor == Flavor.prod ? defaultProdUrl : defaultServerUrl()),
    );
  }

  final Flavor flavor;

  /// Адрес API Serverpod, со слэшем на конце.
  final String serverUrl;

  /// Открытый `http://` — только для домашнего теста.
  ///
  /// Боевая сборка такой адрес не примет: в запросах едут адреса детей и
  /// время, когда их забирают, и отдавать это открытым текстом нельзя.
  bool get isInsecure => serverUrl.startsWith('http://');

  /// Забытый слэш превращает `host/endpoint` в `hostendpoint`.
  static String _normalize(String url) => url.endsWith('/') ? url : '$url/';
}
