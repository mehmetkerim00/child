import 'package:core_data/core_data.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/widgets/account_menu.dart';

/// Баланс семьи: остаток, ожидающие пополнения и история операций.
///
/// Суммы хранятся в тенге целыми числами, здесь переводятся в манаты
/// только для показа.
class BalanceScreen extends ConsumerWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final balance = ref.watch(myBalanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.parentBalanceTitle),
        actions: const [LanguageMenu(), AccountMenu()],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(myBalanceProvider),
        child: switch (balance) {
          AsyncData(value: final view) => ListView(
            padding: const EdgeInsets.all(ChildSpacing.m),
            children: [
              _BalanceCard(view: view),
              if (view.lowBalance) ...[
                const SizedBox(height: ChildSpacing.m),
                StubNotice(text: l10n.balanceLowWarning),
              ],
              const SizedBox(height: ChildSpacing.l),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(ChildSpacing.m),
                  child: Text(l10n.balanceHowTo),
                ),
              ),
              const SizedBox(height: ChildSpacing.l),
              if (view.entries.isEmpty)
                Text(l10n.emptyList)
              else
                for (final entry in view.entries) _EntryTile(entry: entry),
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

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.view});

  final BalanceView view;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final positive = view.balanceTenge >= 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(ChildSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.balanceCurrent, style: theme.textTheme.titleMedium),
            const SizedBox(height: ChildSpacing.xs),
            Text(
              l10n.balanceManat(formatTenge(view.balanceTenge)),
              style: theme.textTheme.headlineLarge?.copyWith(
                color: positive ? ChildColors.success : ChildColors.danger,
              ),
            ),
            if (view.pendingTopUpTenge > 0) ...[
              const SizedBox(height: ChildSpacing.s),
              Text(
                '${l10n.balancePending}: '
                '${l10n.balanceManat(formatTenge(view.pendingTopUpTenge))}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ChildColors.warning,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EntryTile extends StatelessWidget {
  const _EntryTile({required this.entry});

  final LedgerEntry entry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final at = AshgabatTime.toLocal(entry.createdAt);
    final date =
        '${at.day}.${at.month.toString().padLeft(2, '0')} '
        '${at.hour.toString().padLeft(2, '0')}:'
        '${at.minute.toString().padLeft(2, '0')}';

    final (title, icon) = switch (entry.type) {
      LedgerEntryType.cashTopup => (l10n.ledgerCashTopup, Icons.payments),
      LedgerEntryType.rideCharge => (
        l10n.ledgerRideCharge,
        Icons.directions_car,
      ),
      LedgerEntryType.adjust => (l10n.ledgerAdjust, Icons.edit_note),
    };
    final positive = entry.amountTenge >= 0;

    return ListTile(
      leading: Icon(
        icon,
        color: positive ? ChildColors.success : ChildColors.textSecondary,
      ),
      title: Text(title),
      subtitle: Text(entry.note == null ? date : '$date · ${entry.note}'),
      trailing: Text(
        '${positive ? '+' : ''}${formatTenge(entry.amountTenge)}',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: positive ? ChildColors.success : ChildColors.danger,
        ),
      ),
    );
  }
}
