import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Текущий язык интерфейса. По умолчанию — русский.
///
/// Сохранение выбора между запусками — в S7 (настройки).
final appLocaleProvider = StateProvider<Locale>((ref) => const Locale('ru'));
