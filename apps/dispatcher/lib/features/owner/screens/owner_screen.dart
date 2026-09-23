import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

/// Панель владельца: сходится ли экономика и какие маршруты её портят.
///
/// Диспетчер этого экрана не видит: выручка, выплаты и балансы семей —
/// не его работа. Владелец, наоборот, не управляет поездками.
class OwnerScreen extends ConsumerStatefulWidget {
  const OwnerScreen({super.key});

  @override
  ConsumerState<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends ConsumerState<OwnerScreen> {
  int _days = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final period = lastDays(_days);
    final report = ref.watch(ownerReportProvider(period));

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(ownerReportProvider),
        child: ListView(
          padding: const EdgeInsets.all(ChildSpacing.m),
          children: [
            SegmentedButton<int>(
              segments: [
                ButtonSegment(value: 1, label: Text(l10n.ownerToday)),
                ButtonSegment(value: 7, label: Text(l10n.ownerWeek)),
                ButtonSegment(value: 30, label: Text(l10n.ownerMonth)),
              ],
              selected: {_days},
              onSelectionChanged: (value) =>
                  setState(() => _days = value.first),
            ),
            const SizedBox(height: ChildSpacing.m),
            switch (report) {
              AsyncData(value: final data) => _Report(report: data),
              AsyncError() => Center(child: Text(l10n.errorNetwork)),
              _ => const Center(child: CircularProgressIndicator()),
            },
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _export(period),
        icon: const Icon(Icons.table_view),
        label: Text(l10n.ownerExport),
      ),
    );
  }

  /// Выгрузка: одноразовая ссылка, которую открывают на компьютере.
  ///
  /// Файл не уходит через приложение: в нём выручка и балансы всех семей,
  /// и ему нечего делать в галерее телефона.
  Future<void> _export(ReportPeriod period) async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final client = ref.read(apiClientProvider);

    final path = await client.owner.exportLink(
      fromDate: period.from,
      toDate: period.to,
    );
    final url = '${client.host.replaceAll(RegExp(r'/$'), '')}$path';
    if (!mounted) return;

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.ownerExport),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(url),
            const SizedBox(height: ChildSpacing.m),
            Text(
              l10n.ownerExportHint,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: url));
              if (context.mounted) Navigator.of(context).pop();
              messenger.showSnackBar(
                SnackBar(content: Text(l10n.ownerExportCopy)),
              );
            },
            child: Text(l10n.ownerExportCopy),
          ),
        ],
      ),
    );
  }
}

/// Сам отчёт: сначала итог, потом то, из чего он сложился.
class _Report extends ConsumerWidget {
  const _Report({required this.report});

  final OwnerReport report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final balances = ref.watch(familyBalancesProvider).valueOrNull ?? const [];
    final rides = report.days.fold<int>(0, (sum, day) => sum + day.planned);
    final completed = report.days.fold<int>(
      0,
      (sum, day) => sum + day.completed,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(ChildSpacing.m),
            child: Column(
              children: [
                _Line(label: l10n.ownerRides, value: '$rides'),
                _Line(label: l10n.ownerCompleted, value: '$completed'),
                _Line(
                  label: l10n.ownerCompletion,
                  value: '${report.completionPercent}%',
                ),
                const Divider(),
                _Line(
                  label: l10n.ownerRevenue,
                  value: formatTenge(report.revenueTenge),
                ),
                _Line(
                  label: l10n.ownerSmsCost,
                  value: '−${formatTenge(report.smsCostTenge)}',
                ),
                _Line(
                  label: l10n.ownerDriverPay,
                  value: '−${formatTenge(report.driverPayTenge)}',
                ),
                const Divider(),
                _Line(
                  label: l10n.ownerMargin,
                  value: formatTenge(report.marginTenge),
                  strong: true,
                  danger: report.marginTenge < 0,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: ChildSpacing.m),

        _Section(title: l10n.ownerRouteEconomics),
        for (final route in report.routes)
          Card(
            margin: const EdgeInsets.only(bottom: ChildSpacing.xs),
            child: ListTile(
              dense: true,
              leading: Icon(
                route.marginTenge < 0 ? Icons.trending_down : Icons.trending_up,
                color: route.marginTenge < 0
                    ? ChildColors.danger
                    : ChildColors.success,
              ),
              title: Text('${route.childName} → ${route.destination}'),
              subtitle: Text(
                '${l10n.ownerRides}: ${route.rides} · '
                '${l10n.ownerRevenue}: ${formatTenge(route.revenueTenge)}',
              ),
              trailing: Text(
                formatTenge(route.marginTenge),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: route.marginTenge < 0 ? ChildColors.danger : null,
                ),
              ),
            ),
          ),

        const SizedBox(height: ChildSpacing.m),
        _Section(title: l10n.ownerDriverLoad),
        for (final load in report.drivers)
          Card(
            margin: const EdgeInsets.only(bottom: ChildSpacing.xs),
            child: ListTile(
              dense: true,
              title: Text(load.driverName),
              subtitle: Text(
                '${l10n.ownerRidesPerBlock}: '
                '${load.ridesPerBlock.toStringAsFixed(1)} · '
                '${l10n.ownerCancelled}: ${load.failed}',
              ),
              trailing: Text('${load.rides}'),
            ),
          ),

        const SizedBox(height: ChildSpacing.m),
        _Section(title: l10n.ownerEmptyHours),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ChildSpacing.s),
          child: Text(
            report.emptyHours.isEmpty
                ? l10n.ownerNoEmptyHours
                : report.emptyHours
                      .map((hour) => '${hour.toString().padLeft(2, '0')}:00')
                      .join('  '),
          ),
        ),

        const SizedBox(height: ChildSpacing.m),
        _Section(title: l10n.ownerBalances),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ChildSpacing.s),
          child: Text(l10n.ownerInDebt(report.familiesInDebt)),
        ),
        for (final row in balances)
          ListTile(
            dense: true,
            title: Text(row.familyName),
            trailing: Text(
              formatTenge(row.balanceTenge),
              style: TextStyle(
                color: row.inDebt ? ChildColors.danger : null,
                fontWeight: row.inDebt ? FontWeight.bold : null,
              ),
            ),
          ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(
      left: ChildSpacing.s,
      bottom: ChildSpacing.s,
    ),
    child: Text(title, style: Theme.of(context).textTheme.titleMedium),
  );
}

/// Строка «название — число». Крупные итоги выделяем.
class _Line extends StatelessWidget {
  const _Line({
    required this.label,
    required this.value,
    this.strong = false,
    this.danger = false,
  });

  final String label;
  final String value;
  final bool strong;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final style = strong
        ? Theme.of(context).textTheme.titleLarge
        : Theme.of(context).textTheme.bodyLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ChildSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(
            value,
            style: style?.copyWith(
              color: danger ? ChildColors.danger : null,
              fontWeight: strong ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
