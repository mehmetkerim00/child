/// Статусы поездки из MVP_PLAN.md §6.
///
/// Переходы между статусами (state machine) появятся в S3.
enum RideStatus {
  scheduled,
  confirmed,
  enRoute,
  pickedUp,
  inTransit,
  arrived,
  handedOver,
  delayed,
  cancelledByFamily,
  cancelledNoDriver,
  driverReplaced;

  /// Основной путь поездки — от расписания до передачи ребёнка.
  static const happyPath = [
    scheduled,
    confirmed,
    enRoute,
    pickedUp,
    inTransit,
    arrived,
    handedOver,
  ];

  /// Поездка завершена, дальнейших переходов нет.
  bool get isTerminal =>
      this == handedOver ||
      this == cancelledByFamily ||
      this == cancelledNoDriver;

  /// Отклонение от основного пути (задержка, отмена, замена водителя).
  bool get isException => !happyPath.contains(this);

  /// Можно ли сейчас писать геолокацию.
  ///
  /// Только во время активной поездки: от «Выехал» до «Передал».
  /// До выезда и после передачи ребёнка — ни одной координаты.
  ///
  /// Задержка сюда входит: машина уже в пути, и родителю тем более важно
  /// видеть, где она. Включает геолокацию только приложение водителя и
  /// только после нажатия «Выехал», поэтому задержка до выезда координат
  /// не рождает. Это правило проверяют и приложение, и сервер.
  bool get allowsLocationTracking => const {
    RideStatus.enRoute,
    RideStatus.pickedUp,
    RideStatus.inTransit,
    RideStatus.arrived,
    RideStatus.delayed,
  }.contains(this);
}
