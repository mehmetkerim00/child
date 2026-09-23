import 'package:core_auth/core_auth.dart';
import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/shell/dispatcher_shell.dart';
import 'features/shell/owner_shell.dart';

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
      // Владелец и диспетчер ставят одно приложение, но видят разное:
      // роль решает, чей это экран.
      GoRoute(path: '/', builder: (context, state) => const _RoleHome()),
      GoRoute(
        path: '/login',
        builder: (context, state) =>
            LoginScreen(title: context.l10n.appTitleDispatcher),
      ),
    ],
  );
});

/// Экран по роли вошедшего.
///
/// Роль читается через watch, а не read: при запуске приложение сначала
/// восстанавливает сохранённую сессию, и роль становится известна уже
/// после первой отрисовки. С read владелец увидел бы панель диспетчера.
class _RoleHome extends ConsumerWidget {
  const _RoleHome();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final isOwner =
        auth is AuthSignedIn && auth.session.role == AccountRole.owner;
    return isOwner ? const OwnerShell() : const DispatcherShell();
  }
}
