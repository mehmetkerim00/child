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

  @override
  String get loginTitle => 'Вход';

  @override
  String get loginPhoneLabel => 'Номер телефона';

  @override
  String get loginPhoneHint => '65 12-34-56';

  @override
  String get loginRequestCode => 'Получить код';

  @override
  String get loginCodeLabel => 'Код из SMS';

  @override
  String get loginVerify => 'Войти';

  @override
  String get loginChangePhone => 'Изменить номер';

  @override
  String loginCodeSentTo(String phone) {
    return 'Код отправлен на $phone';
  }

  @override
  String get loginHint =>
      'Номер заводит диспетчер. Если войти не получается — позвоните ему.';

  @override
  String get loginDevSeed => 'Заполнить тестовыми данными';

  @override
  String get loginDevSeedDone =>
      'Готово. Диспетчер: 65 00-00-01, родитель: 65 20-00-01, водитель: 65 10-00-01';

  @override
  String get errorUnknownPhone =>
      'Этот номер не зарегистрирован. Обратитесь к диспетчеру.';

  @override
  String get errorWrongCode => 'Неверный код';

  @override
  String get errorCodeExpired => 'Код истёк, запросите новый';

  @override
  String get errorTooManyAttempts =>
      'Слишком много попыток, запросите новый код';

  @override
  String get errorCodeNotRequested => 'Сначала запросите код';

  @override
  String get errorNetwork => 'Нет связи с сервером';

  @override
  String get logout => 'Выйти';

  @override
  String greeting(String name) {
    return 'Здравствуйте, $name';
  }

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get add => 'Добавить';

  @override
  String get edit => 'Изменить';

  @override
  String get emptyList => 'Пока пусто';

  @override
  String get dispatcherTabFamilies => 'Семьи';

  @override
  String get dispatcherTabChildren => 'Дети';

  @override
  String get dispatcherTabDrivers => 'Водители';

  @override
  String get dispatcherTabInstitutions => 'Учреждения';

  @override
  String get fieldName => 'Имя';

  @override
  String get fieldFamilyName => 'Название семьи';

  @override
  String get fieldPhone => 'Телефон';

  @override
  String get fieldAddress => 'Адрес';

  @override
  String get fieldCarModel => 'Машина';

  @override
  String get fieldCarPlate => 'Госномер';

  @override
  String get fieldCodeWord => 'Кодовое слово';

  @override
  String get fieldBirthYear => 'Год рождения';

  @override
  String get fieldHandoverCode => 'Код учреждения';

  @override
  String get fieldType => 'Тип';

  @override
  String get fieldFamily => 'Семья';

  @override
  String get fieldExperience => 'Стаж и опыт';

  @override
  String get fieldNeedsChildSeat => 'Нужно детское кресло';

  @override
  String get fieldIsFemaleDriver => 'Женщина-водитель';

  @override
  String get fieldSmsLevel => 'SMS-уведомления';

  @override
  String get smsLevelAll => 'Все события';

  @override
  String get smsLevelCritical => 'Только критические';

  @override
  String get institutionKindergarten => 'Детский сад';

  @override
  String get institutionSchool => 'Школа';

  @override
  String get institutionSection => 'Секция';

  @override
  String get institutionClub => 'Кружок';

  @override
  String get vettingPending => 'На проверке';

  @override
  String get vettingVerified => 'Проверен';

  @override
  String get vettingRejected => 'Отклонён';

  @override
  String get circlePrimary => 'Постоянный водитель';

  @override
  String get circleBackup1 => 'Резервный 1';

  @override
  String get circleBackup2 => 'Резервный 2';

  @override
  String get parentChildrenTitle => 'Мои дети';

  @override
  String get parentDriversTitle => 'Наш водитель';

  @override
  String get driverProfileTitle => 'Мой профиль';

  @override
  String get saved => 'Сохранено';

  @override
  String get requiredField => 'Заполните поле';

  @override
  String get dispatcherDirectories => 'Справочники';

  @override
  String get dispatcherCircleTitle => 'Круг семьи';

  @override
  String get notSet => 'Не задано';
}
