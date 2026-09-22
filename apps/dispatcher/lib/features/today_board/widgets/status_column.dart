import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

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
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: ChildSpacing.s,
                          ),
                          child: Text(
                            '${view.ride.plannedTime} · ${view.childName}'
                            '${view.driverName == null ? '' : '\n${view.driverName}'}',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
