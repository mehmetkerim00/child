import '../../generated/protocol.dart';

/// Тексты уведомлений на языке семьи.
///
/// Собираются на сервере: SMS уходит мимо приложения, поэтому строки
/// не могут жить в core_l10n.
///
/// Язык берётся из `Family.locale` — ru, tk или en. Незнакомый язык
/// молча становится русским: лучше понятное не тому, чем пустое.
///
/// Английские тексты пишутся без апострофов и тире: типографский
/// апостроф и длинное тире не входят в алфавит GSM-7 и переводят всё
/// сообщение в UCS-2, где вместо 160 символов помещается 70. Одна
/// красивая кавычка удваивает счёт за SMS, поэтому фразы строятся так,
/// чтобы апостроф был не нужен. Это проверяется тестом.
abstract final class NotificationTexts {
  /// Языки, на которых сервис говорит с семьёй.
  static const locales = ['ru', 'tk', 'en'];

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

  /// Приводит язык к поддерживаемому.
  static String normalize(String locale) =>
      locales.contains(locale) ? locale : 'ru';

  /// Заголовок push.
  static String title(String locale) => switch (normalize(locale)) {
    'tk' => 'Child: ýol',
    'en' => 'Child: ride',
    _ => 'Child: поездка',
  };

  /// Текст уведомления родителю.
  static String forParent({
    required RideEventType type,
    required String locale,
    required String childName,
    required String driverName,
    required String time,
    String? note,
  }) {
    final lang = normalize(locale);
    final text = switch (type) {
      RideEventType.confirmed => switch (lang) {
        'tk' => '$driverName ertirki ýoly tassyklady',
        'en' => '$driverName confirmed the ride for tomorrow',
        _ => '$driverName подтвердил поездку на завтра',
      },
      RideEventType.enRoute => switch (lang) {
        'tk' => '$driverName $childName üçin ýola çykdy',
        'en' => '$driverName is on the way to $childName',
        _ => '$driverName выехал за $childName',
      },
      RideEventType.pickedUp => switch (lang) {
        'tk' => '$childName awtoulagda, sagat $time',
        'en' => '$childName is in the car, $time',
        _ => '$childName в машине, $time',
      },
      RideEventType.inTransit => switch (lang) {
        'tk' => '$childName ýolda',
        'en' => '$childName is on the way',
        _ => '$childName едет',
      },
      RideEventType.arrived => switch (lang) {
        'tk' => 'Geldiler, sagat $time',
        'en' => 'Arrived, $time',
        _ => 'Приехали, $time',
      },
      RideEventType.handedOver => switch (lang) {
        'tk' => '$childName tabşyryldy, sagat $time',
        'en' => '$childName has been handed over, $time',
        _ => '$childName передан, $time',
      },
      RideEventType.delayed => switch (lang) {
        'tk' => 'Gijikme: ${note ?? ''}',
        'en' => 'Delay: ${note ?? ''}',
        _ => 'Задержка: ${note ?? ''}',
      },
      RideEventType.cancelledByFamily => switch (lang) {
        'tk' => 'Ýol ýatyryldy',
        'en' => 'The ride has been cancelled',
        _ => 'Поездка отменена',
      },
      RideEventType.cancelledNoDriver => switch (lang) {
        'tk' => 'Ýol sürüjisiz galdy, dispetçer çalyşma gözleýär',
        'en' =>
          'The ride has no driver, the dispatcher is finding a replacement',
        _ => 'Поездка осталась без водителя, диспетчер ищет замену',
      },
      RideEventType.driverReplaced => switch (lang) {
        'tk' => 'Sürüji çalyşdy: $driverName',
        'en' => 'The driver has been replaced: $driverName',
        _ => 'Водителя заменили: $driverName',
      },
    };
    return text.trim();
  }

  /// Текст напоминания водителю.
  static String forDriver({
    required String locale,
    required String childName,
    required String time,
  }) => switch (normalize(locale)) {
    'tk' => 'Ertirki ýoly tassyklaň: $childName, sagat $time',
    'en' => 'Confirm the ride for tomorrow: $childName, $time',
    _ => 'Подтвердите поездку на завтра: $childName, $time',
  };
}
