import 'package:flutter/painting.dart';

/// Цветовые токены. Черновая «палитра доверия» — финальную задаст
/// дизайн-концепция (UI-kit); менять значения только здесь.
abstract final class ChildColors {
  /// Спокойный надёжный синий — основной цвет бренда.
  static const primary = Color(0xFF1E5AA8);
  static const onPrimary = Color(0xFFFFFFFF);

  /// Тёплый жёлтый «школьного автобуса» — акценты, внимание.
  static const accent = Color(0xFFF2A33A);
  static const onAccent = Color(0xFF2B1A00);

  /// Семантические цвета статусов поездки.
  static const success = Color(0xFF2E9E5B);
  static const warning = Color(0xFFE0A100);
  static const danger = Color(0xFFD64545);

  static const surface = Color(0xFFF7F8FA);
  static const surfaceDark = Color(0xFF121417);
  static const textPrimary = Color(0xFF1B1F24);
  static const textSecondary = Color(0xFF5A6370);
}
