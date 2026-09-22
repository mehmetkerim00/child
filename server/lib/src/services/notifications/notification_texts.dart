import '../../generated/protocol.dart';

/// Тексты уведомлений на языке семьи.
///
/// Собираются на сервере: SMS уходит мимо приложения, поэтому строки
/// не могут жить в core_l10n.
abstract final class NotificationTexts {
  /// События, о которых родитель узнаёт даже без интернета:
  /// SMS по ним уходит сразу, не дожидаясь подтверждения push.
  static const criticalEvents = {
    RideEventType.pickedUp,
    RideEventType.handedOver,
    RideEventType.cancelledByFamily,
    RideEventType.cancelledNoDriver,
    RideEventType.driverReplaced,
  };

  static bool isCritical(RideEventType type) => criticalEvents.contains(type);

  /// Ключ события для очереди: ride.pickedUp.
  static String eventKind(RideEventType type) => 'ride.${type.name}';

  /// Заголовок push.
  static String title(String locale) =>
      locale == 'tk' ? 'Child: ýol' : 'Child: поездка';

  /// Текст уведомления родителю.
  static String forParent({
    required RideEventType type,
    required String locale,
    required String childName,
    required String driverName,
    required String time,
    String? note,
  }) {
    final tk = locale == 'tk';
    final text = switch (type) {
      RideEventType.confirmed =>
        tk
            ? '$driverName ertirki ýoly tassyklady'
            : '$driverName подтвердил поездку на завтра',
      RideEventType.enRoute =>
        tk
            ? '$driverName $childName üçin ýola çykdy'
            : '$driverName выехал за $childName',
      RideEventType.pickedUp =>
        tk
            ? '$childName awtoulagda, sagat $time'
            : '$childName в машине, $time',
      RideEventType.inTransit => tk ? '$childName ýolda' : '$childName едет',
      RideEventType.arrived => tk ? 'Geldiler, sagat $time' : 'Приехали, $time',
      RideEventType.handedOver =>
        tk ? '$childName tabşyryldy, sagat $time' : '$childName передан, $time',
      RideEventType.delayed =>
        tk ? 'Gijikme: ${note ?? ''}' : 'Задержка: ${note ?? ''}',
      RideEventType.cancelledByFamily =>
        tk ? 'Ýol ýatyryldy' : 'Поездка отменена',
      RideEventType.cancelledNoDriver =>
        tk
            ? 'Ýol sürüjisiz galdy, dispetçer çalyşma gözleýär'
            : 'Поездка осталась без водителя, диспетчер ищет замену',
      RideEventType.driverReplaced =>
        tk ? 'Sürüji çalyşdy: $driverName' : 'Водителя заменили: $driverName',
    };
    return text.trim();
  }

  /// Текст напоминания водителю.
  static String forDriver({
    required String locale,
    required String childName,
    required String time,
  }) {
    return locale == 'tk'
        ? 'Ertirki ýoly tassyklaň: $childName, sagat $time'
        : 'Подтвердите поездку на завтра: $childName, $time';
  }
}
