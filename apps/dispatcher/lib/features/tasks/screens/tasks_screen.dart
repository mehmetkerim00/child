import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../widgets/sms_console_dialog.dart';

/// Задачи диспетчера: то, что система не смогла решить сама.
///
/// Сюда попадают неподтверждённые поездки, невыезды и уведомления,
/// которые не дошли ни push, ни SMS — по ним нужно звонить.
class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final tasks = ref.watch(openTasksProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSmsConsoleDialog(context, ref),
        icon: const Icon(Icons.sms),
        label: Text(l10n.smsConsoleTitle),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(openTasksProvider),
        child: switch (tasks) {
          AsyncData(value: final list) when list.isEmpty => ListView(
            children: [
              const SizedBox(height: ChildSpacing.xl),
              Center(child: Text(l10n.dispatcherNoTasks)),
            ],
          ),
          AsyncData(value: final list) => ListView(
            padding: const EdgeInsets.all(ChildSpacing.m),
            children: [for (final task in list) _TaskTile(task: task)],
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

class _TaskTile extends ConsumerWidget {
  const _TaskTile({required this.task});

  final DispatcherTask task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final at = AshgabatTime.toLocal(task.createdAt);
    final time =
        '${at.hour.toString().padLeft(2, '0')}:'
        '${at.minute.toString().padLeft(2, '0')}';

    final (title, color) = switch (task.kind) {
      DispatcherTaskKind.rideNotConfirmed => (
        l10n.taskRideNotConfirmed,
        ChildColors.warning,
      ),
      DispatcherTaskKind.driverNotDeparted => (
        l10n.taskDriverNotDeparted,
        ChildColors.danger,
      ),
      DispatcherTaskKind.notificationUndelivered => (
        l10n.taskNotificationUndelivered,
        ChildColors.danger,
      ),
      DispatcherTaskKind.rideWithoutDriver => (
        l10n.taskRideWithoutDriver,
        ChildColors.danger,
      ),
      // Сбой сервиса: очередь уведомлений, SMS или база. Текст задачи
      // объясняет, что именно, — его пишет сторож.
      DispatcherTaskKind.systemDegraded => (
        l10n.taskSystemDegraded,
        ChildColors.danger,
      ),
    };

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      color: color.withValues(alpha: 0.08),
      child: ListTile(
        leading: Icon(Icons.warning_amber, color: color),
        title: Text(title, style: TextStyle(color: color)),
        subtitle: Text('$time · ${task.text}'),
        trailing: TextButton(
          onPressed: () async {
            await ref.read(apiClientProvider).directory.resolveTask(task.id!);
            ref.invalidate(openTasksProvider);
          },
          child: Text(l10n.taskResolve),
        ),
      ),
    );
  }
}
