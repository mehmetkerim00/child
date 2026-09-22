import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ride_flow/screens/ride_flow_screen.dart';
import '../../ride_flow/widgets/pending_events_section.dart';
import '../widgets/server_status_section.dart';

/// «Маршрут дня»: поездки водителя на сегодня по порядку.
///
/// Кнопки этапов поездки (Выехал → Забрал → …) появятся в S3.
class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final profile = ref.watch(myDriverProfileProvider);
    final rides = ref.watch(driverTodayRidesProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(driverTodayRidesProvider);
        ref.invalidate(myDriverProfileProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(ChildSpacing.m),
        children: [
          const PendingEventsSection(),
          const SizedBox(height: ChildSpacing.m),
          const ServerStatusSection(),
          const SizedBox(height: ChildSpacing.m),
          Card(
            child: switch (profile) {
              AsyncData(value: final driver?) => ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(driver.name),
                subtitle: Text('${driver.carModel} · ${driver.carPlate}'),
              ),
              AsyncError() => ListTile(title: Text(l10n.errorNetwork)),
              _ => const ListTile(
                title: Center(child: CircularProgressIndicator()),
              ),
            },
          ),
          const SizedBox(height: ChildSpacing.l),
          Text(l10n.ridesToday, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: ChildSpacing.s),
          ...switch (rides) {
            AsyncData(value: final list) when list.isEmpty => [
              Padding(
                padding: const EdgeInsets.all(ChildSpacing.m),
                child: Text(l10n.emptyList),
              ),
            ],
            AsyncData(value: final list) => [
              for (final view in list)
                RideCard(
                  time: view.ride.plannedTime,
                  title: view.childName,
                  subtitle: '${view.fromAddress} → ${view.toName}',
                  statusLabel: l10n.rideStatus(view.ride.domainStatus),
                  statusTone: rideToneFor(view.ride.domainStatus),
                  actions: [
                    FilledButton.icon(
                      icon: const Icon(Icons.play_arrow),
                      label: Text(l10n.rideFlowTitle),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => RideFlowScreen(view: view),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
            AsyncError() => [Text(l10n.errorNetwork)],
            _ => [const Center(child: CircularProgressIndicator())],
          },
        ],
      ),
    );
  }
}
