import 'package:core_data/core_data.dart';
import 'package:core_domain/core_domain.dart' as domain;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// «Завтра»: водитель подтверждает завтрашние поездки до 20:00.
///
/// Без подтверждения диспетчер видит проблему вечером и успевает найти
/// замену — это защита от «тихого сбоя» (MVP_PLAN §6).
class TomorrowScreen extends ConsumerWidget {
  const TomorrowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final rides = ref.watch(driverTomorrowRidesProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(driverTomorrowRidesProvider),
      child: switch (rides) {
        AsyncData(value: final list) when list.isEmpty => ListView(
          children: [
            const SizedBox(height: ChildSpacing.xl),
            Center(child: Text(l10n.driverNoRidesTomorrow)),
          ],
        ),
        AsyncData(value: final list) => ListView(
          padding: const EdgeInsets.all(ChildSpacing.m),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: ChildSpacing.m),
              child: Text(
                l10n.driverConfirmDeadline,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            for (final view in list) _RideRow(view: view),
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
    );
  }
}

class _RideRow extends ConsumerWidget {
  const _RideRow({required this.view});

  final RideView view;

  Ride get ride => view.ride;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final status = ride.domainStatus;
    final confirmed = status == domain.RideStatus.confirmed;

    return RideCard(
      time: ride.plannedTime,
      title: view.childName,
      subtitle: '${view.fromAddress} → ${view.toName}',
      statusLabel: confirmed ? l10n.driverConfirmed : l10n.rideStatus(status),
      statusTone: rideToneFor(status),
      actions: confirmed
          ? const []
          : [
              TextButton(
                onPressed: () => _decline(context, ref),
                child: Text(l10n.driverDecline),
              ),
              FilledButton(
                onPressed: () async {
                  await ref.read(apiClientProvider).rides.confirm(ride.id!);
                  ref.invalidate(driverTomorrowRidesProvider);
                },
                child: Text(l10n.driverConfirm),
              ),
            ],
    );
  }

  /// Отказ без причины не принимается: диспетчеру нужно знать, что случилось.
  Future<void> _decline(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final controller = TextEditingController();

    final reason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.driverDecline),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: l10n.driverDeclineReason,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: ChildSpacing.s),
            Text(l10n.driverDeclineHint),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: Text(l10n.save),
          ),
        ],
      ),
    );

    if (reason == null || reason.isEmpty) return;
    await ref.read(apiClientProvider).rides.decline(ride.id!, reason);
    ref.invalidate(driverTomorrowRidesProvider);
  }
}
