import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';

import '../cash/screens/cash_screen.dart';
import '../today/screens/today_screen.dart';
import '../today/widgets/account_menu.dart';
import '../today/widgets/flavor_badge.dart';
import '../tomorrow/screens/tomorrow_screen.dart';

/// Приложение водителя: маршрут дня и подтверждение завтрашних поездок.
class DriverShell extends StatefulWidget {
  const DriverShell({super.key});

  @override
  State<DriverShell> createState() => _DriverShellState();
}

class _DriverShellState extends State<DriverShell> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(switch (_tab) {
          0 => l10n.driverTodayTitle,
          1 => l10n.driverTomorrowTitle,
          _ => l10n.driverCashTitle,
        }),
        actions: const [FlavorBadge(), LanguageMenu(), AccountMenu()],
      ),
      body: IndexedStack(
        index: _tab,
        children: const [TodayScreen(), TomorrowScreen(), CashScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.today),
            label: l10n.todayTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.event_available),
            label: l10n.tomorrowTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.payments),
            label: l10n.moneyTab,
          ),
        ],
      ),
    );
  }
}
