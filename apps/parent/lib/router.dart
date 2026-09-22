import 'package:core_auth/core_auth.dart';
import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/shell/parent_shell.dart';

/// Показывали ли онбординг. Заполняется при старте приложения.
final onboardingSeenProvider = StateProvider<bool>((ref) => true);

/// Маршруты приложения. Неавторизованного пользователя всегда уводим на вход.
final routerProvider = Provider<GoRouter>((ref) {
  // go_router перестраивает маршрут, когда меняется состояние входа.
  final refresh = ValueNotifier<AuthState>(ref.read(authControllerProvider));
  ref.onDispose(refresh.dispose);
  ref.listen<AuthState>(
    authControllerProvider,
    (_, next) => refresh.value = next,
  );

  return GoRouter(
    refreshListenable: refresh,
    initialLocation: '/',
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      final location = state.matchedLocation;
      final atLogin = location == '/login';
      final atOnboarding = location == '/onboarding';

      // Пока читаем сохранённую сессию — никуда не уводим.
      if (auth is AuthRestoring) return null;

      // Первый запуск: сначала объясняем, как устроена безопасность.
      if (auth is! AuthSignedIn) {
        if (atOnboarding) return null;
        if (!ref.read(onboardingSeenProvider)) return '/onboarding';
        return atLogin ? null : '/login';
      }
      return atLogin || atOnboarding ? '/' : null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const ParentShell()),
      GoRoute(
        path: '/login',
        builder: (context, state) =>
            LoginScreen(title: context.l10n.appTitleParent),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) =>
            OnboardingScreen(onDone: () => context.go('/login')),
      ),
    ],
  );
});
