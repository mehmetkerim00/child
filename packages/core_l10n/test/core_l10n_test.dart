import 'package:core_domain/core_domain.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('все статусы поездки переведены ($locale)', (tester) async {
      late AppLocalizations l10n;
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: childLocalizationsDelegates,
          home: Builder(builder: (context) {
            l10n = context.l10n;
            // Системные строки Material доступны и для tk (через фолбэк).
            MaterialLocalizations.of(context);
            return const SizedBox();
          }),
        ),
      );
      for (final status in RideStatus.values) {
        expect(l10n.rideStatus(status), isNotEmpty);
      }
    });
  }
}
