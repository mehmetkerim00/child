import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.parentTodayTitle),
        actions: const [FlavorBadge(), LanguageMenu(), AccountMenu()],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(myChildrenProvider);
          ref.invalidate(myDriversProvider);
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
            StubNotice(text: l10n.stubNotice('S2')),
            const SizedBox(height: ChildSpacing.m),
            const ServerStatusSection(),
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
