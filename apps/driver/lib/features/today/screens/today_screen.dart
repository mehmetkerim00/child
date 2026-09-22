import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/account_menu.dart';
import '../widgets/flavor_badge.dart';
import '../widgets/server_status_section.dart';

/// «Маршрут дня» водителя.
///
/// Поездки появятся в S2, кнопки этапов — в S3. Пока показываем профиль,
/// который диспетчер завёл водителю.
class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final profile = ref.watch(myDriverProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.driverTodayTitle),
        actions: const [FlavorBadge(), LanguageMenu(), AccountMenu()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ChildSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StubNotice(text: l10n.stubNotice('S2–S3')),
              const SizedBox(height: ChildSpacing.m),
              const ServerStatusSection(),
              const SizedBox(height: ChildSpacing.m),
              Card(
                child: switch (profile) {
                  AsyncData(value: final driver?) => ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(driver.name),
                    subtitle: Text(
                      '${driver.carModel} · ${driver.carPlate}\n'
                      '${driver.phone}',
                    ),
                    isThreeLine: true,
                  ),
                  AsyncError() => ListTile(title: Text(l10n.errorNetwork)),
                  _ => const ListTile(
                    title: Center(child: CircularProgressIndicator()),
                  ),
                },
              ),
              const Spacer(),
              // Главная кнопка этапа — внизу, под большой палец.
              BigActionButton(
                label: l10n.driverActionDeparted,
                icon: Icons.directions_car,
                onPressed: () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(l10n.driverStubAction))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
