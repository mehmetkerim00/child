import 'package:serverpod/serverpod.dart';

/// Отправка push-уведомлений.
///
/// Реализация сменная, как и SmsGateway: в разработке — заглушка в консоль,
/// в проде — FCM. Ни одно критическое событие не полагается только на push
/// (MVP_PLAN §6), поэтому отказ этого канала не теряет уведомление.
abstract interface class PushGateway {
  /// Отправляет push. Возвращает false, если доставить не удалось.
  Future<bool> send(
    Session session, {
    required String recipientPhone,
    required String title,
    required String body,

    /// id строки очереди: приложение вернёт его в ack.
    required int outboxId,
  });
}

/// Заглушка для разработки: печатает push в консоль сервера.
class ConsolePushGateway implements PushGateway {
  const ConsolePushGateway();

  @override
  Future<bool> send(
    Session session, {
    required String recipientPhone,
    required String title,
    required String body,
    required int outboxId,
  }) async {
    session.log('[PUSH → $recipientPhone] $title: $body (outbox $outboxId)');
    // ignore: avoid_print
    print('[PUSH → $recipientPhone] $title: $body (outbox $outboxId)');
    return true;
  }
}

/// Текущий шлюз push. Подменяется на FCM при подключении Firebase.
PushGateway pushGateway = const ConsolePushGateway();
