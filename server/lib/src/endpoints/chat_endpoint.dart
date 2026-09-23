import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/chat/chat_service.dart';
import 'session_subject.dart';

/// Переписка внутри приложения: родитель ↔ водитель ↔ диспетчер.
///
/// Телефоны сторон нигде не отдаются наружу: у родителя есть только имя
/// водителя, у водителя — имя семьи. Экстренная связь идёт к диспетчеру.
class ChatEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Разговор по поездке. Создаётся при первом обращении.
  Future<ChatThread> threadForRide(Session session, int rideId) async {
    final ride = await _accessibleRide(session, rideId);
    return ChatService().threadForRide(session, ride);
  }

  /// Общий разговор семьи (без привязки к поездке).
  Future<ChatThread> myThread(Session session) async {
    final parent = await session.requireParent();
    return ChatService().threadForFamily(session, parent.familyId);
  }

  /// Сообщения разговора.
  Future<List<ChatMessage>> messages(Session session, int threadId) async {
    await _accessibleThread(session, threadId);
    return ChatService().messages(session, threadId);
  }

  /// Отправка сообщения: свободный текст или готовая фраза.
  Future<ChatMessage> send(
    Session session, {
    required int threadId,
    required String clientMessageId,
    String? body,
    QuickPhrase? phrase,
  }) async {
    final thread = await _accessibleThread(session, threadId);
    final sender = await _sender(session);

    return ChatService().send(
      session,
      thread: thread,
      senderRole: sender.role,
      senderId: sender.id,
      senderName: sender.name,
      clientMessageId: clientMessageId,
      body: body,
      phrase: phrase,
    );
  }

  /// Номер диспетчера для кнопки экстренной связи.
  ///
  /// Это единственный номер, который приложение показывает: родитель
  /// звонит диспетчеру, а не водителю.
  Future<String?> dispatcherPhone(Session session) async {
    final dispatcher = await DispatcherAccount.db.findFirstRow(
      session,
      where: (account) => account.active.equals(true),
      orderBy: (account) => account.id,
    );
    return dispatcher?.phone;
  }

  /// Кто пишет: роль, id и имя для истории переписки.
  Future<({AccountRole role, int id, String name})> _sender(
    Session session,
  ) async {
    final parentId = session.subjectIdFor(AccountRole.parent);
    if (parentId != null) {
      final parent = await Parent.db.findById(session, parentId);
      return (
        role: AccountRole.parent,
        id: parentId,
        name: parent?.name ?? 'Родитель',
      );
    }
    final driverId = session.subjectIdFor(AccountRole.driver);
    if (driverId != null) {
      final driver = await Driver.db.findById(session, driverId);
      return (
        role: AccountRole.driver,
        id: driverId,
        name: driver?.name ?? 'Водитель',
      );
    }
    final dispatcherId = session.subjectIdFor(AccountRole.dispatcher);
    if (dispatcherId != null) {
      final dispatcher = await DispatcherAccount.db.findById(
        session,
        dispatcherId,
      );
      return (
        role: AccountRole.dispatcher,
        id: dispatcherId,
        name: dispatcher?.name ?? 'Диспетчер',
      );
    }
    throw Exception('Неизвестный отправитель');
  }

  /// Разговор доступен своей семье, назначенному водителю и диспетчеру.
  Future<ChatThread> _accessibleThread(Session session, int threadId) async {
    final thread = await ChatThread.db.findById(session, threadId);
    if (thread == null) throw Exception('Разговор не найден');

    if (session.subjectIdFor(AccountRole.dispatcher) != null) return thread;

    final parentId = session.subjectIdFor(AccountRole.parent);
    if (parentId != null) {
      final parent = await Parent.db.findById(session, parentId);
      if (parent?.familyId == thread.familyId) return thread;
    }

    final driverId = session.subjectIdFor(AccountRole.driver);
    if (driverId != null) {
      if (thread.driverId == driverId) return thread;
      // Водитель пула: он везёт ребёнка этой семьи.
      if (thread.rideId != null) {
        final ride = await Ride.db.findById(session, thread.rideId!);
        if (ride?.driverId == driverId) return thread;
      }
    }

    throw Exception('Нет доступа к этому разговору');
  }

  /// Поездка доступна своей семье, её водителю и диспетчеру.
  Future<Ride> _accessibleRide(Session session, int rideId) async {
    final ride = await Ride.db.findById(session, rideId);
    if (ride == null) throw Exception('Поездка не найдена');

    if (session.subjectIdFor(AccountRole.dispatcher) != null) return ride;

    final driverId = session.subjectIdFor(AccountRole.driver);
    if (driverId != null && ride.driverId == driverId) return ride;

    final parentId = session.subjectIdFor(AccountRole.parent);
    if (parentId != null) {
      final parent = await Parent.db.findById(session, parentId);
      final children = await Child.db.find(
        session,
        where: (child) => child.familyId.equals(parent?.familyId),
      );
      final ids = children.map((child) => child.id!).toSet();
      final seat = await RideSeat.db.findFirstRow(
        session,
        where: (row) => row.rideId.equals(rideId) & row.childId.inSet(ids),
      );
      if (seat != null || ids.contains(ride.childId)) return ride;
    }

    throw Exception('Нет доступа к этой поездке');
  }
}
