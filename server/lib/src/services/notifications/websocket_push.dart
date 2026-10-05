import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

/// План Б: уведомления в открытое приложение по WebSocket.
///
/// Включается сам, когда FCM недоступен — например, если туркменский
/// хостинг не пускает сервисы Google. Это не замена push: пока
/// приложение закрыто, по этому каналу не придёт ничего. Поэтому план Б
/// — всегда пара: WebSocket плюс SMS, и SMS здесь главный.
abstract final class WebSocketPush {
  /// Канал одного человека. Телефон, а не id: получатель бывает и
  /// родителем, и водителем, и у них разные таблицы.
  static String channelFor(String phone) => 'app_notify_$phone';

  /// Кладёт уведомление в канал получателя.
  ///
  /// Возвращает true всегда: сервер не знает, открыто ли приложение, и
  /// узнать не может. Именно поэтому доставку подтверждает ack от
  /// приложения, а не факт отправки, — и именно поэтому рядом идёт SMS.
  static Future<bool> send(
    Session session,
    NotificationOutbox row, {
    required String title,
  }) async {
    await session.messages.postMessage(
      channelFor(row.recipientPhone),
      AppNotification(
        outboxId: row.id!,
        eventKind: row.eventKind,
        title: title,
        body: row.body,
        critical: row.critical,
        rideId: row.rideId,
        at: DateTime.now().toUtc(),
      ),
    );
    return true;
  }
}
