import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../auth/phone_auth.dart';
import '../../generated/protocol.dart';
import '../clock.dart';
import '../rides/ride_pool.dart';

/// Кабинет учреждения: сад, школа, секция.
///
/// Воспитателю не нужно ставить приложение и заводить аккаунт — он
/// открывает ссылку и видит список детей, которых сегодня привезут.
/// Кнопка «Принял(а)» даёт **независимое от водителя** подтверждение
/// передачи: этого нет даже у мировых лидеров рынка.
class InstitutionService {
  InstitutionService({this.clock = const Clock()});

  final Clock clock;

  /// Выдаёт новую ссылку доступа. Возвращает сам токен — он показывается
  /// диспетчеру один раз, в базе остаётся только хэш.
  Future<({InstitutionAccess access, String token})> issueAccess(
    Session session, {
    required int institutionId,
    required String issuedTo,
  }) async {
    final token = PhoneAuth.generateToken();
    final access = await InstitutionAccess.db.insertRow(
      session,
      InstitutionAccess(
        institutionId: institutionId,
        tokenHash: PhoneAuth.hash(token),
        issuedTo: issuedTo,
        createdAt: clock.now(),
      ),
    );
    return (access: access, token: token);
  }

  /// Отзывает ссылку: например, воспитатель уволился или ссылка утекла.
  Future<void> revokeAccess(Session session, int accessId) async {
    final access = await InstitutionAccess.db.findById(session, accessId);
    if (access == null || access.revokedAt != null) return;
    await InstitutionAccess.db.updateRow(
      session,
      access.copyWith(revokedAt: clock.now()),
    );
  }

  /// Проверяет токен и возвращает учреждение.
  Future<Institution?> institutionForToken(
    Session session,
    String token,
  ) async {
    final access = await InstitutionAccess.db.findFirstRow(
      session,
      where: (row) => row.tokenHash.equals(PhoneAuth.hash(token)),
    );
    if (access == null || access.revokedAt != null) return null;

    await InstitutionAccess.db.updateRow(
      session,
      access.copyWith(lastUsedAt: clock.now()),
    );
    return Institution.db.findById(session, access.institutionId);
  }

  /// Кого сегодня привезут и заберут.
  Future<InstitutionDayView> dayView(
    Session session, {
    required Institution institution,
    DateTime? date,
  }) async {
    final day = AshgabatTime.dateOf(date ?? clock.now());

    // Маршруты, связанные с этим учреждением.
    final templates = await RouteTemplate.db.find(
      session,
      where: (t) => t.toInstitutionId.equals(institution.id),
    );
    final templateIds = templates.map((t) => t.id!).toSet();
    final homeTemplates = await RouteTemplate.db.find(
      session,
      where: (t) =>
          t.direction.equals(RouteDirection.toHome) &
          t.childId.inSet(templates.map((t) => t.childId).toSet()),
    );
    final homeTemplateIds = homeTemplates.map((t) => t.id!).toSet();

    final rides = await Ride.db.find(
      session,
      where: (r) => r.date.equals(day),
      orderBy: (r) => r.plannedTime,
    );

    final arrivals = <InstitutionChildRow>[];
    final departures = <InstitutionChildRow>[];

    for (final ride in rides) {
      final seats = await RidePool.seats(session, ride.id!);
      for (final seat in seats) {
        final isArrival = templateIds.contains(seat.templateId);
        final isDeparture = homeTemplateIds.contains(seat.templateId);
        if (!isArrival && !isDeparture) continue;

        final child = await Child.db.findById(session, seat.childId);
        if (child == null) continue;
        final driver = ride.driverId == null
            ? null
            : await Driver.db.findById(session, ride.driverId!);

        final row = InstitutionChildRow(
          rideId: ride.id!,
          childId: child.id!,
          childName: child.name,
          plannedTime: ride.plannedTime,
          driverName: driver?.name,
          handedOverAt: seat.handedOverAt,
          confirmedByInstitutionAt: seat.confirmedByInstitutionAt,
          absenceReason: seat.absenceReason,
        );
        (isArrival ? arrivals : departures).add(row);
      }
    }

    return InstitutionDayView(
      institutionName: institution.name,
      date: day,
      arrivals: arrivals,
      departures: departures,
    );
  }

  /// Учреждение подтверждает приём ребёнка.
  ///
  /// Это второе, независимое подтверждение: первое даёт водитель кодом
  /// учреждения или подписью, второе — сам воспитатель.
  Future<RideSeat?> confirmArrival(
    Session session, {
    required int rideId,
    required int childId,
    required String confirmedBy,
  }) async {
    final seat = await RideSeat.db.findFirstRow(
      session,
      where: (row) => row.rideId.equals(rideId) & row.childId.equals(childId),
    );
    if (seat == null) return null;
    if (seat.confirmedByInstitutionAt != null) return seat;

    return RideSeat.db.updateRow(
      session,
      seat.copyWith(
        confirmedByInstitutionAt: clock.now(),
        confirmedByInstitutionName: confirmedBy.trim().isEmpty
            ? 'Учреждение'
            : confirmedBy.trim(),
      ),
    );
  }

  /// Семья заранее сообщает, что ребёнок сегодня не едет.
  ///
  /// Водитель и учреждение видят это сразу — никто не ждёт зря.
  Future<RideSeat?> declareAbsence(
    Session session, {
    required int rideId,
    required int childId,
    required String reason,
  }) async {
    if (reason.trim().isEmpty) {
      throw Exception('Нужно указать причину отсутствия');
    }
    final seat = await RideSeat.db.findFirstRow(
      session,
      where: (row) => row.rideId.equals(rideId) & row.childId.equals(childId),
    );
    if (seat == null) return null;

    return RideSeat.db.updateRow(
      session,
      seat.copyWith(
        cancelledAt: clock.now(),
        absenceReason: reason.trim(),
      ),
    );
  }
}
