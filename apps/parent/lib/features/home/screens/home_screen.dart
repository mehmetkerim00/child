import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/flavor_badge.dart';
import '../widgets/server_status_section.dart';

/// «Сегодня» — главный экран родителя. Пока заглушка (карточки поездок — S2/S3).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.parentTodayTitle),
        actions: const [FlavorBadge(), LanguageMenu()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(ChildSpacing.m),
        children: [
          StubNotice(text: l10n.stubNotice('S2')),
          const SizedBox(height: ChildSpacing.m),
          const ServerStatusSection(),
          const SizedBox(height: ChildSpacing.xl),
          Icon(
            Icons.directions_car_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: ChildSpacing.s),
          Text(
            l10n.parentTodayEmpty,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
