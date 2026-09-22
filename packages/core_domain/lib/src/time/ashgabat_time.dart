/// Время проекта — местное время Ашхабада (UTC+5, перевода часов нет).
///
/// Все «сегодня», «завтра» и даты поездок считаются только через эти
/// функции: на сервере в UTC «завтра» наступает на 5 часов позже, и ночной
/// генератор поездок иначе создаёт расписание не на тот день.
abstract final class AshgabatTime {
  /// Смещение Туркменистана от UTC. Постоянное: сезонного перевода
  /// часов в стране нет с 1999 года.
  static const offset = Duration(hours: 5);

  /// Текущее местное время.
  static DateTime now() => toLocal(DateTime.now().toUtc());

  /// Переводит момент времени в местное время Ашхабада.
  ///
  /// Возвращает «стенные часы»: значение помечено как UTC, но содержит
  /// местные час и дату — так с ним безопасно сравнивать даты.
  static DateTime toLocal(DateTime moment) =>
      moment.toUtc().add(offset).copyWithUtc();

  /// Переводит местное время Ашхабада обратно в UTC.
  static DateTime toUtc(DateTime localMoment) => DateTime.utc(
    localMoment.year,
    localMoment.month,
    localMoment.day,
    localMoment.hour,
    localMoment.minute,
    localMoment.second,
  ).subtract(offset);

  /// Местная дата без времени (полночь по Ашхабаду).
  static DateTime dateOf(DateTime moment) {
    final local = toLocal(moment);
    return DateTime.utc(local.year, local.month, local.day);
  }

  /// Сегодняшняя местная дата.
  static DateTime today() => dateOf(DateTime.now().toUtc());

  /// Завтрашняя местная дата.
  static DateTime tomorrow() => addDays(today(), 1);

  /// Дата через [days] дней: считаем по календарю, а не прибавлением
  /// 24 часов, — так безопаснее при любых изменениях смещения.
  static DateTime addDays(DateTime date, int days) =>
      DateTime.utc(date.year, date.month, date.day + days);

  /// День недели по MVP_PLAN §5: 1 — понедельник … 7 — воскресенье.
  static int weekday(DateTime date) => dateOf(date).weekday;

  /// Момент по местным дате и времени «ЧЧ:мм» — в UTC, для хранения в базе.
  static DateTime atLocalTime(DateTime date, String timeHhMm) {
    final parts = timeHhMm.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts.length > 1 ? parts[1] : '0');
    final local = dateOf(date);
    return toUtc(
      DateTime.utc(local.year, local.month, local.day, hour, minute),
    );
  }
}

extension on DateTime {
  /// Помечает значение как UTC, сохраняя цифры даты и времени.
  DateTime copyWithUtc() =>
      DateTime.utc(year, month, day, hour, minute, second, millisecond);
}
