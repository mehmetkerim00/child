import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_data/testing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parent/app.dart';
import 'package:parent/router.dart';

/// Онбординг при первом запуске: три экрана про безопасность.
void main() {
  Widget app({required bool seen}) => ProviderScope(
    overrides: [
      // Язык фиксируем: по умолчанию берётся язык машины, а в тестах
      // это en-US.
      appLocaleProvider.overrideWith((ref) => const Locale('ru')),
      apiClientProvider.overrideWith((ref) => Client('http://localhost/')),
      tokenStorageProvider.overrideWithValue(FakeTokenStorage()),
      onboardingSeenProvider.overrideWith((ref) => seen),
    ],
    child: const App(),
  );

  testWidgets('при первом запуске показывается объяснение', (tester) async {
    await tester.pumpWidget(app(seen: false));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.textContaining('Постоянный водитель'), findsOneWidget);

    // Листаем до конца: три экрана.
    await tester.tap(find.text('Дальше'));
    await tester.pumpAndSettle();
    expect(find.textContaining('из рук в руки'), findsOneWidget);

    await tester.tap(find.text('Дальше'));
    await tester.pumpAndSettle();
    expect(find.textContaining('нет интернета'), findsOneWidget);
    expect(find.text('Начать'), findsOneWidget);
  });

  testWidgets('при повторном запуске сразу вход', (tester) async {
    await tester.pumpWidget(app(seen: true));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Получить код'), findsOneWidget);
    expect(find.textContaining('Постоянный водитель'), findsNothing);
  });
}
