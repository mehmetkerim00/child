import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/drivers/hiring_service.dart';
import 'session_subject.dart';

/// Приём анкет кандидатов — открытый эндпоинт.
///
/// Кандидат заполняет анкету с телефона: аккаунта у него ещё нет.
class DriverApplicationEndpoint extends Endpoint {
  /// Подать анкету.
  Future<DriverApplication> submit(
    Session session,
    DriverApplication application,
  ) => HiringService().submit(session, application);
}

/// Конвейер найма и работа с водителями — только диспетчер.
class HiringEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('dispatcher')};

  /// Анкеты по этапам.
  Future<List<DriverApplication>> applications(
    Session session, {
    ApplicationStatus? status,
  }) {
    return DriverApplication.db.find(
      session,
      where: status == null ? null : (row) => row.status.equals(status),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
    );
  }

  /// Чек-лист проверки кандидата.
  Future<List<ApplicationCheck>> checks(Session session, int applicationId) {
    return ApplicationCheck.db.find(
      session,
      where: (row) => row.applicationId.equals(applicationId),
      orderBy: (row) => row.kind,
    );
  }

  /// Отметить пункт чек-листа.
  Future<ApplicationCheck> setCheck(
    Session session, {
    required int applicationId,
    required CheckKind kind,
    required bool passed,
    String? note,
  }) {
    return HiringService().check(
      session,
      applicationId: applicationId,
      kind: kind,
      passed: passed,
      note: note,
      dispatcherId: session.subjectIdFor(AccountRole.dispatcher),
    );
  }

  /// Перевести кандидата на другой этап.
  Future<DriverApplication> setStatus(
    Session session, {
    required int applicationId,
    required ApplicationStatus status,
    String? rejectedReason,
  }) {
    return HiringService().setStatus(
      session,
      applicationId: applicationId,
      status: status,
      rejectedReason: rejectedReason,
    );
  }

  /// Нанять: создать аккаунт водителя из анкеты.
  Future<Driver> hire(Session session, int applicationId) =>
      HiringService().hire(session, applicationId);

  /// Готов ли водитель к работе: сдан ли тест после обучения.
  Future<bool> trainingPassed(Session session, int driverId) =>
      HiringService().hasPassedTraining(session, driverId);

  /// Расчёт водителю за период.
  Future<PayoutPeriod> calculatePayout(
    Session session, {
    required int driverId,
    required DateTime fromDate,
    required DateTime toDate,
    required int blockPayTenge,
    required int perRideTenge,
  }) {
    return HiringService().calculatePayout(
      session,
      driverId: driverId,
      fromDate: fromDate,
      toDate: toDate,
      blockPayTenge: blockPayTenge,
      perRideTenge: perRideTenge,
    );
  }

  /// Расчёты за периоды — для выгрузки на выплату.
  Future<List<PayoutPeriod>> payouts(Session session, {int? driverId}) {
    return PayoutPeriod.db.find(
      session,
      where: driverId == null ? null : (row) => row.driverId.equals(driverId),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
    );
  }

  /// Отметить выплату произведённой.
  Future<PayoutPeriod?> markPaid(Session session, int payoutId) async {
    final payout = await PayoutPeriod.db.findById(session, payoutId);
    if (payout == null) return null;
    return PayoutPeriod.db.updateRow(
      session,
      payout.copyWith(paidAt: DateTime.now().toUtc()),
    );
  }

  /// Журнал инцидентов.
  Future<List<Incident>> incidents(Session session, {int? driverId}) {
    return Incident.db.find(
      session,
      where: driverId == null ? null : (row) => row.driverId.equals(driverId),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
    );
  }

  /// Зафиксировать инцидент.
  Future<Incident> logIncident(
    Session session, {
    required IncidentSeverity severity,
    required String description,
    int? driverId,
    int? rideId,
    int? familyId,
  }) {
    return HiringService().logIncident(
      session,
      severity: severity,
      description: description,
      driverId: driverId,
      rideId: rideId,
      familyId: familyId,
      dispatcherId: session.subjectIdFor(AccountRole.dispatcher),
    );
  }

  /// Закрыть инцидент решением.
  Future<Incident> resolveIncident(
    Session session, {
    required int incidentId,
    required String resolution,
  }) {
    return HiringService().resolveIncident(
      session,
      incidentId: incidentId,
      resolution: resolution,
    );
  }
}

/// Обучение в приложении водителя.
class TrainingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('driver')};

  /// Сдан ли тест — от этого зависит назначение маршрутов.
  Future<bool> myTrainingPassed(Session session) async {
    final driver = await session.requireDriver();
    return HiringService().hasPassedTraining(session, driver.id!);
  }

  /// Мои попытки теста.
  Future<List<TrainingResult>> myResults(Session session) async {
    final driver = await session.requireDriver();
    return TrainingResult.db.find(
      session,
      where: (row) => row.driverId.equals(driver.id),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
    );
  }

  /// Записать результат теста.
  Future<TrainingResult> submitTest(
    Session session, {
    required int correct,
    required int total,
  }) async {
    final driver = await session.requireDriver();
    return HiringService().recordTraining(
      session,
      driverId: driver.id!,
      correct: correct,
      total: total,
    );
  }
}
