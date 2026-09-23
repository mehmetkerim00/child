import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../generated/app_localizations.dart';
import '../locale_provider.dart';

/// Кнопка переключения языка (ru / tk / en) для AppBar.
///
/// Языки подписаны на самих себе: человек ищет «Türkmen», а не
/// «туркменский» — особенно если открыл приложение на чужом языке.
class LanguageMenu extends ConsumerWidget {
  const LanguageMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(appLocaleProvider);

    String label(Locale locale) => switch (locale.languageCode) {
      'tk' => l10n.languageTk,
      'en' => l10n.languageEn,
      _ => l10n.languageRu,
    };

    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.translate),
      tooltip: l10n.language,
      onSelected: (locale) =>
          ref.read(appLocaleProvider.notifier).state = locale,
      itemBuilder: (context) => [
        for (final locale in childLocales)
          PopupMenuItem(
            value: locale,
            child: Row(
              children: [
                // Галочка у текущего: иначе на чужом языке непонятно,
                // что именно сейчас выбрано.
                Icon(
                  locale.languageCode == current.languageCode
                      ? Icons.check
                      : null,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(label(locale)),
              ],
            ),
          ),
      ],
    );
  }
}
