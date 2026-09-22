import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

/// Темы приложений, собранные из токенов.
abstract final class ChildTheme {
  static ThemeData light() => _build(Brightness.light);

  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: ChildColors.primary,
      brightness: brightness,
      primary: isDark ? null : ChildColors.primary,
      onPrimary: isDark ? null : ChildColors.onPrimary,
      secondary: ChildColors.accent,
      onSecondary: ChildColors.onAccent,
      error: ChildColors.danger,
      surface: isDark ? ChildColors.surfaceDark : ChildColors.surface,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: ChildTypography.textTheme(scheme.onSurface),
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ChildRadius.card)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(ChildSizes.minTapTarget, ChildSizes.minTapTarget),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ChildRadius.button)),
        ),
      ),
    );
  }
}
