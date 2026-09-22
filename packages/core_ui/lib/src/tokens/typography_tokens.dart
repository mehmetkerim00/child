import 'package:flutter/material.dart';

/// Типографика. Системный шрифт (Roboto на Android): без загрузки
/// шрифтов из сети — интернет у пользователей бывает нестабильным.
abstract final class ChildTypography {
  static TextTheme textTheme(Color color) => TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: color,
    ),
    headlineMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      height: 1.25,
      color: color,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: color,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.35,
      color: color,
    ),
    bodyLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      height: 1.45,
      color: color,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.45,
      color: color,
    ),
    labelLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: color,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: color,
    ),
  );

  /// Надпись на большой кнопке водителя.
  static const driverAction = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
}
