import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_domain/core_domain.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ride_live_screen.dart';

/// Лента событий поездки: что и когда произошло.
///
/// Кнопка в шапке открывает карту с машиной.
class RideEventsScreen extends ConsumerWidget {
  const RideEventsScreen({super.key, required this.view});

  final RideView view;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final events = ref.watch(rideEventsProvider(view.ride.id!));

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.parentRideTitle),
        actions: [
          IconButton(
            tooltip: l10n.rideOnMap,
            icon: const Icon(Icons.map),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => RideLiveScreen(view: view),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(rideEventsProvider),
        child: ListView(
          padding: const EdgeInsets.all(ChildSpacing.m),
          children: [
            Card(
              child: ListTile(
                title: Text(
                  '${view.ride.plannedTime} · ${view.childName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text('${view.fromAddress} → ${view.toName}'),
                trailing: Text(l10n.rideStatus(view.ride.domainStatus)),
              ),
            ),
            const SizedBox(height: ChildSpacing.l),
            Text(
              l10n.eventsTimeline,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: ChildSpacing.s),
            ...switch (events) {
              AsyncData(value: final list) when list.isEmpty => [
                Text(l10n.emptyList),
              ],
              AsyncData(value: final list) => [
                for (final event in list) _EventTile(event: event),
              ],
              AsyncError() => [Text(l10n.errorNetwork)],
              _ => [const Center(child: CircularProgressIndicator())],
            },
          ],
        ),
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({required this.event});

  final RideEvent event;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // Время события — местное, по Ашхабаду.
    final at = AshgabatTime.toLocal(event.at);
    final status = RideStatus.values.byName(event.type.name);

    return ListTile(
      leading: Icon(Icons.check_circle, color: ChildColors.success),
      title: Text(l10n.rideStatus(status)),
      subtitle: event.note == null ? null : Text(event.note!),
      trailing: Text(
        '${at.hour.toString().padLeft(2, '0')}:'
        '${at.minute.toString().padLeft(2, '0')}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
