import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

/// Колонка доски дня. Красная — проблемы (неподтверждённые, задержки, сбои).
class StatusColumn extends StatelessWidget {
  const StatusColumn({
    super.key,
    required this.title,
    required this.emptyText,
    this.isProblem = false,
  });

  final String title;
  final String emptyText;
  final bool isProblem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = isProblem ? ChildColors.danger : theme.colorScheme.primary;
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: ChildSpacing.m),
      decoration: BoxDecoration(
        color: isProblem ? ChildColors.danger.withValues(alpha: 0.08) : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(ChildRadius.card),
        border: Border(top: BorderSide(color: accent, width: 4)),
      ),
      padding: const EdgeInsets.all(ChildSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium?.copyWith(color: accent)),
          const SizedBox(height: ChildSpacing.m),
          Text(emptyText, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline)),
        ],
      ),
    );
  }
}
