import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cash/screens/cash_screen.dart';
import '../today/screens/today_screen.dart';
import '../today/widgets/account_menu.dart';
import '../today/widgets/flavor_badge.dart';
import '../tomorrow/screens/tomorrow_screen.dart';
import '../training/screens/training_screen.dart';

/// Приложение водителя: маршрут дня и подтверждение завтрашних поездок.
///
/// Пока тест после обучения не сдан, приложение показывает только
/// обучение: маршрутов у такого водителя всё равно не будет — сервер их
/// не назначит.
class DriverShell extends ConsumerStatefulWidget {
  const DriverShell({super.key});

  @override
  ConsumerState<DriverShell> createState() => _DriverShellState();
}

class _DriverShellState extends ConsumerState<DriverShell> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // Пока статус не загружен, считаем, что тест сдан: иначе работающий
    // водитель на секунду увидит экран обучения вместо маршрута.
    final passed = ref.watch(myTrainingPassedProvider).valueOrNull ?? true;
    final tab = passed ? _tab : 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(switch (tab) {
          0 => l10n.driverTodayTitle,
          1 => l10n.driverTomorrowTitle,
          2 => l10n.driverCashTitle,
          _ => l10n.trainingTitle,
        }),
        actions: const [FlavorBadge(), LanguageMenu(), AccountMenu()],
      ),
      body: IndexedStack(
        index: tab,
        children: const [
          TodayScreen(),
          TomorrowScreen(),
          CashScreen(),
          TrainingScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.today),
            label: l10n.todayTab,
            enabled: passed,
          ),
          NavigationDestination(
            icon: const Icon(Icons.event_available),
            label: l10n.tomorrowTab,
            enabled: passed,
          ),
          NavigationDestination(
            icon: const Icon(Icons.payments),
            label: l10n.moneyTab,
            enabled: passed,
          ),
          NavigationDestination(
            icon: const Icon(Icons.school),
            label: l10n.trainingTitle,
          ),
        ],
      ),
    );
  }
}
