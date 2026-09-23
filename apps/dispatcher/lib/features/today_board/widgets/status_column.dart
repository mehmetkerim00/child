import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../../pool/widgets/pool_dialog.dart';

/// Колонка доски дня. Красная — проблемы: неподтверждённые, задержки, сбои.
class StatusColumn extends StatelessWidget {
  const StatusColumn({
    super.key,
    required this.title,
    required this.emptyText,
    this.rides = const [],
    this.isProblem = false,
  });

  final String title;
  final String emptyText;
  final List<RideView> rides;
  final bool isProblem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = isProblem ? ChildColors.danger : theme.colorScheme.primary;

    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: ChildSpacing.m),
      decoration: BoxDecoration(
        color: isProblem
            ? ChildColors.danger.withValues(alpha: 0.08)
            : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(ChildRadius.card),
        border: Border(top: BorderSide(color: accent, width: 4)),
      ),
      padding: const EdgeInsets.all(ChildSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(color: accent),
                ),
              ),
              if (rides.isNotEmpty)
                Text('${rides.length}', style: theme.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: ChildSpacing.s),
          Expanded(
            child: rides.isEmpty
                ? Text(
                    emptyText,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  )
                : ListView(
                    children: [
                      for (final view in rides)
                        _RideRow(view: view, isProblem: isProblem),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

/// Строка поездки в колонке: у проблемных есть кнопка сборки пула.
class _RideRow extends ConsumerWidget {
  const _RideRow({required this.view, required this.isProblem});

  final RideView view;
  final bool isProblem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${view.ride.plannedTime} · ${view.childName}'
              '${view.childrenInCar > 1 ? ' (+${view.childrenInCar - 1})' : ''}'
              '${view.driverName == null ? '' : '\n${view.driverName}'}',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          if (isProblem)
            IconButton(
              tooltip: context.l10n.poolTitle,
              icon: const Icon(Icons.group_add, size: 20),
              onPressed: () => showPoolDialog(context, ref, view),
            ),
        ],
      ),
    );
  }
}
