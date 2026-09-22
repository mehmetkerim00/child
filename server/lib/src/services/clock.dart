/// Часы сервера.
///
/// Отдельный класс нужен, чтобы в тестах двигать время вперёд: каскад
/// уведомлений завязан на ожидание ack в 90 секунд и паузы между
/// повторами, и ждать их по-настоящему в тестах нельзя.
class Clock {
  const Clock();

  DateTime now() => DateTime.now().toUtc();
}

/// Часы с ручным управлением — для тестов.
class TestClock implements Clock {
  TestClock(this._now);

  DateTime _now;

  @override
  DateTime now() => _now;

  /// Двигает время вперёд.
  void advance(Duration duration) => _now = _now.add(duration);
}
