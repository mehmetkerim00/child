import 'package:core_auth/core_auth.dart';
import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/shell/driver_shell.dart';

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
      final atLogin = state.matchedLocation == '/login';
      // Пока читаем сохранённую сессию — никуда не уводим.
      if (auth is AuthRestoring) return null;
      if (auth is! AuthSignedIn) return atLogin ? null : '/login';
      return atLogin ? '/' : null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const DriverShell()),
      GoRoute(
        path: '/login',
        builder: (context, state) =>
            LoginScreen(title: context.l10n.appTitleDriver),
      ),
    ],
  );
});
