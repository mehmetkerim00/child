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
