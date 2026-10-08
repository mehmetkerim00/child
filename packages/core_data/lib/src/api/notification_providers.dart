import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

/// План Б: уведомления в открытое приложение, когда push недоступен.
///
/// На клиенте нет и не будет Firebase: приложение не умеет принимать
/// push само — за это отвечает сервер, а приложение получает события по
/// WebSocket. Поэтому отсутствие Firebase-конфига ничего здесь не
/// ломает: падать на инициализации нечему.

/// Каким способом сервис доставляет уведомления прямо сейчас.
///
/// Сервер отвечает `websocket`, если не достучался до FCM — например,
/// когда туркменский дата-центр не пускает сервисы Google.
final pushTransportProvider = FutureProvider<PushTransport>((ref) async {
  // Пока не вошли, спрашивать некого: эндпоинт требует логина.
  if (ref.watch(sessionProvider) == null) return PushTransport.fcm;
  try {
    return await ref
        .watch(apiClientProvider)
        .profile
        .pushTransport()
        .timeout(const Duration(seconds: 10));
  } catch (_) {
    // Сервер не ответил — считаем, что push на месте. Ошибочно открытый
    // WebSocket тратит батарею и трафик впустую; ошибочно закрытый
    // стоит дешевле, потому что критичное всё равно дублируется SMS.
    return PushTransport.fcm;
  }
});

/// Поток уведомлений в открытое приложение.
///
/// Подписка живёт только на плане Б. Держать WebSocket открытым, когда
/// push работает, — это расход батареи и трафика за то, что и так
/// придёт уведомлением системы.
///
/// Закрытому приложению этот канал не поможет, и это не недостаток
/// реализации, а суть: план Б — всегда пара «WebSocket плюс SMS», и SMS
/// в ней главный.
final appNotificationsProvider = StreamProvider<AppNotification>((ref) async* {
  final transport = await ref.watch(pushTransportProvider.future);
  if (transport != PushTransport.websocket) return;

  yield* ref.watch(apiClientProvider).profile.watchNotifications();
});

/// Подтверждает доставку: по этому событию SMS больше не нужна.
///
/// Подтверждать умеет только родитель — на сервере `ackNotification`
/// требует его прав. Водителю отказ не мешает: его события и так идут
/// через офлайн-очередь.
final notificationAckProvider = Provider<Future<void> Function(int)>((ref) {
  final client = ref.watch(apiClientProvider);
  return (outboxId) async {
    try {
      await client.routes.ackNotification(outboxId);
    } catch (_) {
      // Не подтвердилось — сервер дошлёт SMS. Это запасной путь, а не
      // ошибка: лучше лишняя SMS, чем пропущенное событие.
    }
  };
});
