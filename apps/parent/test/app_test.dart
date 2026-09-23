import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:flutter/widgets.dart';
import 'package:core_data/testing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parent/app.dart';

/// Приложение родителя: вход и главный экран.
void main() {
  /// Тесты идут на русском независимо от языка машины.
  ///
  /// По умолчанию приложение берёт язык телефона, а flutter_test
  /// сообщает en-US — без явной фиксации тесты проверяли бы английский
  /// интерфейс на русских строках.
  Widget app(List<Override> overrides) => ProviderScope(
    overrides: [
      appLocaleProvider.overrideWith((ref) => const Locale('ru')),
      ...overrides,
    ],
    child: const App(),
  );

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
        myUpcomingRidesProvider.overrideWith(
          (ref) async => [
            RideView(
              ride: Ride(
                id: 1,
                childId: 1,
                date: AshgabatTime.today(),
                plannedTime: '07:30',
                status: RideStatus.confirmed,
              ),
              childName: 'Мерет',
              codeWord: 'ýyldyz',
              fromAddress: 'ул. Героглы 1',
              toName: 'Школа №20',
              driverName: 'Аман Гурбанов',
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
    // Поездка на сегодня из расписания.
    expect(find.text('07:30'), findsOneWidget);
    expect(find.textContaining('Школа №20'), findsOneWidget);
    expect(find.text('Мерет'), findsWidgets);
    expect(find.textContaining('Сервер работает'), findsOneWidget);

    // Водитель семьи — ниже по списку.
    await tester.scrollUntilVisible(find.text('Аман Гурбанов'), 200);
    expect(find.text('Аман Гурбанов'), findsOneWidget);
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
