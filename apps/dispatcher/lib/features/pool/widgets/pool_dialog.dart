import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

/// Сборка пула: диспетчер выбирает, кого посадить в одну машину.
///
/// Система предлагает только совместимые поездки (то же учреждение,
/// близкое время) и проверяет вместимость, но решает человек: он знает,
/// какие дети поедут вместе спокойно.
Future<void> showPoolDialog(
  BuildContext context,
  WidgetRef ref,
  RideView view,
) async {
  final l10n = context.l10n;
  final rideId = view.ride.id!;
  final client = ref.read(apiClientProvider);

  final candidates = await client.directory.poolCandidates(
    rideId,
    maxTimeDiffMinutes: 20,
  );
  final capacity = await client.directory.poolCapacity(rideId);
  if (!context.mounted) return;

  final selected = <int>{};

  final merge = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(l10n.poolTitle),
        content: SizedBox(
          width: 460,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${view.ride.plannedTime} · ${view.childName}'),
              Text(l10n.poolChildrenInCar(view.childrenInCar)),
              Text(
                l10n.poolSeatsLeft(capacity.seatsLeft, capacity.childSeatsLeft),
              ),
              const Divider(height: ChildSpacing.l),
              if (candidates.isEmpty)
                Text(l10n.poolNoCandidates)
              else
                ...candidates.map(
                  (candidate) => CheckboxListTile(
                    value: selected.contains(candidate.ride.id),
                    title: Text(
                      '${candidate.ride.plannedTime} · ${candidate.childName}',
                    ),
                    subtitle: Text(
                      '${candidate.fromAddress} · '
                      '${l10n.poolTimeDiff(candidate.timeDiffMinutes)}'
                      '${candidate.needsChildSeat ? ' · ${l10n.poolNeedsChildSeat}' : ''}',
                    ),
                    onChanged: (checked) => setState(() {
                      checked == true
                          ? selected.add(candidate.ride.id!)
                          : selected.remove(candidate.ride.id!);
                    }),
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
            onPressed: selected.isEmpty
                ? null
                : () => Navigator.of(context).pop(true),
            child: Text(l10n.poolMerge),
          ),
        ],
      ),
    ),
  );

  if (merge != true || selected.isEmpty) return;

  try {
    await client.directory.mergeIntoPool(
      rideId: rideId,
      rideIds: selected.toList(),
    );
    ref.invalidate(todayRidesProvider);
  } catch (error) {
    if (context.mounted) {
      // Не хватило места или кресла — говорим прямо.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$error')));
    }
  }
}
