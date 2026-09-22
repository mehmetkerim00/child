import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/flavor_badge.dart';
import '../widgets/server_status_section.dart';

/// «Маршрут дня» водителя. Пока заглушка: список поездок — S2, этапы — S3.
class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.driverTodayTitle),
        actions: const [FlavorBadge(), LanguageMenu()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ChildSpacing.m),
          child: Column(
            children: [
              StubNotice(text: l10n.stubNotice('S2–S3')),
              const SizedBox(height: ChildSpacing.m),
              const ServerStatusSection(),
              const Spacer(),
              // Главная кнопка этапа — внизу, под большой палец.
              BigActionButton(
                label: l10n.driverActionDeparted,
                icon: Icons.directions_car,
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.driverStubAction)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
