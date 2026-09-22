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
