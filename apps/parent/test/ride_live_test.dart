import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parent/features/ride_live/screens/ride_live_screen.dart';
import 'package:parent/features/ride_live/widgets/osm_tiles.dart';

RideView _view() => RideView(
  ride: Ride(
    id: 42,
    childId: 1,
    date: DateTime.utc(2026, 9, 23),
    plannedTime: '07:30',
    status: RideStatus.inTransit,
  ),
  childName: 'Мерет',
  codeWord: 'ýyldyz',
  fromAddress: 'ул. Героглы 1',
  toName: 'Школа №20',
  driverName: 'Аман',
);

RideLocation _point(int index) => RideLocation(
  rideId: 42,
  at: DateTime.utc(2026, 9, 23, 7, 30 + index),
  lat: 37.9601 + index * 0.001,
  lng: 58.3261 + index * 0.001,
);

void main() {
  Future<void> pumpMap(
    WidgetTester tester, {
    required List<RideLocation> track,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiClientProvider.overrideWith((ref) => Client('http://localhost/')),
          rideTrackProvider.overrideWith((ref, rideId) async => track),
          rideLocationStreamProvider.overrideWith(
            (ref, rideId) => const Stream<RideLocation>.empty(),
          ),
        ],
        child: MaterialApp(
          locale: const Locale('ru'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: childLocalizationsDelegates,
          home: RideLiveScreen(view: _view()),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('показывает путь и машину на карте', (tester) async {
    await pumpMap(tester, track: [_point(0), _point(1), _point(2)]);

    expect(find.byType(FlutterMap), findsOneWidget);
    expect(find.byType(PolylineLayer), findsOneWidget);
    expect(find.byIcon(Icons.directions_car), findsOneWidget);
    // Копирайт OpenStreetMap обязателен по условиям использования тайлов.
    expect(find.textContaining('OpenStreetMap'), findsOneWidget);
  });

  testWidgets('без точек карта пустая и видно, что геолокация выключена', (
    tester,
  ) async {
    await pumpMap(tester, track: const []);

    expect(find.byType(FlutterMap), findsOneWidget);
    expect(find.byType(PolylineLayer), findsNothing);
    expect(find.byIcon(Icons.directions_car), findsNothing);
    expect(find.text('Геолокация выключена'), findsOneWidget);
  });

  test('тайлы запрашиваются со своим User-Agent', () {
    // OSM требует осмысленный User-Agent: по нему видно, кто ходит за тайлами.
    expect(OsmTileLayer.userAgent, contains('ChildApp'));
    expect(OsmTileLayer.urlTemplate, startsWith('https://tile.openstreetmap'));
  });
}
