import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/spacing_tokens.dart';

enum ServerStatus { checking, ok, unavailable }

/// Карточка связи с сервером. Тексты передаёт приложение (из core_l10n).
class ServerStatusCard extends StatelessWidget {
  const ServerStatusCard({
    super.key,
    required this.title,
    required this.status,
    required this.message,
    this.onRetry,
    this.retryLabel,
  });

  final String title;
  final ServerStatus status;
  final String message;
  final VoidCallback? onRetry;
  final String? retryLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (icon, color) = switch (status) {
      ServerStatus.checking => (Icons.sync, ChildColors.warning),
      ServerStatus.ok => (Icons.check_circle, ChildColors.success),
      ServerStatus.unavailable => (Icons.error, ChildColors.danger),
    };
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(ChildSpacing.m),
        child: Row(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(width: ChildSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: ChildSpacing.xs),
                  Text(message, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
            if (onRetry != null && status == ServerStatus.unavailable)
              TextButton(onPressed: onRetry, child: Text(retryLabel ?? '↻')),
          ],
        ),
      ),
    );
  }
}
