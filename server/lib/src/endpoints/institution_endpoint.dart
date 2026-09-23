import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/institutions/institution_service.dart';

/// Кабинет учреждения: работает по ссылке, без входа и установки.
///
/// Воспитателю не нужен аккаунт — у него ссылка с токеном. Поэтому
/// эндпоинт открытый, а доступ проверяется по самому токену.
class InstitutionEndpoint extends Endpoint {
  /// Список детей на сегодня по ссылке доступа.
  Future<InstitutionDayView?> dayView(
    Session session,
    String token, {
    DateTime? date,
  }) async {
    final service = InstitutionService();
    final institution = await service.institutionForToken(session, token);
    if (institution == null) return null;
    return service.dayView(session, institution: institution, date: date);
  }

  /// «Принял(а)» — независимое подтверждение передачи ребёнка.
  Future<bool> confirmArrival(
    Session session, {
    required String token,
    required int rideId,
    required int childId,
    required String confirmedBy,
  }) async {
    final service = InstitutionService();
    final institution = await service.institutionForToken(session, token);
    if (institution == null) return false;

    final seat = await service.confirmArrival(
      session,
      rideId: rideId,
      childId: childId,
      confirmedBy: confirmedBy,
    );
    return seat != null;
  }
}

/// Управление доступами учреждений — только для диспетчера.
class InstitutionAdminEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('dispatcher')};

  /// Выдаёт ссылку для учреждения. Токен показывается один раз.
  Future<String> issueAccess(
    Session session, {
    required int institutionId,
    required String issuedTo,
  }) async {
    final result = await InstitutionService().issueAccess(
      session,
      institutionId: institutionId,
      issuedTo: issuedTo,
    );
    return result.token;
  }

  /// Выданные ссылки учреждения.
  Future<List<InstitutionAccess>> accesses(
    Session session,
    int institutionId,
  ) {
    return InstitutionAccess.db.find(
      session,
      where: (row) => row.institutionId.equals(institutionId),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
    );
  }

  /// Отзывает ссылку.
  Future<void> revokeAccess(Session session, int accessId) =>
      InstitutionService().revokeAccess(session, accessId);
}
