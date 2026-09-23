import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Языки интерфейса: русский, туркменский, английский.
///
/// Порядок — как в переключателе: русский первым, потому что на нём
/// говорит и диспетчер, и большинство семей.
const childLocales = <Locale>[Locale('ru'), Locale('tk'), Locale('en')];

/// Язык телефона, если он из наших трёх; иначе русский.
///
/// Родитель, у которого телефон на туркменском, не должен искать
/// переключатель — приложение обязано открыться на его языке сразу.
/// Английский берут те, у кого телефон на английском: в Ашхабаде это
/// обычно иностранные семьи, и русский им не подспорье.
Locale initialLocale([List<Locale>? deviceLocales]) {
  final locales = deviceLocales ?? PlatformDispatcher.instance.locales;
  for (final locale in locales) {
    for (final supported in childLocales) {
      if (locale.languageCode == supported.languageCode) return supported;
    }
  }
  return const Locale('ru');
}

/// Текущий язык интерфейса.
///
/// По умолчанию — язык телефона из поддерживаемых, иначе русский.
/// Выбор пользователя живёт до перезапуска: сохранение настроек —
/// отдельная задача, а язык телефона обычно и есть верный ответ.
final appLocaleProvider = StateProvider<Locale>((ref) => initialLocale());
