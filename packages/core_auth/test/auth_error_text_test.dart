import 'package:core_auth/core_auth.dart';
import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('каждая причина отказа имеет текст на ru и tk', (tester) async {
    for (final locale in AppLocalizations.supportedLocales) {
      late AppLocalizations l10n;
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: childLocalizationsDelegates,
          home: Builder(
            builder: (context) {
              l10n = context.l10n;
              return const SizedBox();
            },
          ),
        ),
      );

      for (final reason in AuthFailureReason.values) {
        final text = authErrorText(l10n, AuthException(reason: reason));
        expect(text, isNotEmpty);
        expect(text, isNot(l10n.errorNetwork));
      }
      // Любая другая ошибка трактуется как проблема со связью.
      expect(authErrorText(l10n, Exception('boom')), l10n.errorNetwork);
    }
  });
}
