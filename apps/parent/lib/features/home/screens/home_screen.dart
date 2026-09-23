import 'package:core_data/core_data.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ride_live/screens/ride_events_screen.dart';
import '../widgets/account_menu.dart';
import '../widgets/flavor_badge.dart';
import '../widgets/server_status_section.dart';

/// «Сегодня» — главный экран родителя.
///
/// Поездок пока нет (S2–S3), поэтому показываем детей и закреплённых
/// водителей: по ним видно, что данные семьи пришли с сервера.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final session = ref.watch(sessionProvider);
    final children = ref.watch(myChildrenProvider);
    final drivers = ref.watch(myDriversProvider);
    final rides = ref.watch(myUpcomingRidesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.parentTodayTitle),
        actions: const [FlavorBadge(), LanguageMenu(), AccountMenu()],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(myChildrenProvider);
          ref.invalidate(myDriversProvider);
          ref.invalidate(myUpcomingRidesProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(ChildSpacing.m),
          children: [
            if (session != null)
              Text(
                l10n.greeting(session.displayName),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            const SizedBox(height: ChildSpacing.m),
            StubNotice(text: l10n.stubNotice('S3')),
            const SizedBox(height: ChildSpacing.m),
            const ServerStatusSection(),
            const SizedBox(height: ChildSpacing.l),
            _Section(
              title: l10n.ridesToday,
              child: _AsyncList<RideView>(
                value: rides.whenData(
                  // Поездки приходят на сегодня и завтра — здесь только сегодня.
                  (list) => list
                      .where((view) => view.ride.date == AshgabatTime.today())
                      .toList(),
                ),
                emptyText: l10n.parentTodayEmpty,
                itemBuilder: (view) => ListTile(
                  leading: Text(
                    view.ride.plannedTime,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  title: Text(view.childName),
                  subtitle: Text('${view.fromAddress} → ${view.toName}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.rideStatus(view.ride.domainStatus)),
                      IconButton(
                        tooltip: l10n.absenceTitle,
                        icon: const Icon(Icons.event_busy),
                        onPressed: () => _declareAbsence(context, ref, view),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => RideEventsScreen(view: view),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: ChildSpacing.l),
            _Section(
              title: l10n.parentChildrenTitle,
              child: _AsyncList<Child>(
                value: children,
                emptyText: l10n.emptyList,
                itemBuilder: (child) => ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.child_care)),
                  title: Text(child.name),
                  subtitle: Text(
                    '${l10n.fieldCodeWord}: ${child.codeWord}'
                    '${child.birthYear == null ? '' : ' · ${child.birthYear}'}',
                  ),
                ),
              ),
            ),
            const SizedBox(height: ChildSpacing.l),
            _Section(
              title: l10n.parentDriversTitle,
              child: _AsyncList<Driver>(
                value: drivers,
                emptyText: l10n.emptyList,
                itemBuilder: (driver) => ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(driver.name),
                  subtitle: Text('${driver.carModel} · ${driver.carPlate}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// «Сегодня не едем»: родитель предупреждает заранее, чтобы водитель
/// не ждал у подъезда, а учреждение не искало ребёнка.
Future<void> _declareAbsence(
  BuildContext context,
  WidgetRef ref,
  RideView view,
) async {
  final l10n = context.l10n;
  final controller = TextEditingController();

  final reason = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.absenceTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              labelText: l10n.absenceReason,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: ChildSpacing.s),
          Text(l10n.absenceHint),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(controller.text.trim()),
          child: Text(l10n.save),
        ),
      ],
    ),
  );

  if (reason == null || reason.isEmpty) return;
  final childId = view.seats?.firstOrNull?.childId ?? view.ride.childId;
  await ref
      .read(apiClientProvider)
      .routes
      .declareAbsence(rideId: view.ride.id!, childId: childId, reason: reason);
  ref.invalidate(myUpcomingRidesProvider);

  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.absenceDone)));
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: ChildSpacing.s),
        Card(child: child),
      ],
    );
  }
}

/// Список из провайдера: загрузка, ошибка и пустое состояние.
class _AsyncList<T> extends StatelessWidget {
  const _AsyncList({
    required this.value,
    required this.emptyText,
    required this.itemBuilder,
  });

  final AsyncValue<List<T>> value;
  final String emptyText;
  final Widget Function(T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return switch (value) {
      AsyncData(value: final items) when items.isEmpty => Padding(
        padding: const EdgeInsets.all(ChildSpacing.m),
        child: Text(emptyText),
      ),
      AsyncData(value: final items) => Column(
        children: [for (final item in items) itemBuilder(item)],
      ),
      AsyncError() => Padding(
        padding: const EdgeInsets.all(ChildSpacing.m),
        child: Text(context.l10n.errorNetwork),
      ),
      _ => const Padding(
        padding: EdgeInsets.all(ChildSpacing.m),
        child: Center(child: CircularProgressIndicator()),
      ),
    };
  }
}
