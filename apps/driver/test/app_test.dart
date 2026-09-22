import 'package:core_data/core_data.dart';
import 'package:core_data/testing.dart';
import 'package:driver/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Приложение водителя: профиль и кнопка этапа.
void main() {
  testWidgets('с сессией показывает профиль водителя', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Клиент без закрытия: close() Serverpod ставит таймер на 100 мс,
          // который переживает дерево виджетов и роняет тест.
          apiClientProvider.overrideWith((ref) => Client('http://localhost/')),
          serverHealthProvider.overrideWith(
            (ref) async => ServerHealth(
              status: 'ok',
              serverVersion: '0.0.0-test',
              serverTime: DateTime.utc(2026),
            ),
          ),
          tokenStorageProvider.overrideWithValue(
            FakeTokenStorage(testDriverSession()),
          ),
          myDriverProfileProvider.overrideWith(
            (ref) async => Driver(
              phone: '+99365100001',
              name: 'Аман Гурбанов',
              carModel: 'Toyota Corolla',
              carPlate: 'AG 1234 AH',
            ),
          ),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Аман Гурбанов'), findsOneWidget);
    expect(find.textContaining('AG 1234 AH'), findsOneWidget);
    expect(find.text('Выехал'), findsOneWidget);
  });
}
