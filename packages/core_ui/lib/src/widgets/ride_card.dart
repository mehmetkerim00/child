import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/spacing_tokens.dart';

/// Карточка поездки: время, ребёнок, статус и действия.
///
/// Тексты и цвет статуса передаёт приложение — виджет не знает ни про
/// сеть, ни про локализацию.
class RideCard extends StatelessWidget {
  const RideCard({
    super.key,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.statusLabel,
    this.statusTone = RideTone.neutral,
    this.actions = const [],
  });

  final String time;
  final String title;
  final String subtitle;
  final String statusLabel;
  final RideTone statusTone;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = switch (statusTone) {
      RideTone.good => ChildColors.success,
      RideTone.warning => ChildColors.warning,
      RideTone.danger => ChildColors.danger,
      RideTone.neutral => theme.colorScheme.outline,
    };

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: Padding(
        padding: const EdgeInsets.all(ChildSpacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: theme.textTheme.titleLarge),
                const SizedBox(width: ChildSpacing.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.titleMedium),
                      Text(subtitle, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ChildSpacing.s,
                    vertical: ChildSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(ChildRadius.button),
                  ),
                  child: Text(
                    statusLabel,
                    style: theme.textTheme.labelMedium?.copyWith(color: color),
                  ),
                ),
              ],
            ),
            if (actions.isNotEmpty) ...[
              const SizedBox(height: ChildSpacing.m),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (final action in actions) ...[
                    action,
                    const SizedBox(width: ChildSpacing.s),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Смысловая окраска статуса поездки.
enum RideTone { neutral, good, warning, danger }
