import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Показывает уведомления плана Б, пока приложение открыто.
///
/// Оборачивает всё приложение и ничего не рисует от себя: пока push
/// работает, этого виджета как будто нет. Когда сервер сообщает, что до
/// FCM не достучаться, виджет открывает WebSocket и показывает события
/// снизу экрана.
///
/// Firebase на клиенте нет вовсе, поэтому отсутствие `GoogleService-Info.plist`
/// не может уронить приложение: инициализировать нечего. Это и есть
/// причина, по которой план Б сделан так, а не поверх push-плагина.
class PlanBNotifications extends ConsumerStatefulWidget {
  const PlanBNotifications({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<PlanBNotifications> createState() => _PlanBNotificationsState();
}

class _PlanBNotificationsState extends ConsumerState<PlanBNotifications> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AppNotification>>(appNotificationsProvider, (
      _,
      next,
    ) {
      final notification = next.valueOrNull;
      if (notification != null) _show(notification);
    });

    return widget.child;
  }

  void _show(AppNotification notification) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    // Приложение может быть на экране без Scaffold — например, пока
    // идёт вход. Тогда показать нечем, но подтвердить доставку стоит:
    // человек уведомление увидит, когда экран откроется.
    ref.read(notificationAckProvider)(notification.outboxId);
    if (messenger == null) return;

    final l10n = context.l10n;
    final theme = Theme.of(context);

    messenger.showSnackBar(
      SnackBar(
        // Критичное не убираем по таймеру: это как раз то, что нельзя
        // пропустить, а SMS по нему может опоздать.
        duration: notification.critical
            ? const Duration(days: 1)
            : const Duration(seconds: 8),
        backgroundColor: notification.critical ? theme.colorScheme.error : null,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              notification.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(notification.body),
            const SizedBox(height: 4),
            // Зачем событие пришло баннером, а не уведомлением системы.
            Text(
              '${l10n.planBBannerTitle} · ${l10n.planBBannerBody}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: notification.critical
                    ? theme.colorScheme.onError
                    : theme.colorScheme.outline,
              ),
            ),
          ],
        ),
        action: notification.critical
            ? SnackBarAction(
                label: MaterialLocalizations.of(context).closeButtonLabel,
                onPressed: messenger.hideCurrentSnackBar,
              )
            : null,
      ),
    );
  }
}
