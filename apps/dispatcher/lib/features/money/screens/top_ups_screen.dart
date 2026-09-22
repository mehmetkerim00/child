import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

/// Подтверждение наличных, принятых водителями.
///
/// Деньги попадают на баланс семьи только отсюда: водитель фиксирует
/// приём, диспетчер подтверждает. Один человек не может зачислить деньги.
class TopUpsScreen extends ConsumerWidget {
  const TopUpsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final topUps = ref.watch(pendingTopUpsProvider);
    final families =
        ref.watch(familiesProvider).valueOrNull ?? const <Family>[];
    final drivers = ref.watch(driversProvider).valueOrNull ?? const <Driver>[];

    String nameOf(int id, List<dynamic> list) =>
        list
            .where((item) => item.id == id)
            .map((item) => item.name as String)
            .firstOrNull ??
        '';

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(pendingTopUpsProvider),
        child: switch (topUps) {
          AsyncData(value: final list) when list.isEmpty => ListView(
            children: [
              const SizedBox(height: ChildSpacing.xl),
              Center(child: Text(l10n.emptyList)),
            ],
          ),
          AsyncData(value: final list) => ListView(
            padding: const EdgeInsets.all(ChildSpacing.m),
            children: [
              for (final topUp in list)
                _TopUpTile(
                  topUp: topUp,
                  familyName: nameOf(topUp.familyId, families),
                  driverName: nameOf(topUp.driverId, drivers),
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

class _TopUpTile extends ConsumerWidget {
  const _TopUpTile({
    required this.topUp,
    required this.familyName,
    required this.driverName,
  });

  final CashTopUp topUp;
  final String familyName;
  final String driverName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final at = AshgabatTime.toLocal(topUp.createdAt);
    final date =
        '${at.day}.${at.month.toString().padLeft(2, '0')} '
        '${at.hour.toString().padLeft(2, '0')}:'
        '${at.minute.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: ListTile(
        leading: Icon(
          topUp.hasSignature ? Icons.draw : Icons.payments,
          color: ChildColors.warning,
        ),
        title: Text(
          '$familyName · ${l10n.balanceManat(formatTenge(topUp.amountTenge))}',
        ),
        subtitle: Text('$date · $driverName'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => _reject(context, ref),
              child: Text(l10n.dispatcherReject),
            ),
            FilledButton(
              onPressed: () async {
                await ref
                    .read(apiClientProvider)
                    .directory
                    .confirmTopUp(topUp.id!);
                ref.invalidate(pendingTopUpsProvider);
              },
              child: Text(l10n.dispatcherConfirm),
            ),
          ],
        ),
      ),
    );
  }

  /// Отказ без причины не принимаем: через месяц никто не вспомнит,
  /// почему деньги не зачислили.
  Future<void> _reject(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final controller = TextEditingController();
    final reason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.dispatcherReject),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            labelText: l10n.dispatcherRejectReason,
            border: const OutlineInputBorder(),
          ),
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
    await ref
        .read(apiClientProvider)
        .directory
        .rejectTopUp(topUpId: topUp.id!, reason: reason);
    ref.invalidate(pendingTopUpsProvider);
  }
}
