import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Меню аккаунта: кто вошёл и выход из сессии.
class AccountMenu extends ConsumerWidget {
  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final session = ref.watch(sessionProvider);
    if (session == null) return const SizedBox.shrink();

    return PopupMenuButton<void>(
      icon: const Icon(Icons.account_circle),
      tooltip: session.displayName,
      itemBuilder: (context) => [
        PopupMenuItem(enabled: false, child: Text(session.displayName)),
        const PopupMenuDivider(),
        PopupMenuItem(
          onTap: () => ref.read(authControllerProvider.notifier).logout(),
          child: Text(l10n.logout),
        ),
      ],
    );
  }
}
