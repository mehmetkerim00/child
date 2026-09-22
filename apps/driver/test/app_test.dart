import 'package:core_data/core_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:driver/app.dart';

/// Смоук-тест: приложение стартует с заглушкой сервера и меняет язык.
void main() {
  testWidgets('стартует, показывает статус сервера и переключает язык', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          serverHealthProvider.overrideWith(
            (ref) async => ServerHealth(status: 'ok', serverVersion: '0.0.0-test', serverTime: DateTime.utc(2026)),
          ),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('0.0.0-test'), findsOneWidget);
    expect(find.textContaining('Сервер работает'), findsOneWidget);

    await tester.tap(find.byTooltip('Язык'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Türkmen').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('Serwer işleýär'), findsOneWidget);
  });
}
