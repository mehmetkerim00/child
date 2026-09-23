import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Полнота переводов во всех трёх языках.
///
/// Забытый ключ — это не «некрасиво»: приложение падает на сборке строк
/// или показывает русскую фразу туркменской семье. Пустая строка хуже
/// забытой — она проходит генерацию и молча даёт пустую кнопку.
///
/// Тест читает сами .arb, а не сгенерированный код: генерация может
/// отстать от файлов, а CI должен ловить расхождение сразу.
void main() {
  const locales = ['ru', 'tk', 'en'];
  const template = 'ru';

  /// Ключ → значение, без служебных записей `@key` и `@@locale`.
  ///
  /// Читается до тестов, поэтому здесь не `expect`, а исключение:
  /// отсутствующий файл должен ронять прогон сразу и понятно.
  Map<String, String> load(String locale) {
    final file = File('lib/l10n/app_$locale.arb');
    if (!file.existsSync()) {
      throw StateError('Нет файла переводов lib/l10n/app_$locale.arb');
    }
    final raw = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    return {
      for (final entry in raw.entries)
        if (!entry.key.startsWith('@')) entry.key: entry.value as String,
    };
  }

  final strings = {for (final locale in locales) locale: load(locale)};
  final expected = strings[template]!;

  /// Подстановки вида {name} в каноническом виде: «amount,count».
  ///
  /// Строкой, а не Set: у множеств в Dart `==` сравнивает ссылки, и
  /// проверка молча считала бы одинаковыми любые два набора.
  String placeholders(String value) {
    final names =
        RegExp(
            r'\{(\w+)\}',
          ).allMatches(value).map((match) => match.group(1)!).toSet().toList()
          ..sort();
    return names.join(',');
  }

  test('русский файл не пуст — иначе проверять нечего', () {
    expect(expected, isNotEmpty);
    expect(expected.length, greaterThan(300));
  });

  for (final locale in locales) {
    group('Язык «$locale»', () {
      test('есть все ключи русского файла', () {
        final missing =
            expected.keys
                .where((key) => !strings[locale]!.containsKey(key))
                .toList()
              ..sort();

        expect(
          missing,
          isEmpty,
          reason:
              'в app_$locale.arb не хватает ${missing.length} ключей: '
              '${missing.take(10).join(', ')}'
              '${missing.length > 10 ? '…' : ''}',
        );
      });

      test('нет лишних ключей', () {
        final extra =
            strings[locale]!.keys
                .where((key) => !expected.containsKey(key))
                .toList()
              ..sort();

        expect(
          extra,
          isEmpty,
          reason:
              'в app_$locale.arb есть ключи, которых нет в русском: '
              '${extra.join(', ')}. Ключ добавляют сначала в app_ru.arb',
        );
      });

      test('нет пустых переводов', () {
        final empty =
            strings[locale]!.entries
                .where((entry) => entry.value.trim().isEmpty)
                .map((entry) => entry.key)
                .toList()
              ..sort();

        expect(
          empty,
          isEmpty,
          reason:
              'пустой перевод показывает пользователю пустое место: '
              '${empty.join(', ')}',
        );
      });

      test('подстановки совпадают с русским', () {
        final broken = <String>[];
        for (final entry in expected.entries) {
          final value = strings[locale]![entry.key];
          if (value == null) continue;
          if (placeholders(value) != placeholders(entry.value)) {
            broken.add(
              '${entry.key}: ждали ${placeholders(entry.value)}, '
              'нашли ${placeholders(value)}',
            );
          }
        }

        expect(
          broken,
          isEmpty,
          reason:
              'потерянная подстановка печатает «{name}» вместо имени: '
              '${broken.join('; ')}',
        );
      });
    });
  }

  test('переводы не скопированы с русского дословно', () {
    // Совпадение допустимо для имён языков, латиницы, цифр и брендов —
    // но если совпадает половина файла, перевода на деле нет.
    for (final locale in locales.where((l) => l != template)) {
      final same = expected.entries
          .where((entry) => strings[locale]![entry.key] == entry.value)
          .length;

      expect(
        same / expected.length,
        lessThan(0.2),
        reason:
            'в app_$locale.arb $same строк дословно совпадают с русским — '
            'похоже, файл заполнен копией, а не переводом',
      );
    }
  });
}
