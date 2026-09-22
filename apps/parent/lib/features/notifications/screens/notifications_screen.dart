import 'package:core_data/core_data.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/widgets/account_menu.dart';

/// Лента уведомлений семьи.
///
/// Здесь видно не только сам текст, но и как он дошёл: push или SMS.
/// Это важно: если push потерялся, родитель понимает, почему пришла SMS.
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final notifications = ref.watch(myNotificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.parentNotificationsTitle),
        actions: const [LanguageMenu(), AccountMenu()],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(myNotificationsProvider),
        child: switch (notifications) {
          AsyncData(value: final list) when list.isEmpty => ListView(
            children: [
              const SizedBox(height: ChildSpacing.xl),
              Center(child: Text(l10n.emptyList)),
            ],
          ),
          AsyncData(value: final list) => ListView(
            padding: const EdgeInsets.all(ChildSpacing.m),
            children: [for (final row in list) _NotificationTile(row: row)],
          ),
          AsyncError() => ListView(
            children: [
              const SizedBox(height: ChildSpacing.xl),
              Center(child: Text(l10n.errorNetwork)),
            ],
          ),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.row});

  final NotificationOutbox row;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final at = AshgabatTime.toLocal(row.sentAt ?? row.createdAt);
    final time =
        '${at.day}.${at.month.toString().padLeft(2, '0')} '
        '${at.hour.toString().padLeft(2, '0')}:'
        '${at.minute.toString().padLeft(2, '0')}';

    final (statusText, color) = switch (row.status) {
      NotificationStatus.queued => (
        l10n.notificationQueued,
        ChildColors.warning,
      ),
      NotificationStatus.sent => (l10n.notificationSent, ChildColors.success),
      NotificationStatus.acked => (l10n.notificationAcked, ChildColors.success),
      NotificationStatus.failed => (
        l10n.notificationFailed,
        ChildColors.danger,
      ),
    };
    final channel = row.channel == NotificationChannel.sms
        ? l10n.notificationChannelSms
        : l10n.notificationChannelPush;

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: ListTile(
        leading: Icon(
          row.channel == NotificationChannel.sms
              ? Icons.sms
              : Icons.notifications,
          color: color,
        ),
        title: Text(row.body),
        subtitle: Text('$time · $channel · $statusText'),
      ),
    );
  }
}
