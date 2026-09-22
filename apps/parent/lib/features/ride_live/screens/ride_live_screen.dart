import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/osm_tiles.dart';

/// Центр Ашхабада — карта открывается здесь, пока нет ни одной точки.
const _ashgabat = LatLng(37.9601, 58.3261);

/// Поездка на карте: где машина сейчас и каким путём ехали.
///
/// Точки приходят, только пока поездка активна: после «Передал» водитель
/// выключает геолокацию, и карта показывает завершённый маршрут.
class RideLiveScreen extends ConsumerWidget {
  const RideLiveScreen({super.key, required this.view});

  final RideView view;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final rideId = view.ride.id!;
    final track = ref.watch(rideTrackProvider(rideId));
    final live = ref.watch(rideLocationStreamProvider(rideId));

    final points = <LatLng>[
      for (final row in track.valueOrNull ?? const <RideLocation>[])
        LatLng(row.lat, row.lng),
    ];
    final liveRow = live.valueOrNull;
    if (liveRow != null) {
      final last = LatLng(liveRow.lat, liveRow.lng);
      if (points.isEmpty || points.last != last) points.add(last);
    }
    final car = points.isEmpty ? null : points.last;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.parentRideTitle)),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: car ?? _ashgabat,
                initialZoom: car == null ? 12 : 15,
              ),
              children: [
                const OsmTileLayer(),
                if (points.length > 1)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: points,
                        strokeWidth: 4,
                        color: ChildColors.primary,
                      ),
                    ],
                  ),
                if (car != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: car,
                        width: 44,
                        height: 44,
                        child: const _CarMarker(),
                      ),
                    ],
                  ),
                osmAttribution(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(ChildSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${view.ride.plannedTime} · ${view.childName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('${view.fromAddress} → ${view.toName}'),
                const SizedBox(height: ChildSpacing.s),
                Row(
                  children: [
                    Icon(
                      car == null ? Icons.location_off : Icons.location_on,
                      color: car == null
                          ? Theme.of(context).colorScheme.outline
                          : ChildColors.success,
                      size: 20,
                    ),
                    const SizedBox(width: ChildSpacing.s),
                    Expanded(
                      child: Text(
                        car == null
                            ? l10n.trackingOff
                            : l10n.rideStatus(view.ride.domainStatus),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CarMarker extends StatelessWidget {
  const _CarMarker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ChildColors.primary,
        shape: BoxShape.circle,
        border: Border.all(color: ChildColors.onPrimary, width: 3),
      ),
      child: const Icon(
        Icons.directions_car,
        color: ChildColors.onPrimary,
        size: 22,
      ),
    );
  }
}
