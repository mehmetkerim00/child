import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../clock.dart';
import '../notifications/notification_service.dart';

/// Переписка родителя, водителя и диспетчера.
///
/// Телефоны сторон не раскрываются: родитель не знает номер водителя,
/// водитель — номер родителя. Связь идёт через приложение, у диспетчера
/// видна вся переписка (модель Serviscell из RESEARCH.md).
class ChatService {
  ChatService({this.clock = const Clock(), NotificationService? notifications})
    : notifications = notifications ?? NotificationService();

  final Clock clock;
  final NotificationService notifications;

  /// Фразы, которые нельзя пропустить: они дублируются SMS.
  static const criticalPhrases = {
    QuickPhrase.childIsSick,
    QuickPhrase.delayFiveMinutes,
  };

  /// Готовый текст фразы на языке получателя.
  static String phraseText(QuickPhrase phrase, String locale) {
    final tk = locale == 'tk';
    return switch (phrase) {
      QuickPhrase.comingOut => tk ? 'Çykýarys' : 'Выходим',
      QuickPhrase.delayFiveMinutes =>
        tk ? '5 minut gijikýäris' : 'Задерживаемся на 5 минут',
      QuickPhrase.childIsSick =>
        tk
            ? 'Çaga syrkaw, şu güni ýatyryň'
            : 'Ребёнок болеет, отмените сегодня',
      QuickPhrase.waitingAtEntrance =>
        tk ? 'Girelgede garaşýarys' : 'Ждём у подъезда',
      QuickPhrase.arrivedCallChild =>
        tk ? 'Geldim, çagany çagyryň' : 'Подъехал, позовите ребёнка',
      QuickPhrase.allGood => tk ? 'Hemme zat gowy' : 'Всё хорошо',
    };
  }

  /// Находит или создаёт разговор по поездке.
  Future<ChatThread> threadForRide(Session session, Ride ride) async {
    final child = await Child.db.findById(session, ride.childId);
    final familyId = child?.familyId;
    if (familyId == null) throw Exception('У поездки нет семьи');

    final existing = await ChatThread.db.findFirstRow(
      session,
      where: (thread) => thread.rideId.equals(ride.id),
    );
    if (existing != null) return existing;

    return ChatThread.db.insertRow(
      session,
      ChatThread(
        familyId: familyId,
        rideId: ride.id,
        driverId: ride.driverId,
        createdAt: clock.now(),
      ),
    );
  }

  /// Находит или создаёт общий разговор семьи (без привязки к поездке).
  Future<ChatThread> threadForFamily(Session session, int familyId) async {
    final existing = await ChatThread.db.findFirstRow(
      session,
      where: (thread) =>
          thread.familyId.equals(familyId) & thread.rideId.equals(null),
    );
    if (existing != null) return existing;

    return ChatThread.db.insertRow(
      session,
      ChatThread(familyId: familyId, createdAt: clock.now()),
    );
  }

  /// Отправляет сообщение и уведомляет остальных участников.
  ///
  /// Повторная отправка с тем же ключом ничего не задваивает — приложение
  /// может слать из офлайн-очереди.
  Future<ChatMessage> send(
    Session session, {
    required ChatThread thread,
    required AccountRole senderRole,
    required int senderId,
    required String senderName,
    required String clientMessageId,
    String? body,
    QuickPhrase? phrase,
  }) async {
    final existing = await ChatMessage.db.findFirstRow(
      session,
      where: (message) => message.clientMessageId.equals(clientMessageId),
    );
    if (existing != null) return existing;

    final family = await Family.db.findById(session, thread.familyId);
    final locale = family?.locale ?? 'ru';
    final text = phrase != null ? phraseText(phrase, locale) : (body ?? '');
    if (text.trim().isEmpty) {
      throw Exception('Пустое сообщение отправить нельзя');
    }

    final critical = phrase != null && criticalPhrases.contains(phrase);
    final now = clock.now();

    final message = await ChatMessage.db.insertRow(
      session,
      ChatMessage(
        threadId: thread.id!,
        senderRole: senderRole,
        senderId: senderId,
        senderName: senderName,
        body: text.trim(),
        quickPhrase: phrase,
        critical: critical,
        createdAt: now,
        clientMessageId: clientMessageId,
      ),
    );

    await ChatThread.db.updateRow(
      session,
      thread.copyWith(lastMessageAt: now),
    );

    await _notifyOthers(
      session,
      thread: thread,
      message: message,
      family: family,
    );
    return message;
  }

  /// Сообщения разговора по порядку.
  Future<List<ChatMessage>> messages(Session session, int threadId) {
    return ChatMessage.db.find(
      session,
      where: (message) => message.threadId.equals(threadId),
      orderBy: (message) => message.createdAt,
    );
  }

  /// Уведомляет тех, кто не писал: родителя, водителя, диспетчера.
  ///
  /// Критичные фразы («ребёнок болеет», «задерживаемся») уходят и по SMS —
  /// их нельзя пропустить.
  Future<void> _notifyOthers(
    Session session, {
    required ChatThread thread,
    required ChatMessage message,
    Family? family,
  }) async {
    final body = '${message.senderName}: ${message.body}';

    // Родителям — если писал не родитель.
    if (message.senderRole != AccountRole.parent) {
      final parents = await Parent.db.find(
        session,
        where: (parent) => parent.familyId.equals(thread.familyId),
      );
      for (final parent in parents) {
        await notifications.enqueueMessage(
          session,
          dedupeKey: 'chat:${message.id}:parent:${parent.id}',
          eventKind: 'chat.message',
          phone: parent.phone,
          role: AccountRole.parent,
          body: body,
          critical: message.critical,
          rideId: thread.rideId,
          familyId: thread.familyId,
        );
      }
    }

    // Водителю — если писал не он.
    if (message.senderRole != AccountRole.driver && thread.driverId != null) {
      final driver = await Driver.db.findById(session, thread.driverId!);
      if (driver != null) {
        await notifications.enqueueMessage(
          session,
          dedupeKey: 'chat:${message.id}:driver:${driver.id}',
          eventKind: 'chat.message',
          phone: driver.phone,
          role: AccountRole.driver,
          body: body,
          critical: message.critical,
          rideId: thread.rideId,
          familyId: thread.familyId,
        );
      }
    }

    // «Ребёнок болеет» — это отмена поездки, диспетчеру нужна задача.
    if (message.quickPhrase == QuickPhrase.childIsSick) {
      await notifications.createTask(
        session,
        kind: DispatcherTaskKind.rideWithoutDriver,
        dedupeKey: 'sick:${message.id}',
        text:
            'Семья ${family?.name ?? ''} сообщила: ${message.body}. '
            'Нужно отменить поездку и предупредить водителя.',
        rideId: thread.rideId,
        familyId: thread.familyId,
      );
    }
  }
}
