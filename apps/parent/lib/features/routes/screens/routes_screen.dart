import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/route_request_dialog.dart';

/// «Маршруты»: недельное расписание ребёнка и заявка на новый маршрут.
///
/// Заявку активирует диспетчер — он же назначает водителя и цену.
class RoutesScreen extends ConsumerWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final routes = ref.watch(myRoutesProvider);
    final children = ref.watch(myChildrenProvider).valueOrNull ?? const [];

    Future<void> request() async {
      final draft = await showRouteRequestDialog(context, ref, children);
      if (draft == null) return;
      await ref.read(apiClientProvider).routes.requestRoute(draft);
      ref.invalidate(myRoutesProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.routeRequestSent)));
      }
    }

    return Scaffold(
      floatingActionButton: children.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: request,
              icon: const Icon(Icons.add_road),
              label: Text(l10n.parentRequestRoute),
            ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(myRoutesProvider),
        child: switch (routes) {
          AsyncData(value: final list) when list.isEmpty => ListView(
            children: [
              const SizedBox(height: ChildSpacing.xl),
              Center(child: Text(l10n.emptyList)),
            ],
          ),
          AsyncData(value: final list) => ListView(
            padding: const EdgeInsets.all(ChildSpacing.m),
            children: [
              for (final route in list)
                _RouteTile(
                  route: route,
                  childName: children
                      .where((c) => c.id == route.childId)
                      .map((c) => c.name)
                      .firstOrNull,
                ),
            ],
          ),
          AsyncError() => ListView(
            children: [
              const SizedBox(height: ChildSpacing.xl),
              Center(child: Text(l10n.errorNetwork)),
            ],
          ),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}

class _RouteTile extends StatelessWidget {
  const _RouteTile({required this.route, this.childName});

  final RouteTemplate route;
  final String? childName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final direction = route.direction == RouteDirection.toInstitution
        ? l10n.directionToInstitution
        : l10n.directionToHome;

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: ListTile(
        leading: const Icon(Icons.route),
        title: Text('${childName ?? ''} · ${route.pickupTime}'),
        subtitle: Text(
          '${l10n.weekdaysList(route.weekdays)} · $direction\n'
          '${route.fromAddress} → ${route.toAddress ?? ''}',
        ),
        isThreeLine: true,
        trailing: Chip(
          label: Text(
            route.active ? l10n.routeStatusActive : l10n.routeStatusPending,
          ),
          backgroundColor: route.active
              ? ChildColors.success.withValues(alpha: 0.15)
              : ChildColors.warning.withValues(alpha: 0.15),
        ),
      ),
    );
  }
}
