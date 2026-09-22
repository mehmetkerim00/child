/// Отступы, радиусы и размеры касаний.
abstract final class ChildSpacing {
  static const xs = 4.0;
  static const s = 8.0;
  static const m = 16.0;
  static const l = 24.0;
  static const xl = 32.0;
}

abstract final class ChildRadius {
  static const card = 16.0;
  static const button = 14.0;
}

abstract final class ChildSizes {
  /// Минимальная высота кнопки в водительском приложении (MVP_PLAN §7):
  /// работа одной рукой, на улице, на солнце.
  static const driverActionMinHeight = 64.0;

  /// Минимальная область касания для остальных кнопок.
  static const minTapTarget = 48.0;
}
