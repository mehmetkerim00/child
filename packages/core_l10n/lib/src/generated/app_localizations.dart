import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_tk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('tk'),
  ];

  /// No description provided for @appTitleParent.
  ///
  /// In ru, this message translates to:
  /// **'Child — родителям'**
  String get appTitleParent;

  /// No description provided for @appTitleDriver.
  ///
  /// In ru, this message translates to:
  /// **'Child — водитель'**
  String get appTitleDriver;

  /// No description provided for @appTitleDispatcher.
  ///
  /// In ru, this message translates to:
  /// **'Child — диспетчер'**
  String get appTitleDispatcher;

  /// No description provided for @flavorBadge.
  ///
  /// In ru, this message translates to:
  /// **'Среда: {flavor}'**
  String flavorBadge(String flavor);

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @languageRu.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get languageRu;

  /// No description provided for @languageTk.
  ///
  /// In ru, this message translates to:
  /// **'Türkmen'**
  String get languageTk;

  /// No description provided for @stubNotice.
  ///
  /// In ru, this message translates to:
  /// **'Экран-заглушка. Функциональность появится в спринте {sprint}.'**
  String stubNotice(String sprint);

  /// No description provided for @serverStatusTitle.
  ///
  /// In ru, this message translates to:
  /// **'Связь с сервером'**
  String get serverStatusTitle;

  /// No description provided for @serverChecking.
  ///
  /// In ru, this message translates to:
  /// **'Проверяем…'**
  String get serverChecking;

  /// No description provided for @serverOk.
  ///
  /// In ru, this message translates to:
  /// **'Сервер работает (версия {version})'**
  String serverOk(String version);

  /// No description provided for @serverUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Сервер недоступен'**
  String get serverUnavailable;

  /// No description provided for @retry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;

  /// No description provided for @parentTodayTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get parentTodayTitle;

  /// No description provided for @parentTodayEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Поездок на сегодня нет'**
  String get parentTodayEmpty;

  /// No description provided for @driverTodayTitle.
  ///
  /// In ru, this message translates to:
  /// **'Маршрут дня'**
  String get driverTodayTitle;

  /// No description provided for @driverActionDeparted.
  ///
  /// In ru, this message translates to:
  /// **'Выехал'**
  String get driverActionDeparted;

  /// No description provided for @driverStubAction.
  ///
  /// In ru, this message translates to:
  /// **'Кнопки этапов поездки заработают в спринте S3'**
  String get driverStubAction;

  /// No description provided for @dispatcherBoardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Доска дня'**
  String get dispatcherBoardTitle;

  /// No description provided for @dispatcherBoardEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет поездок'**
  String get dispatcherBoardEmpty;

  /// No description provided for @rideStatusScheduled.
  ///
  /// In ru, this message translates to:
  /// **'Запланирована'**
  String get rideStatusScheduled;

  /// No description provided for @rideStatusConfirmed.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждена'**
  String get rideStatusConfirmed;

  /// No description provided for @rideStatusEnRoute.
  ///
  /// In ru, this message translates to:
  /// **'Водитель выехал'**
  String get rideStatusEnRoute;

  /// No description provided for @rideStatusPickedUp.
  ///
  /// In ru, this message translates to:
  /// **'Забрал ребёнка'**
  String get rideStatusPickedUp;

  /// No description provided for @rideStatusInTransit.
  ///
  /// In ru, this message translates to:
  /// **'В пути'**
  String get rideStatusInTransit;

  /// No description provided for @rideStatusArrived.
  ///
  /// In ru, this message translates to:
  /// **'Приехали'**
  String get rideStatusArrived;

  /// No description provided for @rideStatusHandedOver.
  ///
  /// In ru, this message translates to:
  /// **'Передан'**
  String get rideStatusHandedOver;

  /// No description provided for @rideStatusDelayed.
  ///
  /// In ru, this message translates to:
  /// **'Задержка'**
  String get rideStatusDelayed;

  /// No description provided for @rideStatusCancelledByFamily.
  ///
  /// In ru, this message translates to:
  /// **'Отменена семьёй'**
  String get rideStatusCancelledByFamily;

  /// No description provided for @rideStatusCancelledNoDriver.
  ///
  /// In ru, this message translates to:
  /// **'Отменена: нет водителя'**
  String get rideStatusCancelledNoDriver;

  /// No description provided for @rideStatusDriverReplaced.
  ///
  /// In ru, this message translates to:
  /// **'Замена водителя'**
  String get rideStatusDriverReplaced;

  /// No description provided for @loginTitle.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get loginTitle;

  /// No description provided for @loginPhoneLabel.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get loginPhoneLabel;

  /// No description provided for @loginPhoneHint.
  ///
  /// In ru, this message translates to:
  /// **'65 12-34-56'**
  String get loginPhoneHint;

  /// No description provided for @loginRequestCode.
  ///
  /// In ru, this message translates to:
  /// **'Получить код'**
  String get loginRequestCode;

  /// No description provided for @loginCodeLabel.
  ///
  /// In ru, this message translates to:
  /// **'Код из SMS'**
  String get loginCodeLabel;

  /// No description provided for @loginVerify.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get loginVerify;

  /// No description provided for @loginChangePhone.
  ///
  /// In ru, this message translates to:
  /// **'Изменить номер'**
  String get loginChangePhone;

  /// No description provided for @loginCodeSentTo.
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен на {phone}'**
  String loginCodeSentTo(String phone);

  /// No description provided for @loginHint.
  ///
  /// In ru, this message translates to:
  /// **'Номер заводит диспетчер. Если войти не получается — позвоните ему.'**
  String get loginHint;

  /// No description provided for @loginDevSeed.
  ///
  /// In ru, this message translates to:
  /// **'Заполнить тестовыми данными'**
  String get loginDevSeed;

  /// No description provided for @loginDevSeedDone.
  ///
  /// In ru, this message translates to:
  /// **'Готово. Диспетчер: 65 00-00-01, родитель: 65 20-00-01, водитель: 65 10-00-01'**
  String get loginDevSeedDone;

  /// No description provided for @errorUnknownPhone.
  ///
  /// In ru, this message translates to:
  /// **'Этот номер не зарегистрирован. Обратитесь к диспетчеру.'**
  String get errorUnknownPhone;

  /// No description provided for @errorWrongCode.
  ///
  /// In ru, this message translates to:
  /// **'Неверный код'**
  String get errorWrongCode;

  /// No description provided for @errorCodeExpired.
  ///
  /// In ru, this message translates to:
  /// **'Код истёк, запросите новый'**
  String get errorCodeExpired;

  /// No description provided for @errorTooManyAttempts.
  ///
  /// In ru, this message translates to:
  /// **'Слишком много попыток, запросите новый код'**
  String get errorTooManyAttempts;

  /// No description provided for @errorCodeNotRequested.
  ///
  /// In ru, this message translates to:
  /// **'Сначала запросите код'**
  String get errorCodeNotRequested;

  /// No description provided for @errorNetwork.
  ///
  /// In ru, this message translates to:
  /// **'Нет связи с сервером'**
  String get errorNetwork;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// No description provided for @greeting.
  ///
  /// In ru, this message translates to:
  /// **'Здравствуйте, {name}'**
  String greeting(String name);

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @add.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get edit;

  /// No description provided for @emptyList.
  ///
  /// In ru, this message translates to:
  /// **'Пока пусто'**
  String get emptyList;

  /// No description provided for @dispatcherTabFamilies.
  ///
  /// In ru, this message translates to:
  /// **'Семьи'**
  String get dispatcherTabFamilies;

  /// No description provided for @dispatcherTabChildren.
  ///
  /// In ru, this message translates to:
  /// **'Дети'**
  String get dispatcherTabChildren;

  /// No description provided for @dispatcherTabDrivers.
  ///
  /// In ru, this message translates to:
  /// **'Водители'**
  String get dispatcherTabDrivers;

  /// No description provided for @dispatcherTabInstitutions.
  ///
  /// In ru, this message translates to:
  /// **'Учреждения'**
  String get dispatcherTabInstitutions;

  /// No description provided for @fieldName.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get fieldName;

  /// No description provided for @fieldFamilyName.
  ///
  /// In ru, this message translates to:
  /// **'Название семьи'**
  String get fieldFamilyName;

  /// No description provided for @fieldPhone.
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get fieldPhone;

  /// No description provided for @fieldAddress.
  ///
  /// In ru, this message translates to:
  /// **'Адрес'**
  String get fieldAddress;

  /// No description provided for @fieldCarModel.
  ///
  /// In ru, this message translates to:
  /// **'Машина'**
  String get fieldCarModel;

  /// No description provided for @fieldCarPlate.
  ///
  /// In ru, this message translates to:
  /// **'Госномер'**
  String get fieldCarPlate;

  /// No description provided for @fieldCodeWord.
  ///
  /// In ru, this message translates to:
  /// **'Кодовое слово'**
  String get fieldCodeWord;

  /// No description provided for @fieldBirthYear.
  ///
  /// In ru, this message translates to:
  /// **'Год рождения'**
  String get fieldBirthYear;

  /// No description provided for @fieldHandoverCode.
  ///
  /// In ru, this message translates to:
  /// **'Код учреждения'**
  String get fieldHandoverCode;

  /// No description provided for @fieldType.
  ///
  /// In ru, this message translates to:
  /// **'Тип'**
  String get fieldType;

  /// No description provided for @fieldFamily.
  ///
  /// In ru, this message translates to:
  /// **'Семья'**
  String get fieldFamily;

  /// No description provided for @fieldExperience.
  ///
  /// In ru, this message translates to:
  /// **'Стаж и опыт'**
  String get fieldExperience;

  /// No description provided for @fieldNeedsChildSeat.
  ///
  /// In ru, this message translates to:
  /// **'Нужно детское кресло'**
  String get fieldNeedsChildSeat;

  /// No description provided for @fieldIsFemaleDriver.
  ///
  /// In ru, this message translates to:
  /// **'Женщина-водитель'**
  String get fieldIsFemaleDriver;

  /// No description provided for @fieldSmsLevel.
  ///
  /// In ru, this message translates to:
  /// **'SMS-уведомления'**
  String get fieldSmsLevel;

  /// No description provided for @smsLevelAll.
  ///
  /// In ru, this message translates to:
  /// **'Все события'**
  String get smsLevelAll;

  /// No description provided for @smsLevelCritical.
  ///
  /// In ru, this message translates to:
  /// **'Только критические'**
  String get smsLevelCritical;

  /// No description provided for @institutionKindergarten.
  ///
  /// In ru, this message translates to:
  /// **'Детский сад'**
  String get institutionKindergarten;

  /// No description provided for @institutionSchool.
  ///
  /// In ru, this message translates to:
  /// **'Школа'**
  String get institutionSchool;

  /// No description provided for @institutionSection.
  ///
  /// In ru, this message translates to:
  /// **'Секция'**
  String get institutionSection;

  /// No description provided for @institutionClub.
  ///
  /// In ru, this message translates to:
  /// **'Кружок'**
  String get institutionClub;

  /// No description provided for @vettingPending.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get vettingPending;

  /// No description provided for @vettingVerified.
  ///
  /// In ru, this message translates to:
  /// **'Проверен'**
  String get vettingVerified;

  /// No description provided for @vettingRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонён'**
  String get vettingRejected;

  /// No description provided for @circlePrimary.
  ///
  /// In ru, this message translates to:
  /// **'Постоянный водитель'**
  String get circlePrimary;

  /// No description provided for @circleBackup1.
  ///
  /// In ru, this message translates to:
  /// **'Резервный 1'**
  String get circleBackup1;

  /// No description provided for @circleBackup2.
  ///
  /// In ru, this message translates to:
  /// **'Резервный 2'**
  String get circleBackup2;

  /// No description provided for @parentChildrenTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мои дети'**
  String get parentChildrenTitle;

  /// No description provided for @parentDriversTitle.
  ///
  /// In ru, this message translates to:
  /// **'Наш водитель'**
  String get parentDriversTitle;

  /// No description provided for @driverProfileTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мой профиль'**
  String get driverProfileTitle;

  /// No description provided for @saved.
  ///
  /// In ru, this message translates to:
  /// **'Сохранено'**
  String get saved;

  /// No description provided for @requiredField.
  ///
  /// In ru, this message translates to:
  /// **'Заполните поле'**
  String get requiredField;

  /// No description provided for @dispatcherDirectories.
  ///
  /// In ru, this message translates to:
  /// **'Справочники'**
  String get dispatcherDirectories;

  /// No description provided for @dispatcherCircleTitle.
  ///
  /// In ru, this message translates to:
  /// **'Круг семьи'**
  String get dispatcherCircleTitle;

  /// No description provided for @notSet.
  ///
  /// In ru, this message translates to:
  /// **'Не задано'**
  String get notSet;

  /// No description provided for @parentRoutesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Маршруты'**
  String get parentRoutesTitle;

  /// No description provided for @parentRequestRoute.
  ///
  /// In ru, this message translates to:
  /// **'Заявка на маршрут'**
  String get parentRequestRoute;

  /// No description provided for @routeStatusPending.
  ///
  /// In ru, this message translates to:
  /// **'На активации у диспетчера'**
  String get routeStatusPending;

  /// No description provided for @routeStatusActive.
  ///
  /// In ru, this message translates to:
  /// **'Активен'**
  String get routeStatusActive;

  /// No description provided for @routeWeekdays.
  ///
  /// In ru, this message translates to:
  /// **'Дни недели'**
  String get routeWeekdays;

  /// No description provided for @routePickupTime.
  ///
  /// In ru, this message translates to:
  /// **'Время подачи'**
  String get routePickupTime;

  /// No description provided for @routeFrom.
  ///
  /// In ru, this message translates to:
  /// **'Откуда'**
  String get routeFrom;

  /// No description provided for @routeTo.
  ///
  /// In ru, this message translates to:
  /// **'Куда'**
  String get routeTo;

  /// No description provided for @routeDirection.
  ///
  /// In ru, this message translates to:
  /// **'Направление'**
  String get routeDirection;

  /// No description provided for @directionToInstitution.
  ///
  /// In ru, this message translates to:
  /// **'Из дома в учреждение'**
  String get directionToInstitution;

  /// No description provided for @directionToHome.
  ///
  /// In ru, this message translates to:
  /// **'Из учреждения домой'**
  String get directionToHome;

  /// No description provided for @routeChild.
  ///
  /// In ru, this message translates to:
  /// **'Ребёнок'**
  String get routeChild;

  /// No description provided for @routePrice.
  ///
  /// In ru, this message translates to:
  /// **'Цена поездки, манатов'**
  String get routePrice;

  /// No description provided for @routeRequestSent.
  ///
  /// In ru, this message translates to:
  /// **'Заявка отправлена диспетчеру'**
  String get routeRequestSent;

  /// No description provided for @weekdayMon.
  ///
  /// In ru, this message translates to:
  /// **'Пн'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In ru, this message translates to:
  /// **'Вт'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In ru, this message translates to:
  /// **'Ср'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In ru, this message translates to:
  /// **'Чт'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In ru, this message translates to:
  /// **'Пт'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In ru, this message translates to:
  /// **'Сб'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In ru, this message translates to:
  /// **'Вс'**
  String get weekdaySun;

  /// No description provided for @dispatcherTabRoutes.
  ///
  /// In ru, this message translates to:
  /// **'Маршруты'**
  String get dispatcherTabRoutes;

  /// No description provided for @dispatcherPendingRoutes.
  ///
  /// In ru, this message translates to:
  /// **'Заявки на активацию'**
  String get dispatcherPendingRoutes;

  /// No description provided for @dispatcherActivate.
  ///
  /// In ru, this message translates to:
  /// **'Активировать'**
  String get dispatcherActivate;

  /// No description provided for @dispatcherDeactivate.
  ///
  /// In ru, this message translates to:
  /// **'Отключить'**
  String get dispatcherDeactivate;

  /// No description provided for @dispatcherAssignDriver.
  ///
  /// In ru, this message translates to:
  /// **'Водитель'**
  String get dispatcherAssignDriver;

  /// No description provided for @dispatcherGenerateRides.
  ///
  /// In ru, this message translates to:
  /// **'Создать поездки'**
  String get dispatcherGenerateRides;

  /// No description provided for @dispatcherRidesCreated.
  ///
  /// In ru, this message translates to:
  /// **'Создано поездок: {count}'**
  String dispatcherRidesCreated(int count);

  /// No description provided for @driverTomorrowTitle.
  ///
  /// In ru, this message translates to:
  /// **'Завтра'**
  String get driverTomorrowTitle;

  /// No description provided for @driverConfirmDeadline.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите до 20:00'**
  String get driverConfirmDeadline;

  /// No description provided for @driverConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждаю'**
  String get driverConfirm;

  /// No description provided for @driverDecline.
  ///
  /// In ru, this message translates to:
  /// **'Не могу'**
  String get driverDecline;

  /// No description provided for @driverDeclineReason.
  ///
  /// In ru, this message translates to:
  /// **'Причина'**
  String get driverDeclineReason;

  /// No description provided for @driverDeclineHint.
  ///
  /// In ru, this message translates to:
  /// **'Диспетчер получит причину и найдёт замену'**
  String get driverDeclineHint;

  /// No description provided for @driverConfirmed.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждено'**
  String get driverConfirmed;

  /// No description provided for @driverNoRidesTomorrow.
  ///
  /// In ru, this message translates to:
  /// **'На завтра поездок нет'**
  String get driverNoRidesTomorrow;

  /// No description provided for @ridesToday.
  ///
  /// In ru, this message translates to:
  /// **'Поездки сегодня'**
  String get ridesToday;

  /// No description provided for @rideAt.
  ///
  /// In ru, this message translates to:
  /// **'в {time}'**
  String rideAt(String time);

  /// No description provided for @todayTab.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get todayTab;

  /// No description provided for @tomorrowTab.
  ///
  /// In ru, this message translates to:
  /// **'Завтра'**
  String get tomorrowTab;

  /// No description provided for @dispatcherProblems.
  ///
  /// In ru, this message translates to:
  /// **'Проблемы'**
  String get dispatcherProblems;

  /// No description provided for @rideFlowTitle.
  ///
  /// In ru, this message translates to:
  /// **'Поездка'**
  String get rideFlowTitle;

  /// No description provided for @actionDepart.
  ///
  /// In ru, this message translates to:
  /// **'Выехал'**
  String get actionDepart;

  /// No description provided for @actionPickUp.
  ///
  /// In ru, this message translates to:
  /// **'Забрал'**
  String get actionPickUp;

  /// No description provided for @actionStartTransit.
  ///
  /// In ru, this message translates to:
  /// **'Посадил, едем'**
  String get actionStartTransit;

  /// No description provided for @actionArrive.
  ///
  /// In ru, this message translates to:
  /// **'Приехали'**
  String get actionArrive;

  /// No description provided for @actionHandOver.
  ///
  /// In ru, this message translates to:
  /// **'Передал'**
  String get actionHandOver;

  /// No description provided for @actionDelay.
  ///
  /// In ru, this message translates to:
  /// **'Задержка'**
  String get actionDelay;

  /// No description provided for @codeWordPrompt.
  ///
  /// In ru, this message translates to:
  /// **'Назовите кодовое слово семьи и попросите подтвердить'**
  String get codeWordPrompt;

  /// No description provided for @codeWordField.
  ///
  /// In ru, this message translates to:
  /// **'Кодовое слово'**
  String get codeWordField;

  /// No description provided for @handoverPrompt.
  ///
  /// In ru, this message translates to:
  /// **'Введите код учреждения или попросите расписаться'**
  String get handoverPrompt;

  /// No description provided for @institutionCodeField.
  ///
  /// In ru, this message translates to:
  /// **'Код учреждения'**
  String get institutionCodeField;

  /// No description provided for @signatureButton.
  ///
  /// In ru, this message translates to:
  /// **'Подпись принимающего'**
  String get signatureButton;

  /// No description provided for @signatureDone.
  ///
  /// In ru, this message translates to:
  /// **'Подпись получена'**
  String get signatureDone;

  /// No description provided for @signatureClear.
  ///
  /// In ru, this message translates to:
  /// **'Стереть'**
  String get signatureClear;

  /// No description provided for @delayReasonField.
  ///
  /// In ru, this message translates to:
  /// **'Причина задержки'**
  String get delayReasonField;

  /// No description provided for @pendingEvents.
  ///
  /// In ru, this message translates to:
  /// **'{count} событий ждут отправки'**
  String pendingEvents(int count);

  /// No description provided for @allEventsSent.
  ///
  /// In ru, this message translates to:
  /// **'Все события отправлены'**
  String get allEventsSent;

  /// No description provided for @retrySync.
  ///
  /// In ru, this message translates to:
  /// **'Отправить сейчас'**
  String get retrySync;

  /// No description provided for @rideFinished.
  ///
  /// In ru, this message translates to:
  /// **'Поездка завершена'**
  String get rideFinished;

  /// No description provided for @errorWrongCodeWordServer.
  ///
  /// In ru, this message translates to:
  /// **'Кодовое слово не совпало'**
  String get errorWrongCodeWordServer;

  /// No description provided for @errorWrongOrder.
  ///
  /// In ru, this message translates to:
  /// **'Этот этап сейчас недоступен'**
  String get errorWrongOrder;

  /// No description provided for @errorHandoverProof.
  ///
  /// In ru, this message translates to:
  /// **'Нужен код учреждения или подпись'**
  String get errorHandoverProof;

  /// No description provided for @errorRideFinished.
  ///
  /// In ru, this message translates to:
  /// **'Поездка уже завершена'**
  String get errorRideFinished;

  /// No description provided for @eventsTimeline.
  ///
  /// In ru, this message translates to:
  /// **'Что происходило'**
  String get eventsTimeline;

  /// No description provided for @parentRideTitle.
  ///
  /// In ru, this message translates to:
  /// **'Поездка ребёнка'**
  String get parentRideTitle;

  /// No description provided for @trackingOn.
  ///
  /// In ru, this message translates to:
  /// **'Родитель видит, где машина'**
  String get trackingOn;

  /// No description provided for @trackingOff.
  ///
  /// In ru, this message translates to:
  /// **'Геолокация выключена'**
  String get trackingOff;

  /// No description provided for @trackingDenied.
  ///
  /// In ru, this message translates to:
  /// **'Нет доступа к геолокации: родитель не увидит машину на карте'**
  String get trackingDenied;

  /// No description provided for @rideOnMap.
  ///
  /// In ru, this message translates to:
  /// **'Показать на карте'**
  String get rideOnMap;

  /// No description provided for @parentNotificationsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get parentNotificationsTitle;

  /// No description provided for @notificationChannelPush.
  ///
  /// In ru, this message translates to:
  /// **'Push'**
  String get notificationChannelPush;

  /// No description provided for @notificationChannelSms.
  ///
  /// In ru, this message translates to:
  /// **'SMS'**
  String get notificationChannelSms;

  /// No description provided for @notificationQueued.
  ///
  /// In ru, this message translates to:
  /// **'В очереди'**
  String get notificationQueued;

  /// No description provided for @notificationSent.
  ///
  /// In ru, this message translates to:
  /// **'Отправлено'**
  String get notificationSent;

  /// No description provided for @notificationAcked.
  ///
  /// In ru, this message translates to:
  /// **'Доставлено'**
  String get notificationAcked;

  /// No description provided for @notificationFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не доставлено'**
  String get notificationFailed;

  /// No description provided for @dispatcherTasksTitle.
  ///
  /// In ru, this message translates to:
  /// **'Задачи'**
  String get dispatcherTasksTitle;

  /// No description provided for @dispatcherNoTasks.
  ///
  /// In ru, this message translates to:
  /// **'Задач нет'**
  String get dispatcherNoTasks;

  /// No description provided for @taskResolve.
  ///
  /// In ru, this message translates to:
  /// **'Решено'**
  String get taskResolve;

  /// No description provided for @taskRideNotConfirmed.
  ///
  /// In ru, this message translates to:
  /// **'Поездка не подтверждена'**
  String get taskRideNotConfirmed;

  /// No description provided for @taskDriverNotDeparted.
  ///
  /// In ru, this message translates to:
  /// **'Водитель не выехал'**
  String get taskDriverNotDeparted;

  /// No description provided for @taskNotificationUndelivered.
  ///
  /// In ru, this message translates to:
  /// **'Уведомление не дошло — позвонить'**
  String get taskNotificationUndelivered;

  /// No description provided for @taskRideWithoutDriver.
  ///
  /// In ru, this message translates to:
  /// **'Поездка без водителя'**
  String get taskRideWithoutDriver;

  /// No description provided for @smsConsoleTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отправить SMS'**
  String get smsConsoleTitle;

  /// No description provided for @smsConsoleSend.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get smsConsoleSend;

  /// No description provided for @smsConsoleBody.
  ///
  /// In ru, this message translates to:
  /// **'Текст сообщения'**
  String get smsConsoleBody;

  /// No description provided for @smsConsoleSent.
  ///
  /// In ru, this message translates to:
  /// **'SMS поставлена в очередь'**
  String get smsConsoleSent;

  /// No description provided for @parentBalanceTitle.
  ///
  /// In ru, this message translates to:
  /// **'Баланс'**
  String get parentBalanceTitle;

  /// No description provided for @balanceCurrent.
  ///
  /// In ru, this message translates to:
  /// **'Остаток'**
  String get balanceCurrent;

  /// No description provided for @balancePending.
  ///
  /// In ru, this message translates to:
  /// **'Ожидает подтверждения'**
  String get balancePending;

  /// No description provided for @balanceLowWarning.
  ///
  /// In ru, this message translates to:
  /// **'Денег меньше чем на три поездки — пора пополнить'**
  String get balanceLowWarning;

  /// No description provided for @balanceHowTo.
  ///
  /// In ru, this message translates to:
  /// **'Как пополнить: передайте наличные водителю или диспетчеру. Водитель отметит приём в приложении, диспетчер подтвердит — деньги появятся на балансе.'**
  String get balanceHowTo;

  /// No description provided for @balanceManat.
  ///
  /// In ru, this message translates to:
  /// **'{amount} манат'**
  String balanceManat(String amount);

  /// No description provided for @ledgerCashTopup.
  ///
  /// In ru, this message translates to:
  /// **'Пополнение наличными'**
  String get ledgerCashTopup;

  /// No description provided for @ledgerRideCharge.
  ///
  /// In ru, this message translates to:
  /// **'Поездка'**
  String get ledgerRideCharge;

  /// No description provided for @ledgerAdjust.
  ///
  /// In ru, this message translates to:
  /// **'Корректировка'**
  String get ledgerAdjust;

  /// No description provided for @driverCashTitle.
  ///
  /// In ru, this message translates to:
  /// **'Наличные'**
  String get driverCashTitle;

  /// No description provided for @driverCashAccept.
  ///
  /// In ru, this message translates to:
  /// **'Принять пополнение'**
  String get driverCashAccept;

  /// No description provided for @driverCashFamily.
  ///
  /// In ru, this message translates to:
  /// **'Семья'**
  String get driverCashFamily;

  /// No description provided for @driverCashAmount.
  ///
  /// In ru, this message translates to:
  /// **'Сумма, манатов'**
  String get driverCashAmount;

  /// No description provided for @driverCashSignature.
  ///
  /// In ru, this message translates to:
  /// **'Подпись родителя'**
  String get driverCashSignature;

  /// No description provided for @driverCashPending.
  ///
  /// In ru, this message translates to:
  /// **'Ждёт подтверждения диспетчера'**
  String get driverCashPending;

  /// No description provided for @driverCashConfirmed.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждено'**
  String get driverCashConfirmed;

  /// No description provided for @driverCashRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонено'**
  String get driverCashRejected;

  /// No description provided for @dispatcherTopUpsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пополнения'**
  String get dispatcherTopUpsTitle;

  /// No description provided for @dispatcherConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get dispatcherConfirm;

  /// No description provided for @dispatcherReject.
  ///
  /// In ru, this message translates to:
  /// **'Отклонить'**
  String get dispatcherReject;

  /// No description provided for @dispatcherRejectReason.
  ///
  /// In ru, this message translates to:
  /// **'Причина отказа'**
  String get dispatcherRejectReason;

  /// No description provided for @moneyTab.
  ///
  /// In ru, this message translates to:
  /// **'Деньги'**
  String get moneyTab;

  /// No description provided for @onboardingTitle1.
  ///
  /// In ru, this message translates to:
  /// **'Постоянный водитель, а не случайный'**
  String get onboardingTitle1;

  /// No description provided for @onboardingText1.
  ///
  /// In ru, this message translates to:
  /// **'Вашего ребёнка возит один и тот же человек, которого вы видели заранее. Если он не может выйти, диспетчер предложит запасного из вашего круга — тоже знакомого.'**
  String get onboardingText1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In ru, this message translates to:
  /// **'Передача из рук в руки'**
  String get onboardingTitle2;

  /// No description provided for @onboardingText2.
  ///
  /// In ru, this message translates to:
  /// **'Водитель называет кодовое слово вашей семьи, когда забирает ребёнка, и подтверждает передачу кодом учреждения или подписью воспитателя. Ребёнок не подтверждает ничего — только взрослые.'**
  String get onboardingText2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In ru, this message translates to:
  /// **'Вы узнаете, даже если нет интернета'**
  String get onboardingTitle3;

  /// No description provided for @onboardingText3.
  ///
  /// In ru, this message translates to:
  /// **'О главных событиях — «забрал», «передал», отмена — приходит SMS, даже когда push не доходит. Поездку видно на карте, пока машина едет.'**
  String get onboardingText3;

  /// No description provided for @onboardingNext.
  ///
  /// In ru, this message translates to:
  /// **'Дальше'**
  String get onboardingNext;

  /// No description provided for @onboardingStart.
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get onboardingStart;

  /// No description provided for @offlineBanner.
  ///
  /// In ru, this message translates to:
  /// **'Нет связи с сервером. Данные могут быть устаревшими.'**
  String get offlineBanner;

  /// No description provided for @poolTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пул: дети в одной машине'**
  String get poolTitle;

  /// No description provided for @poolCandidates.
  ///
  /// In ru, this message translates to:
  /// **'Можно объединить'**
  String get poolCandidates;

  /// No description provided for @poolMerge.
  ///
  /// In ru, this message translates to:
  /// **'Объединить в пул'**
  String get poolMerge;

  /// No description provided for @poolSeatsLeft.
  ///
  /// In ru, this message translates to:
  /// **'Свободных мест: {seats}, кресел: {childSeats}'**
  String poolSeatsLeft(int seats, int childSeats);

  /// No description provided for @poolChildrenInCar.
  ///
  /// In ru, this message translates to:
  /// **'Детей в машине: {count}'**
  String poolChildrenInCar(int count);

  /// No description provided for @poolNoCandidates.
  ///
  /// In ru, this message translates to:
  /// **'Подходящих поездок нет'**
  String get poolNoCandidates;

  /// No description provided for @poolTimeDiff.
  ///
  /// In ru, this message translates to:
  /// **'разница {minutes} мин'**
  String poolTimeDiff(int minutes);

  /// No description provided for @poolNeedsChildSeat.
  ///
  /// In ru, this message translates to:
  /// **'нужно кресло'**
  String get poolNeedsChildSeat;

  /// No description provided for @seatPickUp.
  ///
  /// In ru, this message translates to:
  /// **'Забрать'**
  String get seatPickUp;

  /// No description provided for @seatHandOver.
  ///
  /// In ru, this message translates to:
  /// **'Передать'**
  String get seatHandOver;

  /// No description provided for @seatPickedUp.
  ///
  /// In ru, this message translates to:
  /// **'В машине'**
  String get seatPickedUp;

  /// No description provided for @seatHandedOver.
  ///
  /// In ru, this message translates to:
  /// **'Передан'**
  String get seatHandedOver;

  /// No description provided for @seatWaiting.
  ///
  /// In ru, this message translates to:
  /// **'Ждёт'**
  String get seatWaiting;

  /// No description provided for @seatWhichChild.
  ///
  /// In ru, this message translates to:
  /// **'Кого забираем'**
  String get seatWhichChild;

  /// No description provided for @chatTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сообщения'**
  String get chatTitle;

  /// No description provided for @chatHint.
  ///
  /// In ru, this message translates to:
  /// **'Пишите водителю прямо здесь — номера телефонов не раскрываются'**
  String get chatHint;

  /// No description provided for @chatSend.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get chatSend;

  /// No description provided for @chatPlaceholder.
  ///
  /// In ru, this message translates to:
  /// **'Сообщение'**
  String get chatPlaceholder;

  /// No description provided for @chatEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Сообщений пока нет'**
  String get chatEmpty;

  /// No description provided for @chatQuickPhrases.
  ///
  /// In ru, this message translates to:
  /// **'Быстрые фразы'**
  String get chatQuickPhrases;

  /// No description provided for @phraseComingOut.
  ///
  /// In ru, this message translates to:
  /// **'Выходим'**
  String get phraseComingOut;

  /// No description provided for @phraseDelayFive.
  ///
  /// In ru, this message translates to:
  /// **'Задерживаемся на 5 минут'**
  String get phraseDelayFive;

  /// No description provided for @phraseChildSick.
  ///
  /// In ru, this message translates to:
  /// **'Ребёнок болеет, отмените сегодня'**
  String get phraseChildSick;

  /// No description provided for @phraseWaitingEntrance.
  ///
  /// In ru, this message translates to:
  /// **'Ждём у подъезда'**
  String get phraseWaitingEntrance;

  /// No description provided for @phraseArrivedCallChild.
  ///
  /// In ru, this message translates to:
  /// **'Подъехал, позовите ребёнка'**
  String get phraseArrivedCallChild;

  /// No description provided for @phraseAllGood.
  ///
  /// In ru, this message translates to:
  /// **'Всё хорошо'**
  String get phraseAllGood;

  /// No description provided for @emergencyCall.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить диспетчеру'**
  String get emergencyCall;

  /// No description provided for @emergencyHint.
  ///
  /// In ru, this message translates to:
  /// **'Срочный вопрос — звоните диспетчеру, он свяжется с водителем'**
  String get emergencyHint;

  /// No description provided for @institutionAccessTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ссылка для учреждения'**
  String get institutionAccessTitle;

  /// No description provided for @institutionAccessIssue.
  ///
  /// In ru, this message translates to:
  /// **'Выдать ссылку'**
  String get institutionAccessIssue;

  /// No description provided for @institutionAccessIssuedTo.
  ///
  /// In ru, this message translates to:
  /// **'Кому выдаём (имя воспитателя)'**
  String get institutionAccessIssuedTo;

  /// No description provided for @institutionAccessCopy.
  ///
  /// In ru, this message translates to:
  /// **'Скопируйте и передайте — она показывается один раз'**
  String get institutionAccessCopy;

  /// No description provided for @institutionAccessRevoke.
  ///
  /// In ru, this message translates to:
  /// **'Отозвать'**
  String get institutionAccessRevoke;

  /// No description provided for @institutionAccessRevoked.
  ///
  /// In ru, this message translates to:
  /// **'Отозвана'**
  String get institutionAccessRevoked;

  /// No description provided for @institutionAccessActive.
  ///
  /// In ru, this message translates to:
  /// **'Действует'**
  String get institutionAccessActive;

  /// No description provided for @absenceTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня не едем'**
  String get absenceTitle;

  /// No description provided for @absenceReason.
  ///
  /// In ru, this message translates to:
  /// **'Причина'**
  String get absenceReason;

  /// No description provided for @absenceHint.
  ///
  /// In ru, this message translates to:
  /// **'Водитель и учреждение увидят это сразу'**
  String get absenceHint;

  /// No description provided for @absenceDone.
  ///
  /// In ru, this message translates to:
  /// **'Отмечено: сегодня не едем'**
  String get absenceDone;

  /// No description provided for @trainingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get trainingTitle;

  /// No description provided for @trainingIntro.
  ///
  /// In ru, this message translates to:
  /// **'Короткие уроки и тест по протоколу передачи ребёнка. Пока тест не сдан, маршруты не назначаются.'**
  String get trainingIntro;

  /// No description provided for @trainingStart.
  ///
  /// In ru, this message translates to:
  /// **'Пройти тест'**
  String get trainingStart;

  /// No description provided for @trainingPassed.
  ///
  /// In ru, this message translates to:
  /// **'Тест сдан'**
  String get trainingPassed;

  /// No description provided for @trainingFailed.
  ///
  /// In ru, this message translates to:
  /// **'Тест не сдан: {correct} из {total}. Попробуйте ещё раз'**
  String trainingFailed(int correct, int total);

  /// No description provided for @trainingResult.
  ///
  /// In ru, this message translates to:
  /// **'{correct} из {total}'**
  String trainingResult(int correct, int total);

  /// No description provided for @trainingNext.
  ///
  /// In ru, this message translates to:
  /// **'Дальше'**
  String get trainingNext;

  /// No description provided for @trainingFinish.
  ///
  /// In ru, this message translates to:
  /// **'Завершить тест'**
  String get trainingFinish;

  /// No description provided for @trainingQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Вопрос {number} из {total}'**
  String trainingQuestion(int number, int total);

  /// No description provided for @hiringTitle.
  ///
  /// In ru, this message translates to:
  /// **'Кандидаты'**
  String get hiringTitle;

  /// No description provided for @hiringChecklist.
  ///
  /// In ru, this message translates to:
  /// **'Проверки'**
  String get hiringChecklist;

  /// No description provided for @hiringHire.
  ///
  /// In ru, this message translates to:
  /// **'Нанять'**
  String get hiringHire;

  /// No description provided for @hiringReject.
  ///
  /// In ru, this message translates to:
  /// **'Отказать'**
  String get hiringReject;

  /// No description provided for @hiringRejectReason.
  ///
  /// In ru, this message translates to:
  /// **'Причина отказа'**
  String get hiringRejectReason;

  /// No description provided for @hiringStatusSubmitted.
  ///
  /// In ru, this message translates to:
  /// **'Анкета подана'**
  String get hiringStatusSubmitted;

  /// No description provided for @hiringStatusDocuments.
  ///
  /// In ru, this message translates to:
  /// **'Документы'**
  String get hiringStatusDocuments;

  /// No description provided for @hiringStatusInterview.
  ///
  /// In ru, this message translates to:
  /// **'Собеседование'**
  String get hiringStatusInterview;

  /// No description provided for @hiringStatusCarCheck.
  ///
  /// In ru, this message translates to:
  /// **'Осмотр машины'**
  String get hiringStatusCarCheck;

  /// No description provided for @hiringStatusTraining.
  ///
  /// In ru, this message translates to:
  /// **'Обучение'**
  String get hiringStatusTraining;

  /// No description provided for @hiringStatusHired.
  ///
  /// In ru, this message translates to:
  /// **'Принят'**
  String get hiringStatusHired;

  /// No description provided for @hiringStatusRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отказ'**
  String get hiringStatusRejected;

  /// No description provided for @checkPassport.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт'**
  String get checkPassport;

  /// No description provided for @checkLicense.
  ///
  /// In ru, this message translates to:
  /// **'Водительское удостоверение'**
  String get checkLicense;

  /// No description provided for @checkCarDocs.
  ///
  /// In ru, this message translates to:
  /// **'Документы на машину'**
  String get checkCarDocs;

  /// No description provided for @checkCriminal.
  ///
  /// In ru, this message translates to:
  /// **'Справка о несудимости'**
  String get checkCriminal;

  /// No description provided for @checkInterview.
  ///
  /// In ru, this message translates to:
  /// **'Собеседование'**
  String get checkInterview;

  /// No description provided for @checkChildSeat.
  ///
  /// In ru, this message translates to:
  /// **'Показал установку кресла'**
  String get checkChildSeat;

  /// No description provided for @checkReferences.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендации'**
  String get checkReferences;

  /// No description provided for @incidentsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Инциденты'**
  String get incidentsTitle;

  /// No description provided for @incidentLog.
  ///
  /// In ru, this message translates to:
  /// **'Зафиксировать'**
  String get incidentLog;

  /// No description provided for @incidentResolution.
  ///
  /// In ru, this message translates to:
  /// **'Решение'**
  String get incidentResolution;

  /// No description provided for @incidentSeverityNote.
  ///
  /// In ru, this message translates to:
  /// **'Замечание'**
  String get incidentSeverityNote;

  /// No description provided for @incidentSeveritySerious.
  ///
  /// In ru, this message translates to:
  /// **'Серьёзное'**
  String get incidentSeveritySerious;

  /// No description provided for @incidentSeverityCritical.
  ///
  /// In ru, this message translates to:
  /// **'Критическое'**
  String get incidentSeverityCritical;

  /// No description provided for @payoutsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Расчёты'**
  String get payoutsTitle;

  /// No description provided for @payoutBlocks.
  ///
  /// In ru, this message translates to:
  /// **'Блоков: {blocks}'**
  String payoutBlocks(int blocks);

  /// No description provided for @payoutTotal.
  ///
  /// In ru, this message translates to:
  /// **'К выплате'**
  String get payoutTotal;

  /// No description provided for @payoutMarkPaid.
  ///
  /// In ru, this message translates to:
  /// **'Выплачено'**
  String get payoutMarkPaid;

  /// No description provided for @trainingQ1.
  ///
  /// In ru, this message translates to:
  /// **'Родитель не вышел, ребёнок стоит у подъезда один. Что делать?'**
  String get trainingQ1;

  /// No description provided for @trainingQ1a.
  ///
  /// In ru, this message translates to:
  /// **'Посадить и ехать, чтобы не опоздать'**
  String get trainingQ1a;

  /// No description provided for @trainingQ1b.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить диспетчеру и ждать взрослого'**
  String get trainingQ1b;

  /// No description provided for @trainingQ1c.
  ///
  /// In ru, this message translates to:
  /// **'Отметить «Забрал» и позвонить позже'**
  String get trainingQ1c;

  /// No description provided for @trainingQ2.
  ///
  /// In ru, this message translates to:
  /// **'Кодовое слово семьи нужно, чтобы:'**
  String get trainingQ2;

  /// No description provided for @trainingQ2a.
  ///
  /// In ru, this message translates to:
  /// **'Отчитаться перед диспетчером'**
  String get trainingQ2a;

  /// No description provided for @trainingQ2b.
  ///
  /// In ru, this message translates to:
  /// **'Родитель убедился, что приехал именно наш водитель'**
  String get trainingQ2b;

  /// No description provided for @trainingQ2c.
  ///
  /// In ru, this message translates to:
  /// **'Открыть приложение'**
  String get trainingQ2c;

  /// No description provided for @trainingQ3.
  ///
  /// In ru, this message translates to:
  /// **'Кто отмечает этапы поездки в приложении?'**
  String get trainingQ3;

  /// No description provided for @trainingQ3a.
  ///
  /// In ru, this message translates to:
  /// **'Ребёнок'**
  String get trainingQ3a;

  /// No description provided for @trainingQ3b.
  ///
  /// In ru, this message translates to:
  /// **'Водитель'**
  String get trainingQ3b;

  /// No description provided for @trainingQ3c.
  ///
  /// In ru, this message translates to:
  /// **'Родитель'**
  String get trainingQ3c;

  /// No description provided for @trainingQ4.
  ///
  /// In ru, this message translates to:
  /// **'В школе нет кода учреждения. Как подтвердить передачу?'**
  String get trainingQ4;

  /// No description provided for @trainingQ4a.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить подтверждение'**
  String get trainingQ4a;

  /// No description provided for @trainingQ4b.
  ///
  /// In ru, this message translates to:
  /// **'Взять подпись принимающего на экране'**
  String get trainingQ4b;

  /// No description provided for @trainingQ4c.
  ///
  /// In ru, this message translates to:
  /// **'Отметить «Передал» без ничего'**
  String get trainingQ4c;

  /// No description provided for @trainingQ5.
  ///
  /// In ru, this message translates to:
  /// **'Пропал интернет посреди поездки. Что делать?'**
  String get trainingQ5;

  /// No description provided for @trainingQ5a.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не отмечать до конца дня'**
  String get trainingQ5a;

  /// No description provided for @trainingQ5b.
  ///
  /// In ru, this message translates to:
  /// **'Отмечать этапы как обычно: они уйдут сами'**
  String get trainingQ5b;

  /// No description provided for @trainingQ5c.
  ///
  /// In ru, this message translates to:
  /// **'Звонить родителю'**
  String get trainingQ5c;

  /// No description provided for @trainingQ6.
  ///
  /// In ru, this message translates to:
  /// **'Задерживаетесь на 10 минут. Правильное действие:'**
  String get trainingQ6;

  /// No description provided for @trainingQ6a.
  ///
  /// In ru, this message translates to:
  /// **'Ехать молча и наверстать по дороге'**
  String get trainingQ6a;

  /// No description provided for @trainingQ6b.
  ///
  /// In ru, this message translates to:
  /// **'Отметить задержку с причиной'**
  String get trainingQ6b;

  /// No description provided for @trainingQ6c.
  ///
  /// In ru, this message translates to:
  /// **'Сказать родителю после поездки'**
  String get trainingQ6c;

  /// No description provided for @trainingQ7.
  ///
  /// In ru, this message translates to:
  /// **'Незнакомый человек просит отдать ему ребёнка:'**
  String get trainingQ7;

  /// No description provided for @trainingQ7a.
  ///
  /// In ru, this message translates to:
  /// **'Отдать, если он говорит, что это дядя'**
  String get trainingQ7a;

  /// No description provided for @trainingQ7b.
  ///
  /// In ru, this message translates to:
  /// **'Не отдавать и звонить диспетчеру'**
  String get trainingQ7b;

  /// No description provided for @trainingQ7c.
  ///
  /// In ru, this message translates to:
  /// **'Отдать, если ребёнок его узнал'**
  String get trainingQ7c;

  /// No description provided for @trainingQ8.
  ///
  /// In ru, this message translates to:
  /// **'В машине трое детей из разных семей. Кодовое слово:'**
  String get trainingQ8;

  /// No description provided for @trainingQ8a.
  ///
  /// In ru, this message translates to:
  /// **'Одно на всю машину'**
  String get trainingQ8a;

  /// No description provided for @trainingQ8b.
  ///
  /// In ru, this message translates to:
  /// **'Своё у каждой семьи'**
  String get trainingQ8b;

  /// No description provided for @trainingQ8c.
  ///
  /// In ru, this message translates to:
  /// **'Не нужно, если едут вместе'**
  String get trainingQ8c;

  /// No description provided for @trainingQ9.
  ///
  /// In ru, this message translates to:
  /// **'Завтрашние поездки водитель подтверждает:'**
  String get trainingQ9;

  /// No description provided for @trainingQ9a.
  ///
  /// In ru, this message translates to:
  /// **'Утром перед выездом'**
  String get trainingQ9a;

  /// No description provided for @trainingQ9b.
  ///
  /// In ru, this message translates to:
  /// **'До 20:00 накануне'**
  String get trainingQ9b;

  /// No description provided for @trainingQ9c.
  ///
  /// In ru, this message translates to:
  /// **'Не подтверждает'**
  String get trainingQ9c;

  /// No description provided for @trainingQ10.
  ///
  /// In ru, this message translates to:
  /// **'Ребёнку нужно детское кресло, а свободного кресла нет:'**
  String get trainingQ10;

  /// No description provided for @trainingQ10a.
  ///
  /// In ru, this message translates to:
  /// **'Везти аккуратно без кресла'**
  String get trainingQ10a;

  /// No description provided for @trainingQ10b.
  ///
  /// In ru, this message translates to:
  /// **'Сообщить диспетчеру: ехать нельзя'**
  String get trainingQ10b;

  /// No description provided for @trainingQ10c.
  ///
  /// In ru, this message translates to:
  /// **'Посадить на колени взрослому'**
  String get trainingQ10c;

  /// No description provided for @ownerTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отчёты'**
  String get ownerTitle;

  /// No description provided for @ownerToday.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get ownerToday;

  /// No description provided for @ownerWeek.
  ///
  /// In ru, this message translates to:
  /// **'Неделя'**
  String get ownerWeek;

  /// No description provided for @ownerMonth.
  ///
  /// In ru, this message translates to:
  /// **'Месяц'**
  String get ownerMonth;

  /// No description provided for @ownerRides.
  ///
  /// In ru, this message translates to:
  /// **'Поездок'**
  String get ownerRides;

  /// No description provided for @ownerCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Довезли'**
  String get ownerCompleted;

  /// No description provided for @ownerCancelled.
  ///
  /// In ru, this message translates to:
  /// **'Сорвано'**
  String get ownerCancelled;

  /// No description provided for @ownerCompletion.
  ///
  /// In ru, this message translates to:
  /// **'Выполняемость'**
  String get ownerCompletion;

  /// No description provided for @ownerRevenue.
  ///
  /// In ru, this message translates to:
  /// **'Выручка'**
  String get ownerRevenue;

  /// No description provided for @ownerSmsCost.
  ///
  /// In ru, this message translates to:
  /// **'SMS'**
  String get ownerSmsCost;

  /// No description provided for @ownerDriverPay.
  ///
  /// In ru, this message translates to:
  /// **'Водителям'**
  String get ownerDriverPay;

  /// No description provided for @ownerMargin.
  ///
  /// In ru, this message translates to:
  /// **'Валовая маржа'**
  String get ownerMargin;

  /// No description provided for @ownerDriverLoad.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка водителей'**
  String get ownerDriverLoad;

  /// No description provided for @ownerRouteEconomics.
  ///
  /// In ru, this message translates to:
  /// **'Экономика маршрутов'**
  String get ownerRouteEconomics;

  /// No description provided for @ownerEmptyHours.
  ///
  /// In ru, this message translates to:
  /// **'Пустые часы'**
  String get ownerEmptyHours;

  /// No description provided for @ownerNoEmptyHours.
  ///
  /// In ru, this message translates to:
  /// **'Пустых часов нет'**
  String get ownerNoEmptyHours;

  /// No description provided for @ownerBalances.
  ///
  /// In ru, this message translates to:
  /// **'Балансы семей'**
  String get ownerBalances;

  /// No description provided for @ownerInDebt.
  ///
  /// In ru, this message translates to:
  /// **'В минусе: {count}'**
  String ownerInDebt(int count);

  /// No description provided for @ownerRidesPerBlock.
  ///
  /// In ru, this message translates to:
  /// **'Поездок на блок'**
  String get ownerRidesPerBlock;

  /// No description provided for @ownerExport.
  ///
  /// In ru, this message translates to:
  /// **'Выгрузить таблицу'**
  String get ownerExport;

  /// No description provided for @ownerExportHint.
  ///
  /// In ru, this message translates to:
  /// **'Ссылка сработает один раз и только 15 минут. Откройте её на компьютере — файл открывается в Excel.'**
  String get ownerExportHint;

  /// No description provided for @ownerExportCopy.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать ссылку'**
  String get ownerExportCopy;

  /// No description provided for @ownerRates.
  ///
  /// In ru, this message translates to:
  /// **'Ставки расчёта'**
  String get ownerRates;

  /// No description provided for @ownerSmsPrice.
  ///
  /// In ru, this message translates to:
  /// **'SMS, тенге'**
  String get ownerSmsPrice;

  /// No description provided for @ownerBlockPay.
  ///
  /// In ru, this message translates to:
  /// **'Оплата блоков'**
  String get ownerBlockPay;

  /// No description provided for @ownerPerRide.
  ///
  /// In ru, this message translates to:
  /// **'Поездка, тенге'**
  String get ownerPerRide;

  /// No description provided for @ownerLossMaking.
  ///
  /// In ru, this message translates to:
  /// **'Убыточный маршрут'**
  String get ownerLossMaking;

  /// No description provided for @taskSystemDegraded.
  ///
  /// In ru, this message translates to:
  /// **'Сбой сервиса'**
  String get taskSystemDegraded;

  /// No description provided for @ownerRouteSum.
  ///
  /// In ru, this message translates to:
  /// **'Сумма по маршрутам'**
  String get ownerRouteSum;

  /// No description provided for @ownerRouteSumHint.
  ///
  /// In ru, this message translates to:
  /// **'Без гарантированной оплаты блоков'**
  String get ownerRouteSumHint;

  /// No description provided for @ownerTotalWithBlocks.
  ///
  /// In ru, this message translates to:
  /// **'Итого с учётом стоимости блоков'**
  String get ownerTotalWithBlocks;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru', 'tk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
    case 'tk':
      return AppLocalizationsTk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
