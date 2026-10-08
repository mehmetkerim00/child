@TestOn('mac-os')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Сеть iOS-сборок: кому разрешён открытый HTTP.
///
/// То же правило, что у поля адреса на Android, и проверяется так же
/// строго — тестом, а не глазами. Боевая сборка обязана требовать
/// HTTPS: в запросах едут имена детей, адреса и время, когда их
/// забирают. Один забытый ключ в Info.plist снимает это молча, и
/// заметить такое на глаз нельзя.
///
/// Android делает это overlay-манифестом только для hometest; здесь
/// iOS-аналог — отдельный Info.plist, выбираемый по конфигурации.
void main() {
  final prod = File('ios/Runner/Info.plist');
  final hometest = File('ios/Runner/Info-hometest.plist');
  final project = File('ios/Runner.xcodeproj/project.pbxproj');

  /// Грубый разбор plist: нужен факт наличия ключа, а не значение.
  bool hasKey(File file, String key) =>
      file.readAsStringSync().contains('<key>$key</key>');

  group('Боевая сборка', () {
    test('требует HTTPS: исключений ATS нет', () {
      expect(prod.existsSync(), isTrue, reason: 'нет ${prod.path}');
      expect(
        hasKey(prod, 'NSAppTransportSecurity'),
        isFalse,
        reason:
            'в боевом Info.plist не должно быть исключений ATS: '
            'без них iOS сам запрещает открытый HTTP',
      );
    });

    test('не содержит лазеек поимённо', () {
      // Проверяем каждую по отдельности: достаточно одной, чтобы
      // приложение семьи можно было увести на чужой сервер.
      for (final hole in [
        'NSAllowsArbitraryLoads',
        'NSAllowsArbitraryLoadsInWebContent',
        'NSAllowsLocalNetworking',
        'NSExceptionAllowsInsecureHTTPLoads',
      ]) {
        expect(hasKey(prod, hole), isFalse, reason: '«$hole» в боевой сборке');
      }
    });

    test('bundle id без суффикса только у Release', () {
      final text = project.readAsStringSync();
      expect(
        text.contains('PRODUCT_BUNDLE_IDENTIFIER = com.sagaman.parent;'),
        isTrue,
      );
      expect(
        text.contains(
          'PRODUCT_BUNDLE_IDENTIFIER = com.sagaman.parent.hometest;',
        ),
        isTrue,
        reason: 'домашняя сборка обязана ставиться рядом, а не затирать',
      );
    });
  });

  group('Домашняя сборка', () {
    test('HTTP разрешён только в локальную сеть', () {
      expect(hometest.existsSync(), isTrue, reason: 'нет ${hometest.path}');
      expect(hasKey(hometest, 'NSAllowsLocalNetworking'), isTrue);
    });

    test('открытый HTTP куда угодно не разрешён и в ней', () {
      // NSAllowsArbitraryLoads снял бы защиту целиком — это не
      // «домашний тест», это сборка без ATS. Нужен сервер на ноутбуке,
      // а не любой сервер в интернете.
      expect(hasKey(hometest, 'NSAllowsArbitraryLoads'), isFalse);
      expect(hasKey(hometest, 'NSAllowsArbitraryLoadsInWebContent'), isFalse);
    });
  });

  test('два plist расходятся только настройкой сети', () {
    // Файлов два, значит они будут разъезжаться: правку внесут в один.
    // Тест держит их вместе — иначе боевая сборка однажды потеряет
    // разрешение или название, и узнается это после раздачи семьям.
    // Вложенные ключи блока ATS тоже не считаем: он и есть то самое
    // единственное различие, которое разрешено.
    const skip = {
      'NSAppTransportSecurity',
      'NSAllowsLocalNetworking',
      'NSAllowsArbitraryLoads',
      'NSAllowsArbitraryLoadsInWebContent',
      'NSExceptionDomains',
      'NSExceptionAllowsInsecureHTTPLoads',
    };
    List<String> keys(File f) =>
        RegExp(r'<key>([^<]+)</key>')
            .allMatches(f.readAsStringSync())
            .map((m) => m.group(1)!)
            .where((k) => !skip.contains(k))
            .toList()
          ..sort();

    expect(keys(hometest), equals(keys(prod)));
  });
}
