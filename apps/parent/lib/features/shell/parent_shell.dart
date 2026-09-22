import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';

import '../home/screens/home_screen.dart';
import '../notifications/screens/notifications_screen.dart';
import '../routes/screens/routes_screen.dart';

/// Приложение родителя: «Сегодня» и «Маршруты».
class ParentShell extends StatefulWidget {
  const ParentShell({super.key});

  @override
  State<ParentShell> createState() => _ParentShellState();
}

class _ParentShellState extends State<ParentShell> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: IndexedStack(
        index: _tab,
        children: const [HomeScreen(), RoutesScreen(), NotificationsScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.today),
            label: l10n.parentTodayTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.route),
            label: l10n.parentRoutesTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.notifications),
            label: l10n.parentNotificationsTitle,
          ),
        ],
      ),
    );
  }
}
