import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Flutter не поставляет системные строки (Material/Cupertino/Widgets)
/// на туркменском. Для `tk` подгружаем русские — наши собственные строки
/// при этом остаются туркменскими (AppLocalizations).
const _fallbackLocale = Locale('ru');

bool _isTk(Locale locale) => locale.languageCode == 'tk';

class _FallbackMaterialDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _FallbackMaterialDelegate();

  @override
  bool isSupported(Locale locale) => _isTk(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      GlobalMaterialLocalizations.delegate.load(_fallbackLocale);

  @override
  bool shouldReload(_FallbackMaterialDelegate old) => false;
}

class _FallbackCupertinoDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _FallbackCupertinoDelegate();

  @override
  bool isSupported(Locale locale) => _isTk(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      GlobalCupertinoLocalizations.delegate.load(_fallbackLocale);

  @override
  bool shouldReload(_FallbackCupertinoDelegate old) => false;
}

class _FallbackWidgetsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const _FallbackWidgetsDelegate();

  @override
  bool isSupported(Locale locale) => _isTk(locale);

  @override
  Future<WidgetsLocalizations> load(Locale locale) =>
      GlobalWidgetsLocalizations.delegate.load(_fallbackLocale);

  @override
  bool shouldReload(_FallbackWidgetsDelegate old) => false;
}

const tkFallbackDelegates = <LocalizationsDelegate<dynamic>>[
  _FallbackMaterialDelegate(),
  _FallbackCupertinoDelegate(),
  _FallbackWidgetsDelegate(),
];
