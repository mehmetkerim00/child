import 'package:core_data/core_data.dart';
import 'package:core_data/testing.dart';
import 'package:dispatcher/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;
import 'package:flutter_test/flutter_test.dart';

/// Панель диспетчера: доска дня и справочники.
void main() {
  testWidgets('показывает доску дня и справочник семей', (tester) async {
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
            FakeTokenStorage(testDispatcherSession()),
          ),
          familiesProvider.overrideWith(
            (ref) async => [
              Family(id: 1, name: 'Семья Ниязовых', ownerPhone: '+99365200001'),
            ],
          ),
          childrenProvider.overrideWith((ref, familyId) async => []),
          driversProvider.overrideWith((ref) async => []),
          institutionsProvider.overrideWith((ref) async => []),
          todayRidesProvider.overrideWith(
            (ref) async => [
              RideView(
                ride: Ride(
                  id: 1,
                  childId: 1,
                  date: DateTime.utc(2026, 9, 23),
                  plannedTime: '07:30',
                  // Не подтверждена водителем — это колонка проблем.
                  status: RideStatus.scheduled,
                ),
                childName: 'Мерет',
                codeWord: 'ýyldyz',
                fromAddress: 'ул. Героглы 1',
                toName: 'Школа №20',
                driverName: 'Аман',
              ),
            ],
          ),
          allRoutesProvider.overrideWith((ref) async => []),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    // Доска дня: неподтверждённая поездка попадает в красную колонку.
    expect(find.text('Доска дня'), findsWidgets);
    expect(find.text('Проблемы'), findsOneWidget);
    expect(find.textContaining('07:30 · Мерет'), findsOneWidget);

    // Вторая вкладка — справочники.
    await tester.tap(find.text('Справочники').last);
    await tester.pumpAndSettle();
    expect(find.text('Семья Ниязовых'), findsOneWidget);
  });

  testWidgets('владелец видит отчёт, а не управление поездками', (
    tester,
  ) async {
    final today = DateTime.utc(2026, 9, 23);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiClientProvider.overrideWith((ref) => Client('http://localhost/')),
          serverHealthProvider.overrideWith(
            (ref) async => ServerHealth(
              status: 'ok',
              serverVersion: '0.0.0-test',
              serverTime: today,
            ),
          ),
          tokenStorageProvider.overrideWithValue(
            FakeTokenStorage(testOwnerSession()),
          ),
          ownerReportProvider.overrideWith(
            (ref, period) async => OwnerReport(
              fromDate: today,
              toDate: today,
              days: [
                DayStats(
                  date: today,
                  planned: 4,
                  completed: 3,
                  cancelled: 1,
                  revenueTenge: 10500,
                  smsCount: 2,
                  smsCostTenge: 600,
                  activeDrivers: 1,
                ),
              ],
              drivers: [
                DriverLoad(
                  driverId: 1,
                  driverName: 'Аман',
                  rides: 3,
                  blocks: 2,
                  ridesPerBlock: 1.5,
                  failed: 1,
                ),
              ],
              routes: [
                RouteEconomics(
                  routeId: 1,
                  childName: 'Мерет',
                  destination: 'Школа №20',
                  rides: 3,
                  revenueTenge: 10500,
                  smsCostTenge: 600,
                  driverPayTenge: 6000,
                  marginTenge: 3900,
                ),
              ],
              familyBalanceTenge: 13000,
              familiesInDebt: 1,
              revenueTenge: 10500,
              smsCostTenge: 600,
              driverPayTenge: 26000,
              marginTenge: -16100,
              completionPercent: 75,
              emptyHours: [12, 15],
            ),
          ),
          familyBalancesProvider.overrideWith(
            (ref) async => [
              FamilyBalanceRow(
                familyId: 1,
                familyName: 'Семья Ниязовых',
                balanceTenge: -3500,
                inDebt: true,
              ),
            ],
          ),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    // Экран владельца, а не доска дня.
    expect(find.text('Отчёты'), findsWidgets);
    expect(find.text('Доска дня'), findsNothing);

    // Главные цифры: выполняемость и отрицательная маржа.
    expect(find.text('75%'), findsOneWidget);
    expect(find.text('Валовая маржа'), findsOneWidget);

    // Должник виден по имени: за ним нужно идти.
    expect(find.text('Семья Ниязовых'), findsOneWidget);
  });
}
