import 'package:core_data/core_data.dart';
import 'package:flutter/widgets.dart';
import 'package:core_data/testing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parent/app.dart';

/// Приложение родителя: вход и главный экран.
void main() {
  Widget app(List<Override> overrides) =>
      ProviderScope(overrides: overrides, child: const App());

  final client = apiClientProvider.overrideWith(
    (ref) => Client('http://localhost/'),
  );

  final health = serverHealthProvider.overrideWith(
    (ref) async => ServerHealth(
      status: 'ok',
      serverVersion: '0.0.0-test',
      serverTime: DateTime.utc(2026),
    ),
  );

  testWidgets('без сессии показывает экран входа', (tester) async {
    await tester.pumpWidget(
      app([
        client,
        health,
        tokenStorageProvider.overrideWithValue(FakeTokenStorage()),
      ]),
    );
    await tester.pumpAndSettle();
    // Автофокус поля ввода оставляет короткий таймер — даём ему истечь.
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Вход'), findsWidgets);
    expect(find.text('Получить код'), findsOneWidget);
  });

  testWidgets('с сессией показывает детей и водителей семьи', (tester) async {
    await tester.pumpWidget(
      app([
        client,
        health,
        tokenStorageProvider.overrideWithValue(
          FakeTokenStorage(testParentSession(name: 'Огулджан')),
        ),
        myChildrenProvider.overrideWith(
          (ref) async => [
            Child(
              familyId: 1,
              name: 'Мерет',
              codeWord: 'ýyldyz',
              birthYear: 2017,
            ),
          ],
        ),
        myDriversProvider.overrideWith(
          (ref) async => [
            Driver(
              phone: '+99365100001',
              name: 'Аман Гурбанов',
              carModel: 'Toyota Corolla',
              carPlate: 'AG 1234 AH',
            ),
          ],
        ),
      ]),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Огулджан'), findsWidgets);
    expect(find.text('Мерет'), findsOneWidget);
    expect(find.textContaining('ýyldyz'), findsOneWidget);
    expect(find.text('Аман Гурбанов'), findsOneWidget);
    expect(find.textContaining('Сервер работает'), findsOneWidget);
  });

  testWidgets('переключает язык на туркменский', (tester) async {
    await tester.pumpWidget(
      app([
        client,
        health,
        tokenStorageProvider.overrideWithValue(FakeTokenStorage()),
      ]),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Язык'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Türkmen').last);
    await tester.pumpAndSettle();

    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Kod almak'), findsOneWidget);
  });
}
