import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';

import '../owner/screens/owner_screen.dart';
import '../today_board/widgets/account_menu.dart';
import '../today_board/widgets/flavor_badge.dart';

/// Приложение владельца.
///
/// Тот же пакет, что у диспетчера, но другая роль и другой экран:
/// владелец видит деньги и не управляет поездками, диспетчер наоборот.
/// Отдельное приложение ради одного экрана заводить незачем.
class OwnerShell extends StatelessWidget {
  const OwnerShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.ownerTitle),
        actions: const [FlavorBadge(), LanguageMenu(), AccountMenu()],
      ),
      body: const OwnerScreen(),
    );
  }
}
