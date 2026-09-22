import 'package:core_data/core_data.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../widgets/cash_top_up_dialog.dart';

/// Приём наличных водителем.
///
/// Водитель только фиксирует приём: деньги попадут на баланс семьи
/// после подтверждения диспетчером. Так никто не может «зачислить»
/// деньги в одиночку.
class CashScreen extends ConsumerWidget {
  const CashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final topUps = ref.watch(driverTopUpsProvider);
    final families = ref.watch(driverFamiliesProvider).valueOrNull ?? const [];

    return Scaffold(
      floatingActionButton: families.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () async {
                await showCashTopUpDialog(context, ref, families);
                ref.invalidate(driverTopUpsProvider);
              },
              icon: const Icon(Icons.payments),
              label: Text(l10n.driverCashAccept),
            ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(driverTopUpsProvider),
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
                  familyName: families
                      .where((family) => family.id == topUp.familyId)
                      .map((family) => family.name)
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

class _TopUpTile extends StatelessWidget {
  const _TopUpTile({required this.topUp, this.familyName});

  final CashTopUp topUp;
  final String? familyName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final at = AshgabatTime.toLocal(topUp.createdAt);
    final date =
        '${at.day}.${at.month.toString().padLeft(2, '0')} '
        '${at.hour.toString().padLeft(2, '0')}:'
        '${at.minute.toString().padLeft(2, '0')}';

    final (status, color) = topUp.rejectedAt != null
        ? (l10n.driverCashRejected, ChildColors.danger)
        : topUp.confirmedAt != null
        ? (l10n.driverCashConfirmed, ChildColors.success)
        : (l10n.driverCashPending, ChildColors.warning);

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: ListTile(
        leading: Icon(Icons.payments, color: color),
        title: Text(
          '${familyName ?? ''} · '
          '${l10n.balanceManat(formatTenge(topUp.amountTenge))}',
        ),
        subtitle: Text(
          '$date · $status'
          '${topUp.rejectReason == null ? '' : '\n${topUp.rejectReason}'}',
        ),
      ),
    );
  }
}
