import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'router.dart';

/// Параметры сборки: --dart-define=FLAVOR=dev|prod, --dart-define=SERVER_URL=...
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Онбординг показываем только при первом запуске.
  final seen = await OnboardingScreen.wasSeen();

  runApp(
    ProviderScope(
      overrides: [onboardingSeenProvider.overrideWith((ref) => seen)],
      child: const App(),
    ),
  );
}
