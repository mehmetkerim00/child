// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitleParent => 'Child — родителям';

  @override
  String get appTitleDriver => 'Child — водитель';

  @override
  String get appTitleDispatcher => 'Child — диспетчер';

  @override
  String flavorBadge(String flavor) {
    return 'Среда: $flavor';
  }

  @override
  String get language => 'Язык';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageTk => 'Türkmen';

  @override
  String stubNotice(String sprint) {
    return 'Экран-заглушка. Функциональность появится в спринте $sprint.';
  }

  @override
  String get serverStatusTitle => 'Связь с сервером';

  @override
  String get serverChecking => 'Проверяем…';

  @override
  String serverOk(String version) {
    return 'Сервер работает (версия $version)';
  }

  @override
  String get serverUnavailable => 'Сервер недоступен';

  @override
  String get retry => 'Повторить';

  @override
  String get parentTodayTitle => 'Сегодня';

  @override
  String get parentTodayEmpty => 'Поездок на сегодня нет';

  @override
  String get driverTodayTitle => 'Маршрут дня';

  @override
  String get driverActionDeparted => 'Выехал';

  @override
  String get driverStubAction =>
      'Кнопки этапов поездки заработают в спринте S3';

  @override
  String get dispatcherBoardTitle => 'Доска дня';

  @override
  String get dispatcherBoardEmpty => 'Нет поездок';

  @override
  String get rideStatusScheduled => 'Запланирована';

  @override
  String get rideStatusConfirmed => 'Подтверждена';

  @override
  String get rideStatusEnRoute => 'Водитель выехал';

  @override
  String get rideStatusPickedUp => 'Забрал ребёнка';

  @override
  String get rideStatusInTransit => 'В пути';

  @override
  String get rideStatusArrived => 'Приехали';

  @override
  String get rideStatusHandedOver => 'Передан';

  @override
  String get rideStatusDelayed => 'Задержка';

  @override
  String get rideStatusCancelledByFamily => 'Отменена семьёй';

  @override
  String get rideStatusCancelledNoDriver => 'Отменена: нет водителя';

  @override
  String get rideStatusDriverReplaced => 'Замена водителя';
}
