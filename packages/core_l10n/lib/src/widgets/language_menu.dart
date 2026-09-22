import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../generated/app_localizations.dart';
import '../locale_provider.dart';

/// Кнопка переключения языка (ru/tk) для AppBar.
class LanguageMenu extends ConsumerWidget {
  const LanguageMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.translate),
      tooltip: l10n.language,
      onSelected: (locale) => ref.read(appLocaleProvider.notifier).state = locale,
      itemBuilder: (context) => [
        PopupMenuItem(value: const Locale('ru'), child: Text(l10n.languageRu)),
        PopupMenuItem(value: const Locale('tk'), child: Text(l10n.languageTk)),
      ],
    );
  }
}
