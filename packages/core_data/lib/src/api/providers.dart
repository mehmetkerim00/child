import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_controller.dart';
import '../auth/auth_key_provider.dart';
import '../auth/token_storage.dart';
import '../config/app_config.dart';

/// Конфигурация сборки. В тестах переопределяется через ProviderScope.
final appConfigProvider = Provider<AppConfig>(
  (ref) => AppConfig.fromEnvironment(),
);

/// Хранилище сессии на устройстве.
final tokenStorageProvider = Provider<TokenStorage>((ref) => TokenStorage());

/// Заголовок авторизации для запросов к серверу.
final authKeyProviderProvider = Provider<SessionAuthKeyProvider>(
  (ref) => SessionAuthKeyProvider(),
);

/// Клиент Serverpod — единая точка доступа к API.
final apiClientProvider = Provider<Client>((ref) {
  final client = Client(ref.watch(appConfigProvider).serverUrl)
    ..authKeyProvider = ref.watch(authKeyProviderProvider);
  ref.onDispose(client.close);
  return client;
});

/// Состояние входа.
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref, ref.watch(tokenStorageProvider)),
);

/// Текущая сессия или null, если пользователь не вошёл.
final sessionProvider = Provider<AuthResult?>((ref) {
  final state = ref.watch(authControllerProvider);
  return state is AuthSignedIn ? state.session : null;
});

/// Проверка связи с сервером. Повтор — `ref.invalidate(serverHealthProvider)`.
final serverHealthProvider = FutureProvider.autoDispose<ServerHealth>((ref) {
  return ref
      .watch(apiClientProvider)
      .health
      .ping()
      .timeout(const Duration(seconds: 10));
});
