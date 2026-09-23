import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../../crud/widgets/enum_labels.dart';

/// Фиксация инцидента: что случилось и с кем.
///
/// Разбор уважительный — запись нужна, чтобы видеть повторы, а не чтобы
/// наказывать: удержать водителя тяжелее, чем найти нового.
Future<void> logIncidentDialog(BuildContext context, WidgetRef ref) async {
  final l10n = context.l10n;
  final drivers = ref.read(driversProvider).valueOrNull ?? const <Driver>[];
  final controller = TextEditingController();
  var severity = IncidentSeverity.note;
  int? driverId;

  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(l10n.incidentLog),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<int?>(
              initialValue: driverId,
              decoration: InputDecoration(labelText: l10n.dispatcherTabDrivers),
              items: [
                const DropdownMenuItem(value: null, child: Text('—')),
                for (final driver in drivers)
                  DropdownMenuItem(value: driver.id, child: Text(driver.name)),
              ],
              onChanged: (value) => setState(() => driverId = value),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<IncidentSeverity>(
              initialValue: severity,
              decoration: InputDecoration(labelText: l10n.incidentsTitle),
              items: [
                for (final value in IncidentSeverity.values)
                  DropdownMenuItem(
                    value: value,
                    child: Text(l10n.incidentSeverity(value)),
                  ),
              ],
              onChanged: (value) =>
                  setState(() => severity = value ?? IncidentSeverity.note),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ],
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

  if (saved != true || controller.text.trim().isEmpty) return;
  await ref
      .read(apiClientProvider)
      .hiring
      .logIncident(
        severity: severity,
        description: controller.text.trim(),
        driverId: driverId,
      );
  ref.invalidate(incidentsProvider);
}

/// Закрытие инцидента решением: «просто закрыть» сервер не примет.
Future<void> resolveIncidentDialog(
  BuildContext context,
  WidgetRef ref,
  Incident incident,
) async {
  final l10n = context.l10n;
  final controller = TextEditingController();
  final resolution = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.incidentResolution),
      content: TextField(
        controller: controller,
        autofocus: true,
        maxLines: 3,
        decoration: const InputDecoration(border: OutlineInputBorder()),
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

  if (resolution == null || resolution.isEmpty) return;
  await ref
      .read(apiClientProvider)
      .hiring
      .resolveIncident(incidentId: incident.id!, resolution: resolution);
  ref.invalidate(incidentsProvider);
}

/// Расчёт за прошедшую неделю.
///
/// Ставки задаются диспетчером на месте: тарифы в Ашхабаде меняются, и
/// зашивать их в код значит каждый раз ждать релиз.
Future<void> calculatePayoutDialog(BuildContext context, WidgetRef ref) async {
  final l10n = context.l10n;
  final drivers = ref.read(driversProvider).valueOrNull ?? const <Driver>[];
  if (drivers.isEmpty) return;

  final blockPay = TextEditingController(text: '10000');
  final perRide = TextEditingController(text: '2000');
  var driverId = drivers.first.id!;
  var days = 7;

  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(l10n.payoutsTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<int>(
              initialValue: driverId,
              decoration: InputDecoration(labelText: l10n.dispatcherTabDrivers),
              items: [
                for (final driver in drivers)
                  DropdownMenuItem(value: driver.id!, child: Text(driver.name)),
              ],
              onChanged: (value) =>
                  setState(() => driverId = value ?? driverId),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              initialValue: days,
              decoration: InputDecoration(labelText: l10n.payoutBlocks(days)),
              items: const [
                DropdownMenuItem(value: 7, child: Text('7')),
                DropdownMenuItem(value: 14, child: Text('14')),
                DropdownMenuItem(value: 30, child: Text('30')),
              ],
              onChanged: (value) => setState(() => days = value ?? days),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: blockPay,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Блок, тенге',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: perRide,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Поездка, тенге',
                border: OutlineInputBorder(),
              ),
            ),
          ],
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

  if (saved != true) return;
  // Период считаем по ашхабадскому дню: иначе ночная смена уедет в
  // соседние сутки.
  final today = AshgabatTime.today();
  await ref
      .read(apiClientProvider)
      .hiring
      .calculatePayout(
        driverId: driverId,
        fromDate: AshgabatTime.addDays(today, -days),
        toDate: today,
        blockPayTenge: int.tryParse(blockPay.text.trim()) ?? 0,
        perRideTenge: int.tryParse(perRide.text.trim()) ?? 0,
      );
  ref.invalidate(payoutsProvider);
}
