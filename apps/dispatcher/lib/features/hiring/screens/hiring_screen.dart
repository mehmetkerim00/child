import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../../crud/widgets/enum_labels.dart';
import '../widgets/application_card.dart';
import '../widgets/incident_dialogs.dart';

/// Конвейер найма: кандидаты, инциденты, расчёты.
///
/// Водитель — главный дефицит сервиса (RESEARCH.md), поэтому весь путь от
/// анкеты до выплаты живёт на одном экране: диспетчер не ищет, где что.
class HiringScreen extends ConsumerStatefulWidget {
  const HiringScreen({super.key});

  @override
  ConsumerState<HiringScreen> createState() => _HiringScreenState();
}

class _HiringScreenState extends ConsumerState<HiringScreen> {
  int _section = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(ChildSpacing.m),
          child: SegmentedButton<int>(
            segments: [
              ButtonSegment(value: 0, label: Text(l10n.hiringTitle)),
              ButtonSegment(value: 1, label: Text(l10n.incidentsTitle)),
              ButtonSegment(value: 2, label: Text(l10n.payoutsTitle)),
            ],
            selected: {_section},
            onSelectionChanged: (value) =>
                setState(() => _section = value.first),
          ),
        ),
        Expanded(
          child: switch (_section) {
            0 => const _ApplicationsList(),
            1 => const _IncidentsList(),
            _ => const _PayoutsList(),
          },
        ),
      ],
    );
  }
}

/// Кандидаты по этапам, свежие сверху.
class _ApplicationsList extends ConsumerWidget {
  const _ApplicationsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final applications = ref.watch(applicationsProvider(null));

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(applicationsProvider),
      child: switch (applications) {
        AsyncData(value: final list) when list.isEmpty => _Empty(
          l10n.emptyList,
        ),
        AsyncData(value: final list) => ListView(
          padding: const EdgeInsets.all(ChildSpacing.m),
          children: [
            for (final application in list)
              ApplicationCard(application: application),
          ],
        ),
        AsyncError() => _Empty(l10n.errorNetwork),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

/// Журнал инцидентов: открытые сверху, закрытые — с решением.
class _IncidentsList extends ConsumerWidget {
  const _IncidentsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final incidents = ref.watch(incidentsProvider);
    final drivers = ref.watch(driversProvider).valueOrNull ?? const <Driver>[];

    String driverName(int? id) =>
        drivers
            .where((driver) => driver.id == id)
            .map((d) => d.name)
            .firstOrNull ??
        '';

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(incidentsProvider),
        child: switch (incidents) {
          AsyncData(value: final list) when list.isEmpty => _Empty(
            l10n.emptyList,
          ),
          AsyncData(value: final list) => ListView(
            padding: const EdgeInsets.all(ChildSpacing.m),
            children: [
              for (final incident in list)
                Card(
                  margin: const EdgeInsets.only(bottom: ChildSpacing.s),
                  child: ListTile(
                    leading: Icon(
                      incident.resolvedAt == null
                          ? Icons.report_problem
                          : Icons.task_alt,
                      color: switch (incident.severity) {
                        IncidentSeverity.critical => ChildColors.danger,
                        IncidentSeverity.serious => ChildColors.warning,
                        IncidentSeverity.note => ChildColors.success,
                      },
                    ),
                    title: Text(incident.description),
                    subtitle: Text(
                      [
                        l10n.incidentSeverity(incident.severity),
                        if (driverName(incident.driverId).isNotEmpty)
                          driverName(incident.driverId),
                        if (incident.resolution != null)
                          '${l10n.incidentResolution}: ${incident.resolution}',
                      ].join(' · '),
                    ),
                    trailing: incident.resolvedAt != null
                        ? null
                        : TextButton(
                            onPressed: () =>
                                resolveIncidentDialog(context, ref, incident),
                            child: Text(l10n.incidentResolution),
                          ),
                  ),
                ),
            ],
          ),
          AsyncError() => _Empty(l10n.errorNetwork),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => logIncidentDialog(context, ref),
        icon: const Icon(Icons.add),
        label: Text(l10n.incidentLog),
      ),
    );
  }
}

/// Расчёты водителям за периоды.
class _PayoutsList extends ConsumerWidget {
  const _PayoutsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final payouts = ref.watch(payoutsProvider);
    final drivers = ref.watch(driversProvider).valueOrNull ?? const <Driver>[];

    String driverName(int id) =>
        drivers
            .where((driver) => driver.id == id)
            .map((d) => d.name)
            .firstOrNull ??
        '';

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(payoutsProvider),
        child: switch (payouts) {
          AsyncData(value: final list) when list.isEmpty => _Empty(
            l10n.emptyList,
          ),
          AsyncData(value: final list) => ListView(
            padding: const EdgeInsets.all(ChildSpacing.m),
            children: [
              for (final payout in list)
                Card(
                  margin: const EdgeInsets.only(bottom: ChildSpacing.s),
                  child: ListTile(
                    leading: Icon(
                      payout.paidAt == null
                          ? Icons.hourglass_bottom
                          : Icons.check_circle,
                      color: payout.paidAt == null
                          ? ChildColors.warning
                          : ChildColors.success,
                    ),
                    title: Text(
                      '${driverName(payout.driverId)} · '
                      '${l10n.balanceManat(formatTenge(payout.totalTenge))}',
                    ),
                    subtitle: Text(
                      '${_date(payout.fromDate)}–${_date(payout.toDate)} · '
                      '${l10n.payoutBlocks(payout.blocks)}',
                    ),
                    trailing: payout.paidAt != null
                        ? null
                        : TextButton(
                            onPressed: () async {
                              await ref
                                  .read(apiClientProvider)
                                  .hiring
                                  .markPaid(payout.id!);
                              ref.invalidate(payoutsProvider);
                            },
                            child: Text(l10n.payoutMarkPaid),
                          ),
                  ),
                ),
            ],
          ),
          AsyncError() => _Empty(l10n.errorNetwork),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => calculatePayoutDialog(context, ref),
        icon: const Icon(Icons.calculate),
        label: Text(l10n.payoutsTitle),
      ),
    );
  }

  String _date(DateTime value) =>
      '${value.day}.${value.month.toString().padLeft(2, '0')}';
}

/// Пустой список или ошибка: RefreshIndicator требует прокручиваемый виджет.
class _Empty extends StatelessWidget {
  const _Empty(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => ListView(
    children: [
      const SizedBox(height: ChildSpacing.xl),
      Center(child: Text(text)),
    ],
  );
}
