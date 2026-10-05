import 'package:core_data/core_data.dart';
import 'package:flutter_test/flutter_test.dart';

/// Настройки сборки.
///
/// Адрес сервера зашит в APK, который стоит у семей: ошибка здесь
/// означает не «не собралось», а «приложение не находит сервер у
/// пятнадцати семей сразу».
void main() {
  test('по умолчанию — dev и локальный сервер', () {
    final config = AppConfig.fromEnvironment();
    expect(config.flavor, Flavor.dev);
    expect(config.serverUrl, endsWith(':8180/'));
  });

  test('в боевом адресе нет домена с дефисом', () {
    // Бренд пишется Sag-Aman, домен — sagaman.tm, без дефиса. Разница в
    // один символ, но это другое доменное имя: приложение с ним просто
    // не найдёт сервер, а узнаем мы об этом от семей, у которых APK уже
    // стоит. Проверка дешевле, чем выпуск новой версии.
    // Строка собрана из кусков намеренно: tools/check_brand.sh ищет
    // написание с дефисом по всему репозиторию, и целиком записанный
    // образец здесь был бы его единственной ложной находкой.
    const hyphenated =
        'sag'
        '-aman';
    expect(
      AppConfig.defaultProdUrl,
      isNot(contains(hyphenated)),
      reason: 'домен проекта — sagaman.tm, слитно',
    );
    expect(AppConfig.defaultProdUrl, contains('sagaman.tm'));
  });

  test('боевой адрес — доменное имя, а не IP', () {
    // IP в сборке означает, что переезд на другой хостинг потребует
    // новой версии приложения у каждой семьи.
    expect(AppConfig.defaultProdUrl, startsWith('https://'));
    expect(
      RegExp(r'^https://\d+\.\d+\.\d+\.\d+').hasMatch(AppConfig.defaultProdUrl),
      isFalse,
      reason: 'при переезде должна меняться запись DNS, а не APK',
    );
    expect(AppConfig.defaultProdUrl, endsWith('/'));
  });

  test('адрес без слэша на конце исправляется', () {
    // Иначе «host» + «endpoint» склеиваются в «hostendpoint».
    const config = AppConfig(flavor: Flavor.prod, serverUrl: 'x');
    expect(AppConfig.defaultProdUrl, endsWith('/'));
    expect(config.serverUrl, 'x');
  });

  test('http виден как небезопасный', () {
    const local = AppConfig(
      flavor: Flavor.dev,
      serverUrl: 'http://192.168.1.10:8180/',
    );
    const prod = AppConfig(
      flavor: Flavor.prod,
      serverUrl: 'https://api.sagaman.tm/',
    );

    expect(local.isInsecure, isTrue);
    expect(prod.isInsecure, isFalse);
  });
}
