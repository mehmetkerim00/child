import 'generated/app_localizations.dart';

/// Короткие названия дней недели: 1 — понедельник … 7 — воскресенье
/// (как в шаблонах маршрутов, MVP_PLAN §5).
extension WeekdayL10n on AppLocalizations {
  String weekdayShort(int weekday) => switch (weekday) {
    1 => weekdayMon,
    2 => weekdayTue,
    3 => weekdayWed,
    4 => weekdayThu,
    5 => weekdayFri,
    6 => weekdaySat,
    7 => weekdaySun,
    _ => '$weekday',
  };

  /// Перечень дней через запятую: «Пн, Ср, Пт».
  String weekdaysList(List<int> weekdays) {
    final sorted = [...weekdays]..sort();
    return sorted.map(weekdayShort).join(', ');
  }
}
