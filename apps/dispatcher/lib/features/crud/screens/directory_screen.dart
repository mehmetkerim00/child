import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../widgets/edit_dialogs.dart';
import '../widgets/enum_labels.dart';
import '../widgets/family_circle_dialog.dart';

/// Справочники диспетчера: семьи, дети, водители, учреждения.
class DirectoryScreen extends ConsumerWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: l10n.dispatcherTabFamilies),
              Tab(text: l10n.dispatcherTabChildren),
              Tab(text: l10n.dispatcherTabDrivers),
              Tab(text: l10n.dispatcherTabInstitutions),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                _FamiliesTab(),
                _ChildrenTab(),
                _DriversTab(),
                _InstitutionsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Общий каркас вкладки: список, кнопка добавления, состояния загрузки.
class _DirectoryTab<T> extends StatelessWidget {
  const _DirectoryTab({
    required this.items,
    required this.onAdd,
    required this.itemBuilder,
  });

  final AsyncValue<List<T>> items;
  final VoidCallback? onAdd;
  final Widget Function(T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      floatingActionButton: onAdd == null
          ? null
          : FloatingActionButton.extended(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: Text(l10n.add),
            ),
      body: switch (items) {
        AsyncData(value: final list) when list.isEmpty => Center(
          child: Text(l10n.emptyList),
        ),
        AsyncData(value: final list) => ListView(
          padding: const EdgeInsets.only(bottom: 80),
          children: [for (final item in list) itemBuilder(item)],
        ),
        AsyncError(:final error) => Center(
          child: Padding(
            padding: const EdgeInsets.all(ChildSpacing.l),
            child: Text(
              '${l10n.errorNetwork}\n$error',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _FamiliesTab extends ConsumerWidget {
  const _FamiliesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final families = ref.watch(familiesProvider);

    Future<void> save(Family? initial) async {
      final edited = await editFamilyDialog(context, initial);
      if (edited == null) return;
      await ref.read(apiClientProvider).directory.saveFamily(edited);
      ref.invalidate(familiesProvider);
    }

    return _DirectoryTab<Family>(
      items: families,
      onAdd: () => save(null),
      itemBuilder: (family) => ListTile(
        leading: const Icon(Icons.family_restroom),
        title: Text(family.name),
        subtitle: Text(
          '${family.ownerPhone} · ${l10n.smsLevelLabel(family.smsLevel)}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: l10n.dispatcherCircleTitle,
              icon: const Icon(Icons.group),
              onPressed: () => showFamilyCircleDialog(context, ref, family),
            ),
            IconButton(
              tooltip: l10n.edit,
              icon: const Icon(Icons.edit),
              onPressed: () => save(family),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChildrenTab extends ConsumerWidget {
  const _ChildrenTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final children = ref.watch(childrenProvider(null));
    final families =
        ref.watch(familiesProvider).valueOrNull ?? const <Family>[];

    Future<void> save(Child? initial) async {
      if (families.isEmpty) return;
      final edited = await editChildDialog(context, initial, families);
      if (edited == null) return;
      await ref.read(apiClientProvider).directory.saveChild(edited);
      ref.invalidate(childrenProvider);
    }

    String familyName(int id) =>
        families
            .where((family) => family.id == id)
            .map((family) => family.name)
            .firstOrNull ??
        '';

    return _DirectoryTab<Child>(
      items: children,
      onAdd: families.isEmpty ? null : () => save(null),
      itemBuilder: (child) => ListTile(
        leading: const Icon(Icons.child_care),
        title: Text(child.name),
        subtitle: Text(
          '${familyName(child.familyId)} · '
          '${l10n.fieldCodeWord}: ${child.codeWord}',
        ),
        trailing: IconButton(
          tooltip: l10n.edit,
          icon: const Icon(Icons.edit),
          onPressed: () => save(child),
        ),
      ),
    );
  }
}

class _DriversTab extends ConsumerWidget {
  const _DriversTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final drivers = ref.watch(driversProvider);

    Future<void> save(Driver? initial) async {
      final edited = await editDriverDialog(context, initial);
      if (edited == null) return;
      await ref.read(apiClientProvider).directory.saveDriver(edited);
      ref.invalidate(driversProvider);
    }

    return _DirectoryTab<Driver>(
      items: drivers,
      onAdd: () => save(null),
      itemBuilder: (driver) => ListTile(
        leading: const Icon(Icons.directions_car),
        title: Text(driver.name),
        subtitle: Text(
          '${driver.phone} · ${driver.carModel} ${driver.carPlate} · '
          '${l10n.vettingStatus(driver.vettingStatus)}',
        ),
        trailing: IconButton(
          tooltip: l10n.edit,
          icon: const Icon(Icons.edit),
          onPressed: () => save(driver),
        ),
      ),
    );
  }
}

class _InstitutionsTab extends ConsumerWidget {
  const _InstitutionsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final institutions = ref.watch(institutionsProvider);

    Future<void> save(Institution? initial) async {
      final edited = await editInstitutionDialog(context, initial);
      if (edited == null) return;
      await ref.read(apiClientProvider).directory.saveInstitution(edited);
      ref.invalidate(institutionsProvider);
    }

    return _DirectoryTab<Institution>(
      items: institutions,
      onAdd: () => save(null),
      itemBuilder: (institution) => ListTile(
        leading: const Icon(Icons.location_city),
        title: Text(institution.name),
        subtitle: Text(
          '${l10n.institutionType(institution.type)} · ${institution.address} · '
          '${l10n.fieldHandoverCode}: ${institution.handoverCode}',
        ),
        trailing: IconButton(
          tooltip: l10n.edit,
          icon: const Icon(Icons.edit),
          onPressed: () => save(institution),
        ),
      ),
    );
  }
}
