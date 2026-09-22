import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

/// Маршруты у диспетчера: активация заявок родителей и ручной запуск
/// генератора поездок.
class RoutesAdminScreen extends ConsumerWidget {
  const RoutesAdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final routes = ref.watch(allRoutesProvider);
    final children = ref.watch(childrenProvider(null)).valueOrNull ?? const [];
    final drivers = ref.watch(driversProvider).valueOrNull ?? const <Driver>[];

    Future<void> generate() async {
      final count = await ref
          .read(apiClientProvider)
          .directory
          .generateUpcomingRides();
      ref.invalidate(todayRidesProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.dispatcherRidesCreated(count))),
        );
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: generate,
        icon: const Icon(Icons.event_repeat),
        label: Text(l10n.dispatcherGenerateRides),
      ),
      body: switch (routes) {
        AsyncData(value: final list) when list.isEmpty => Center(
          child: Text(l10n.emptyList),
        ),
        AsyncData(value: final list) => ListView(
          padding: const EdgeInsets.all(ChildSpacing.m),
          children: [
            for (final route in list)
              _RouteRow(
                route: route,
                childName: children
                    .where((c) => c.id == route.childId)
                    .map((c) => c.name)
                    .firstOrNull,
                driverName: drivers
                    .where((d) => d.id == route.driverId)
                    .map((d) => d.name)
                    .firstOrNull,
                drivers: drivers,
              ),
          ],
        ),
        AsyncError() => Center(child: Text(l10n.errorNetwork)),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _RouteRow extends ConsumerWidget {
  const _RouteRow({
    required this.route,
    required this.drivers,
    this.childName,
    this.driverName,
  });

  final RouteTemplate route;
  final List<Driver> drivers;
  final String? childName;
  final String? driverName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final direction = route.direction == RouteDirection.toInstitution
        ? l10n.directionToInstitution
        : l10n.directionToHome;

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: ListTile(
        leading: Icon(
          route.active ? Icons.check_circle : Icons.pending_actions,
          color: route.active ? ChildColors.success : ChildColors.warning,
        ),
        title: Text('${childName ?? ''} · ${route.pickupTime}'),
        subtitle: Text(
          '${l10n.weekdaysList(route.weekdays)} · $direction\n'
          '${route.fromAddress} → ${route.toAddress ?? ''}'
          '${driverName == null ? '' : ' · $driverName'}',
        ),
        isThreeLine: true,
        trailing: route.active
            ? TextButton(
                onPressed: () async {
                  await ref
                      .read(apiClientProvider)
                      .directory
                      .deactivateRoute(route.id!);
                  ref.invalidate(allRoutesProvider);
                },
                child: Text(l10n.dispatcherDeactivate),
              )
            : FilledButton(
                onPressed: drivers.isEmpty
                    ? null
                    : () => _activate(context, ref),
                child: Text(l10n.dispatcherActivate),
              ),
      ),
    );
  }

  /// Активация: диспетчер выбирает водителя и цену поездки,
  /// после чего сервер сразу создаёт поездки на сегодня и завтра.
  Future<void> _activate(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    var driverId = drivers.first.id!;
    final price = TextEditingController(text: '30');

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(l10n.dispatcherActivate),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<int>(
                  initialValue: driverId,
                  decoration: InputDecoration(
                    labelText: l10n.dispatcherAssignDriver,
                    border: const OutlineInputBorder(),
                  ),
                  items: [
                    for (final driver in drivers)
                      DropdownMenuItem(
                        value: driver.id,
                        child: Text('${driver.name} · ${driver.carPlate}'),
                      ),
                  ],
                  onChanged: (value) =>
                      setState(() => driverId = value ?? driverId),
                ),
                const SizedBox(height: ChildSpacing.m),
                TextField(
                  controller: price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: l10n.routePrice,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.save),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;
    await ref
        .read(apiClientProvider)
        .directory
        .activateRoute(
          routeId: route.id!,
          driverId: driverId,
          pricePerRide: int.tryParse(price.text.trim()) ?? 0,
        );
    ref.invalidate(allRoutesProvider);
    ref.invalidate(todayRidesProvider);
  }
}
