import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Язык по умолчанию.
///
/// Родитель, у которого телефон на туркменском, не должен искать
/// переключатель: приложение обязано открыться на его языке. Искать
/// настройку на чужом языке — ровно та мелочь, из-за которой человек
/// решает, что «приложение не для него».
void main() {
  test('язык телефона берётся, если он из наших трёх', () {
    expect(initialLocale([const Locale('tk')]).languageCode, 'tk');
    expect(initialLocale([const Locale('en')]).languageCode, 'en');
    expect(initialLocale([const Locale('ru')]).languageCode, 'ru');
  });

  test('регион не мешает: tk-TM это туркменский', () {
    expect(initialLocale([const Locale('tk', 'TM')]).languageCode, 'tk');
    expect(initialLocale([const Locale('en', 'GB')]).languageCode, 'en');
  });

  test('чужой язык телефона — русский', () {
    // Турецкий похож на туркменский, но это не он: подставлять tk было
    // бы догадкой за пользователя.
    expect(initialLocale([const Locale('tr')]).languageCode, 'ru');
    expect(initialLocale([const Locale('fa')]).languageCode, 'ru');
    expect(initialLocale([]).languageCode, 'ru');
  });

  test('берётся первый понятный язык из списка телефона', () {
    // В системе может стоять несколько языков по приоритету.
    expect(
      initialLocale([
        const Locale('tr'),
        const Locale('en'),
        const Locale('ru'),
      ]).languageCode,
      'en',
    );
  });

  test('в переключателе ровно три языка', () {
    expect(childLocales.map((l) => l.languageCode), ['ru', 'tk', 'en']);
  });

  testWidgets('все три языка доступны приложению', (tester) async {
    for (final locale in childLocales) {
      late AppLocalizations l10n;
      await tester.pumpWidget(
        WidgetsApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: childLocalizationsDelegates,
          color: const Color(0xFF000000),
          builder: (context, _) {
            l10n = AppLocalizations.of(context);
            return const SizedBox();
          },
        ),
      );

      expect(l10n.appTitleParent, isNotEmpty);
      expect(
        l10n.trainingQ1,
        isNotEmpty,
        reason: 'вопрос экзамена водителя обязан быть на всех языках',
      );
      expect(l10n.languageEn, 'English');
    }
  });
}
