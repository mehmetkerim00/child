import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../auth/phone_auth.dart';
import '../../generated/protocol.dart';
import '../clock.dart';

/// Конвейер найма водителей.
///
/// Водитель-няня — не таксист: его выбирают как человека, которому
/// отдают ребёнка. Поэтому путь от анкеты до первого рейса проходит
/// через проверки, обучение и тест, а не через «скачал приложение».
class HiringService {
  HiringService({this.clock = const Clock()});

  final Clock clock;

  /// Порог сдачи теста: 8 из 10. Протокол передачи ребёнка нельзя знать
  /// «в целом».
  static const passThreshold = 0.8;

  /// Обязательные проверки: без них водителя не нанимают.
  static const requiredChecks = {
    CheckKind.passport,
    CheckKind.drivingLicense,
    CheckKind.carDocuments,
    CheckKind.criminalRecord,
    CheckKind.interview,
    CheckKind.childSeatDemo,
  };

  /// Приём анкеты от кандидата.
  Future<DriverApplication> submit(
    Session session,
    DriverApplication application,
  ) async {
    final phone = PhoneAuth.normalizePhone(application.phone);

    // Повторная анкета с того же номера не плодит дубликаты.
    final existing = await DriverApplication.db.findFirstRow(
      session,
      where: (row) =>
          row.phone.equals(phone) &
          row.status.notEquals(ApplicationStatus.rejected),
    );
    if (existing != null) return existing;

    return DriverApplication.db.insertRow(
      session,
      application.copyWith(
        id: null,
        phone: phone,
        status: ApplicationStatus.submitted,
        createdAt: clock.now(),
        driverId: null,
      ),
    );
  }

  /// Отметка пункта чек-листа. Всегда с именем диспетчера.
  Future<ApplicationCheck> check(
    Session session, {
    required int applicationId,
    required CheckKind kind,
    required bool passed,
    int? dispatcherId,
    String? note,
  }) async {
    final existing = await ApplicationCheck.db.findFirstRow(
      session,
      where: (row) =>
          row.applicationId.equals(applicationId) & row.kind.equals(kind),
    );

    if (existing != null) {
      return ApplicationCheck.db.updateRow(
        session,
        existing.copyWith(
          passed: passed,
          note: note,
          checkedAt: clock.now(),
          checkedBy: dispatcherId,
        ),
      );
    }

    return ApplicationCheck.db.insertRow(
      session,
      ApplicationCheck(
        applicationId: applicationId,
        kind: kind,
        passed: passed,
        note: note,
        checkedAt: clock.now(),
        checkedBy: dispatcherId,
      ),
    );
  }

  /// Все ли обязательные проверки пройдены.
  Future<bool> allChecksPassed(Session session, int applicationId) async {
    final checks = await ApplicationCheck.db.find(
      session,
      where: (row) => row.applicationId.equals(applicationId),
    );
    final passed = checks
        .where((check) => check.passed)
        .map((check) => check.kind)
        .toSet();
    return requiredChecks.every(passed.contains);
  }

  /// Перевод кандидата на следующий этап.
  Future<DriverApplication> setStatus(
    Session session, {
    required int applicationId,
    required ApplicationStatus status,
    String? rejectedReason,
  }) async {
    final application = await DriverApplication.db.findById(
      session,
      applicationId,
    );
    if (application == null) throw Exception('Анкета не найдена');

    if (status == ApplicationStatus.rejected &&
        (rejectedReason == null || rejectedReason.trim().isEmpty)) {
      throw Exception('Отказ без причины недопустим');
    }

    return DriverApplication.db.updateRow(
      session,
      application.copyWith(
        status: status,
        rejectedReason: rejectedReason?.trim(),
      ),
    );
  }

  /// Наём: создаёт аккаунт водителя из анкеты.
  ///
  /// Нанять можно только после всех проверок — это последний барьер
  /// перед тем, как человеку доверят ребёнка.
  Future<Driver> hire(Session session, int applicationId) async {
    final application = await DriverApplication.db.findById(
      session,
      applicationId,
    );
    if (application == null) throw Exception('Анкета не найдена');
    if (application.driverId != null) {
      final existing = await Driver.db.findById(session, application.driverId!);
      if (existing != null) return existing;
    }

    if (!await allChecksPassed(session, applicationId)) {
      throw Exception('Не пройдены обязательные проверки');
    }

    final driver = await Driver.db.insertRow(
      session,
      Driver(
        phone: application.phone,
        name: application.fullName,
        carModel: application.carModel,
        carPlate: application.carPlate,
        experienceNote: application.experienceWithChildren,
        vettingStatus: VettingStatus.verified,
        isFemale: application.isFemale,
        childSeats: application.hasChildSeat ? 1 : 0,
        createdAt: clock.now(),
      ),
    );

    await DriverApplication.db.updateRow(
      session,
      application.copyWith(
        status: ApplicationStatus.hired,
        driverId: driver.id,
      ),
    );
    return driver;
  }

  /// Записывает результат теста после обучения.
  Future<TrainingResult> recordTraining(
    Session session, {
    required int driverId,
    required int correct,
    required int total,
  }) async {
    if (total <= 0) throw Exception('Пустой тест');

    final previous = await TrainingResult.db.find(
      session,
      where: (row) => row.driverId.equals(driverId),
    );
    final passed = correct / total >= passThreshold;

    return TrainingResult.db.insertRow(
      session,
      TrainingResult(
        driverId: driverId,
        correct: correct,
        total: total,
        passed: passed,
        attempt: previous.length + 1,
        createdAt: clock.now(),
      ),
    );
  }

  /// Сдал ли водитель обучение.
  ///
  /// Пока не сдал — маршруты ему не назначаются.
  Future<bool> hasPassedTraining(Session session, int driverId) async {
    final results = await TrainingResult.db.find(
      session,
      where: (row) => row.driverId.equals(driverId) & row.passed.equals(true),
    );
    return results.isNotEmpty;
  }

  /// Расчёт водителю за период.
  ///
  /// Блок — это утро или день: он оплачивается гарантированно, даже если
  /// поездок в нём оказалось меньше обычного. Так водитель не теряет
  /// заработок из-за чужих отмен.
  Future<PayoutPeriod> calculatePayout(
    Session session, {
    required int driverId,
    required DateTime fromDate,
    required DateTime toDate,
    required int blockPayTenge,
    required int perRideTenge,
  }) async {
    final from = AshgabatTime.dateOf(fromDate);
    final to = AshgabatTime.dateOf(toDate);

    final rides = await Ride.db.find(
      session,
      where: (r) =>
          r.driverId.equals(driverId) &
          (r.date >= from) &
          (r.date <= to) &
          r.status.equals(RideStatus.handedOver),
    );

    // Блок = день + время суток: утро (до 12:00) и день.
    final blocks = <String>{};
    for (final ride in rides) {
      final hour = int.parse(ride.plannedTime.split(':').first);
      final part = hour < 12 ? 'morning' : 'day';
      blocks.add('${ride.date.toIso8601String()}:$part');
    }

    final blockPay = blocks.length * blockPayTenge;
    final ridePay = rides.length * perRideTenge;

    return PayoutPeriod.db.insertRow(
      session,
      PayoutPeriod(
        driverId: driverId,
        fromDate: from,
        toDate: to,
        blocks: blocks.length,
        blockPayTenge: blockPay,
        ridePayTenge: ridePay,
        totalTenge: blockPay + ridePay,
        createdAt: clock.now(),
      ),
    );
  }

  /// Фиксирует инцидент.
  Future<Incident> logIncident(
    Session session, {
    required IncidentSeverity severity,
    required String description,
    int? driverId,
    int? rideId,
    int? familyId,
    int? dispatcherId,
  }) async {
    if (description.trim().isEmpty) {
      throw Exception('Нужно описать, что случилось');
    }
    return Incident.db.insertRow(
      session,
      Incident(
        driverId: driverId,
        rideId: rideId,
        familyId: familyId,
        severity: severity,
        description: description.trim(),
        createdAt: clock.now(),
        createdBy: dispatcherId,
      ),
    );
  }

  /// Закрывает инцидент решением. Решение обязательно: «просто закрыть»
  /// нельзя, иначе журнал превращается в свалку.
  Future<Incident> resolveIncident(
    Session session, {
    required int incidentId,
    required String resolution,
  }) async {
    if (resolution.trim().isEmpty) {
      throw Exception('Нужно описать решение');
    }
    final incident = await Incident.db.findById(session, incidentId);
    if (incident == null) throw Exception('Инцидент не найден');

    return Incident.db.updateRow(
      session,
      incident.copyWith(
        resolution: resolution.trim(),
        resolvedAt: clock.now(),
      ),
    );
  }
}
