/// Строки UI проекта child (ru/tk). Хардкод строк в приложениях запрещён.
library;

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/fallback_localizations.dart';
import 'src/generated/app_localizations.dart';

export 'src/generated/app_localizations.dart';
export 'src/locale_provider.dart';
export 'src/ride_status_l10n.dart';
export 'src/widgets/language_menu.dart';

/// Все делегаты локализации для `MaterialApp.localizationsDelegates`.
const childLocalizationsDelegates = <LocalizationsDelegate<dynamic>>[
  AppLocalizations.delegate,
  ...tkFallbackDelegates,
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
