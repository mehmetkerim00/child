import 'default_server_url_io.dart'
    if (dart.library.js_interop) 'default_server_url_web.dart';

/// Среда сборки: `--dart-define=FLAVOR=dev|hometest|prod`.
///
/// `hometest` — сборка для проверки на домашнем Wi-Fi. Она ставится
/// рядом с обычной, ходит на ноутбук по открытому http и позволяет
/// менять адрес сервера прямо в приложении. Боевой сборке ничего из
/// этого не положено.
enum Flavor { dev, hometest, prod }

/// Настройки приложения, задаваемые при сборке через `--dart-define`.
class AppConfig {
  const AppConfig({required this.flavor, required this.serverUrl});

  /// Адрес боевого сервера.
  ///
  /// Доменное имя, а не IP, и это принципиально: адрес зашит в APK,
  /// который стоит у семей. При переезде на другой хостинг меняется
  /// запись DNS, а не приложение на каждом телефоне — иначе переезд
  /// означает выпуск новой версии и просьбу ко всем её поставить.
  static const defaultProdUrl = 'https://api.sagaman.tm/';

  /// FLAVOR (по умолчанию dev) и SERVER_URL.
  factory AppConfig.fromEnvironment() {
    const flavorName = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    const serverUrl = String.fromEnvironment('SERVER_URL');
    final flavor = Flavor.values.asNameMap()[flavorName] ?? Flavor.dev;

    return AppConfig(
      flavor: flavor,
      serverUrl: serverUrl.isNotEmpty
          ? normalize(serverUrl)
          : (flavor == Flavor.prod ? defaultProdUrl : defaultServerUrl()),
    );
  }

  final Flavor flavor;

  /// Адрес API Serverpod, со слэшем на конце. Это значение из сборки;
  /// в домашнем тесте поверх него может лечь адрес, введённый вручную.
  final String serverUrl;

  /// Можно ли задать адрес сервера прямо в приложении.
  ///
  /// Только в домашней сборке. Дома роутер выдаёт ноутбуку новый адрес
  /// после каждой перезагрузки, и пересобирать из-за этого APK на двух
  /// телефонах — абсурд.
  ///
  /// В боевой сборке поля нет и быть не может: подменив адрес, можно
  /// увести приложение семьи на чужой сервер, а там имена детей, адреса
  /// и время, когда их забирают.
  bool get canOverrideServer => flavor == Flavor.hometest;

  /// Открытый `http://` — только для домашнего теста.
  bool get isInsecure => serverUrl.startsWith('http://');

  /// Забытый слэш превращает `host/endpoint` в `hostendpoint`.
  static String normalize(String url) {
    final trimmed = url.trim();
    return trimmed.endsWith('/') ? trimmed : '$trimmed/';
  }

  /// Похоже ли на адрес сервера. Проверка грубая намеренно: человек
  /// вводит её с телефона, и отказ должен быть понятным, а не строгим.
  static bool looksValid(String url) {
    final uri = Uri.tryParse(normalize(url));
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }
}
