import 'package:child_client/child_client.dart';
import 'package:riverpod/riverpod.dart';

import '../config/app_config.dart';

/// Конфигурация сборки. В тестах переопределяется через ProviderScope.
final appConfigProvider = Provider<AppConfig>((ref) => AppConfig.fromEnvironment());

/// Клиент Serverpod — единая точка доступа к API.
final apiClientProvider = Provider<Client>((ref) {
  final client = Client(ref.watch(appConfigProvider).serverUrl);
  ref.onDispose(client.close);
  return client;
});

/// Проверка связи с сервером. Повтор — `ref.invalidate(serverHealthProvider)`.
final serverHealthProvider = FutureProvider.autoDispose<ServerHealth>((ref) {
  return ref
      .watch(apiClientProvider)
      .health
      .ping()
      .timeout(const Duration(seconds: 10));
});
