import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitleDriver,
      theme: ChildTheme.light(),
      darkTheme: ChildTheme.dark(),
      locale: ref.watch(appLocaleProvider),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: childLocalizationsDelegates,
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
