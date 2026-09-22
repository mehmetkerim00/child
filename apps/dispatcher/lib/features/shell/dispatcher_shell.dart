import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';

import '../crud/screens/directory_screen.dart';
import '../today_board/screens/today_board_screen.dart';
import '../today_board/widgets/account_menu.dart';
import '../today_board/widgets/flavor_badge.dart';

/// Панель диспетчера: доска дня и справочники.
class DispatcherShell extends StatefulWidget {
  const DispatcherShell({super.key});

  @override
  State<DispatcherShell> createState() => _DispatcherShellState();
}

class _DispatcherShellState extends State<DispatcherShell> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tab == 0 ? l10n.dispatcherBoardTitle : l10n.dispatcherDirectories,
        ),
        actions: const [FlavorBadge(), LanguageMenu(), AccountMenu()],
      ),
      body: IndexedStack(
        index: _tab,
        children: const [TodayBoardScreen(), DirectoryScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard),
            label: l10n.dispatcherBoardTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.folder_shared),
            label: l10n.dispatcherDirectories,
          ),
        ],
      ),
    );
  }
}
