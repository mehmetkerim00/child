import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'edit_dialogs.dart';
import 'enum_labels.dart';

/// «Круг семьи»: постоянный водитель и два резервных.
///
/// Родитель видит этих людей заранее — подмена водителя незнакомцем
/// недопустима (RESEARCH.md).
Future<void> showFamilyCircleDialog(
  BuildContext context,
  WidgetRef ref,
  Family family,
) async {
  final l10n = context.l10n;
  final client = ref.read(apiClientProvider);
  final drivers = await client.directory.drivers();
  final circle = await client.directory.circle(family.id!);
  if (!context.mounted || drivers.isEmpty) return;

  final selection = <CircleRank, int?>{
    for (final rank in CircleRank.values)
      rank: circle
          .where((entry) => entry.rank == rank)
          .map((entry) => entry.driverId)
          .firstOrNull,
  };

  final saved = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text('${l10n.dispatcherCircleTitle}: ${family.name}'),
        content: SizedBox(
          width: 420,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final rank in CircleRank.values)
                EnumField<int?>(
                  label: l10n.circleRank(rank),
                  value: selection[rank],
                  values: [null, for (final driver in drivers) driver.id],
                  labelOf: (id) => id == null
                      ? l10n.notSet
                      : drivers.firstWhere((d) => d.id == id).name,
                  onChanged: (value) => setState(() => selection[rank] = value),
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

  if (saved != true) return;
  for (final entry in selection.entries) {
    final driverId = entry.value;
    if (driverId == null) continue;
    await client.directory.assignDriver(
      familyId: family.id!,
      driverId: driverId,
      rank: entry.key,
    );
  }
}
