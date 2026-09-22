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
}
