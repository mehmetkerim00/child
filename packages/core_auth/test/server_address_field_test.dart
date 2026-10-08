import 'package:core_auth/core_auth.dart';
import 'package:core_data/core_data.dart';
import 'package:core_data/testing.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Поле «адрес сервера» на экране входа.
///
/// Оно существует ради домашнего теста: роутер выдаёт ноутбуку новый
/// адрес, и пересобирать из-за этого APK на двух телефонах — абсурд.
///
/// Но в боевой сборке это поле — дыра: подменив адрес, приложение семьи
/// уводят на чужой сервер, где окажутся имена детей, адреса и время,
/// когда их забирают. Поэтому проверяем не «поле работает», а «в проде
/// его нет».
void main() {
  Widget app(AppConfig config) => ProviderScope(
    overrides: [
      appConfigProvider.overrideWithValue(config),
      appLocaleProvider.overrideWith((ref) => const Locale('ru')),
      apiClientProvider.overrideWith((ref) => Client('http://localhost/')),
      tokenStorageProvider.overrideWithValue(FakeTokenStorage()),
    ],
    child: MaterialApp(
      locale: const Locale('ru'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: childLocalizationsDelegates,
      home: const LoginScreen(title: 'Sag-Aman'),
    ),
  );

  const prod = AppConfig(
    flavor: Flavor.prod,
    serverUrl: 'https://api.sagaman.tm/',
  );
  const hometest = AppConfig(
    flavor: Flavor.hometest,
    serverUrl: 'http://192.168.1.5:8180/',
  );

  group('Настройки сборки', () {
    test('менять адрес разрешено только домашней сборке', () {
      expect(hometest.canOverrideServer, isTrue);
      expect(prod.canOverrideServer, isFalse);
      expect(
        const AppConfig(
          flavor: Flavor.dev,
          serverUrl: 'http://localhost:8180/',
        ).canOverrideServer,
        isFalse,
        reason: 'поле нужно только там, где меняется домашний Wi-Fi',
      );
    });

    test('сохранённый адрес не применяется в боевой сборке', () async {
      // Даже если адрес каким-то образом попал в настройки телефона,
      // боевое приложение обязано ходить туда, куда собрано.
      final controller = ServerUrlController(prod);

      final saved = await controller.save('http://evil.example/');

      expect(saved, isFalse, reason: 'подмена адреса в проде недопустима');
      expect(controller.state, prod.serverUrl);
    });

    test('мусор вместо адреса не сохраняется', () async {
      final controller = ServerUrlController(hometest);

      expect(await controller.save('не адрес'), isFalse);
      expect(await controller.save('ftp://192.168.1.5/'), isFalse);
      expect(controller.state, hometest.serverUrl);
    });

    test('адрес без слэша на конце дополняется', () async {
      final controller = ServerUrlController(hometest);

      expect(await controller.save('http://192.168.31.180:8180'), isTrue);
      expect(controller.state, 'http://192.168.31.180:8180/');
    });
  });

  group('Экран входа', () {
    testWidgets('в боевой сборке поля адреса нет', (tester) async {
      await tester.pumpWidget(app(prod));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.byType(ServerAddressField), findsNothing);
      expect(find.text('Адрес сервера'), findsNothing);
      expect(find.text('Проверить связь'), findsNothing);
    });

    testWidgets('в домашней сборке поле есть', (tester) async {
      await tester.pumpWidget(app(hometest));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.byType(ServerAddressField), findsOneWidget);
      expect(find.text('Проверить связь'), findsOneWidget);
      // Видно, какой адрес действует сейчас.
      expect(
        find.textContaining('http://192.168.1.5:8180/'),
        findsWidgets,
        reason: 'после смены Wi-Fi это первое, что хочется увидеть',
      );
    });

    testWidgets('кнопка тестовых данных не попадает в боевую сборку', (
      tester,
    ) async {
      await tester.pumpWidget(app(prod));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 200));

      // По типу, а не по надписи: надпись переводится и меняется,
      // а правило «в проде сидов нет» меняться не должно.
      expect(find.byType(DevSeedButton), findsNothing);
      expect(find.text('Заполнить тестовыми данными'), findsNothing);
    });

    testWidgets('в домашней сборке кнопка тестовых данных есть', (
      tester,
    ) async {
      await tester.pumpWidget(app(hometest));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.byType(DevSeedButton), findsOneWidget);
    });
  });
}
