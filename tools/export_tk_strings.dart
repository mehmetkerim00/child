// Выгружает все туркменские строки интерфейса для вычитки носителем языка.
//
// Запуск: dart tools/export_tk_strings.dart
// Результат: docs/tk-review.md — таблица «ключ | русский | туркменский».
import 'dart:convert';
import 'dart:io';

void main() {
  final root = Directory.current.path;
  final ru = _load('$root/packages/core_l10n/lib/l10n/app_ru.arb');
  final tk = _load('$root/packages/core_l10n/lib/l10n/app_tk.arb');

  final buffer = StringBuffer()
    ..writeln('# Туркменские строки — на вычитку')
    ..writeln()
    ..writeln(
      'Строки написаны без носителя языка (машинный перевод и словарь).',
    )
    ..writeln(
      '**До пилота их должен проверить человек, говорящий по-туркменски.**',
    )
    ..writeln()
    ..writeln('Как читать таблицу:')
    ..writeln()
    ..writeln('- «Ключ» — техническое имя, его менять не нужно.')
    ..writeln('- «Русский» — исходный смысл.')
    ..writeln('- «Туркменский» — то, что сейчас видит пользователь.')
    ..writeln('- В колонке «Правка» напишите верный вариант или «ок».')
    ..writeln()
    ..writeln('Фигурные скобки вроде `{name}` — подстановка (имя, время,')
    ..writeln('количество). Их нужно сохранить в переводе как есть.')
    ..writeln()
    ..writeln('Всего строк: ${tk.length}')
    ..writeln()
    ..writeln('| Ключ | Русский | Туркменский | Правка |')
    ..writeln('|---|---|---|---|');

  for (final key in tk.keys) {
    final russian = _escape(ru[key] ?? '');
    final turkmen = _escape(tk[key] ?? '');
    buffer.writeln('| `$key` | $russian | $turkmen | |');
  }

  final out = File('$root/docs/tk-review.md')..writeAsStringSync('$buffer');
  stdout.writeln('Готово: ${out.path} (${tk.length} строк)');
}

Map<String, String> _load(String path) {
  final json =
      jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
  return {
    for (final entry in json.entries)
      // Ключи, начинающиеся с @, — служебные описания, не строки интерфейса.
      if (!entry.key.startsWith('@') && entry.value is String)
        entry.key: entry.value as String,
  };
}

/// Экранирует символы, ломающие таблицу Markdown.
String _escape(String value) =>
    value.replaceAll('|', '\\|').replaceAll('\n', ' ');
