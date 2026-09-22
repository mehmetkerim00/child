import 'dart:async';

import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:driver/features/ride_flow/screens/ride_flow_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Очередь без настоящей базы: виджет-тест идёт в виртуальном времени,
/// а drift работает в реальном. Саму очередь проверяют тесты core_data.
class _FakeQueue implements RideEventQueue {
  final submitted = <RideEventType>[];
  final _pending = StreamController<int>.broadcast();
  int pendingCount = 0;
  bool online = true;

  @override
  Future<bool> submit({
    required int rideId,
    required RideEventType type,
    String? note,
    String? codeWord,
    String? institutionCode,
    bool hasSignature = false,
    double? lat,
    double? lng,
  }) async {
    submitted.add(type);
    if (online) return true;
    // Без связи событие остаётся в очереди.
    pendingCount++;
    _pending.add(pendingCount);
    return false;
  }

  @override
  Stream<int> watchPendingCount() async* {
    yield pendingCount;
    yield* _pending.stream;
  }

  @override
  Future<bool> sync() async => online;

  @override
  Future<void> clear() async => pendingCount = 0;
}

RideView _view() => RideView(
  ride: Ride(
    id: 42,
    childId: 1,
    date: DateTime.utc(2026, 9, 23),
    plannedTime: '07:30',
    status: RideStatus.confirmed,
  ),
  childName: 'Мерет',
  codeWord: 'ýyldyz',
  fromAddress: 'ул. Героглы 1',
  toName: 'Школа №20',
  driverName: 'Аман',
);

void main() {
  late _FakeQueue queue;

  setUp(() => queue = _FakeQueue());

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Клиент без закрытия: close() Serverpod ставит таймер на 100 мс,
          // который переживает дерево виджетов и роняет тест.
          apiClientProvider.overrideWith((ref) => Client('http://localhost/')),
          driverTodayRidesProvider.overrideWith((ref) async => []),
          rideEventQueueProvider.overrideWithValue(queue),
        ],
        child: MaterialApp(
          locale: const Locale('ru'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: childLocalizationsDelegates,
          home: RideFlowScreen(view: _view()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('кнопка ведёт по этапам поездки', (tester) async {
    await pumpScreen(tester);
    expect(find.text('Выехал'), findsOneWidget);

    await tester.tap(find.text('Выехал'));
    await tester.pumpAndSettle();

    // Следующий этап — посадка, появляется поле кодового слова.
    expect(find.text('Забрал'), findsOneWidget);
    expect(find.text('Кодовое слово'), findsOneWidget);
    expect(queue.submitted, [RideEventType.enRoute]);
  });

  testWidgets('без кодового слова посадка не проходит', (tester) async {
    await pumpScreen(tester);
    await tester.tap(find.text('Выехал'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Забрал'));
    await tester.pumpAndSettle();

    // Событие не ушло: приложение просит кодовое слово.
    expect(queue.submitted, [RideEventType.enRoute]);
    expect(find.textContaining('одовое слово'), findsWidgets);

    // С кодовым словом этап проходит.
    await tester.enterText(find.byType(TextField).first, 'ýyldyz');
    await tester.pumpAndSettle();
    expect(find.text('ýyldyz'), findsOneWidget, reason: 'поле заполнено');

    await tester.tap(find.text('Забрал'));
    await tester.pumpAndSettle();

    expect(queue.submitted, [RideEventType.enRoute, RideEventType.pickedUp]);
  });

  testWidgets('без связи видно, что события ждут отправки', (tester) async {
    queue.online = false;
    await pumpScreen(tester);

    await tester.tap(find.text('Выехал'));
    await tester.pumpAndSettle();

    expect(queue.submitted, [RideEventType.enRoute]);
    expect(find.textContaining('ждут отправки'), findsOneWidget);
  });
}
