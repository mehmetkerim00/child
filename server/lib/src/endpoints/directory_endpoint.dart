import 'package:serverpod/serverpod.dart';

import 'package:core_domain/core_domain.dart' show AshgabatTime;

import '../auth/phone_auth.dart';
import '../generated/protocol.dart';
import '../services/money/ledger_service.dart';
import 'session_subject.dart';
import '../services/notifications/notification_service.dart';
import '../services/drivers/hiring_service.dart';
import '../services/rides/ride_generator.dart';
import '../services/rides/ride_pool.dart';
import '../services/rides/ride_view_builder.dart';

/// Справочники для панели диспетчера: семьи, дети, водители, учреждения.
///
/// Доступ только у диспетчера — родители и водители своих данных здесь
/// не правят.
class DirectoryEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('dispatcher')};

  // --- Семьи и родители ---------------------------------------------------

  Future<List<Family>> families(Session session) =>
      Family.db.find(session, orderBy: (f) => f.name);

  Future<Family> saveFamily(Session session, Family family) async {
    final normalized = family.copyWith(
      ownerPhone: PhoneAuth.normalizePhone(family.ownerPhone),
    );
    final saved = family.id == null
        ? await Family.db.insertRow(session, normalized)
        : await Family.db.updateRow(session, normalized);

    // У новой семьи сразу появляется родитель-владелец: по его номеру
    // работает вход в родительское приложение.
    if (family.id == null) {
      await Parent.db.insertRow(
        session,
        Parent(
          familyId: saved.id!,
          phone: saved.ownerPhone,
          name: saved.name,
          role: ParentRole.owner,
        ),
      );
    }
    return saved;
  }

  Future<void> deleteFamily(Session session, int familyId) async {
    final family = await Family.db.findById(session, familyId);
    if (family != null) await Family.db.deleteRow(session, family);
  }

  Future<List<Parent>> parents(Session session, int familyId) => Parent.db.find(
    session,
    where: (p) => p.familyId.equals(familyId),
    orderBy: (p) => p.id,
  );

  Future<Parent> saveParent(Session session, Parent parent) async {
    final normalized = parent.copyWith(
      phone: PhoneAuth.normalizePhone(parent.phone),
    );
    return parent.id == null
        ? await Parent.db.insertRow(session, normalized)
        : await Parent.db.updateRow(session, normalized);
  }

  // --- Дети ---------------------------------------------------------------

  Future<List<Child>> children(Session session, {int? familyId}) =>
      Child.db.find(
        session,
        where: familyId == null ? null : (c) => c.familyId.equals(familyId),
        orderBy: (c) => c.name,
      );

  Future<Child> saveChild(Session session, Child child) async =>
      child.id == null
      ? await Child.db.insertRow(session, child)
      : await Child.db.updateRow(session, child);

  Future<void> deleteChild(Session session, int childId) async {
    final child = await Child.db.findById(session, childId);
    if (child != null) await Child.db.deleteRow(session, child);
  }

  // --- Водители -----------------------------------------------------------

  Future<List<Driver>> drivers(Session session) =>
      Driver.db.find(session, orderBy: (d) => d.name);

  Future<Driver> saveDriver(Session session, Driver driver) async {
    final normalized = driver.copyWith(
      phone: PhoneAuth.normalizePhone(driver.phone),
    );
    return driver.id == null
        ? await Driver.db.insertRow(session, normalized)
        : await Driver.db.updateRow(session, normalized);
  }

  // --- Учреждения ---------------------------------------------------------

  Future<List<Institution>> institutions(Session session) =>
      Institution.db.find(session, orderBy: (i) => i.name);

  Future<Institution> saveInstitution(
    Session session,
    Institution institution,
  ) async => institution.id == null
      ? await Institution.db.insertRow(session, institution)
      : await Institution.db.updateRow(session, institution);

  // --- Круг семьи ---------------------------------------------------------

  Future<List<FamilyCircle>> circle(Session session, int familyId) =>
      FamilyCircle.db.find(
        session,
        where: (c) => c.familyId.equals(familyId),
        orderBy: (c) => c.rank,
      );

  /// Назначает водителя на место в круге семьи (постоянный/резервный).
  Future<FamilyCircle> assignDriver(
    Session session, {
    required int familyId,
    required int driverId,
    required CircleRank rank,
  }) async {
    final existing = await FamilyCircle.db.findFirstRow(
      session,
      where: (c) => c.familyId.equals(familyId) & c.rank.equals(rank),
    );
    if (existing != null) {
      return FamilyCircle.db.updateRow(
        session,
        existing.copyWith(driverId: driverId),
      );
    }
    return FamilyCircle.db.insertRow(
      session,
      FamilyCircle(familyId: familyId, driverId: driverId, rank: rank),
    );
  }

  // --- Маршруты и поездки ---------------------------------------------------

  /// Все шаблоны маршрутов.
  Future<List<RouteTemplate>> routes(Session session) =>
      RouteTemplate.db.find(session, orderBy: (t) => t.createdAt);

  /// Заявки родителей, ожидающие активации.
  Future<List<RouteTemplate>> pendingRoutes(Session session) =>
      RouteTemplate.db.find(
        session,
        where: (t) => t.active.equals(false),
        orderBy: (t) => t.createdAt,
      );

  /// Активация заявки: назначаем водителя и цену, сразу создаём поездки
  /// на сегодня и завтра.
  Future<RouteTemplate> activateRoute(
    Session session, {
    required int routeId,
    required int driverId,
    required int pricePerRideTenge,
  }) async {
    final route = await RouteTemplate.db.findById(session, routeId);
    if (route == null) throw Exception('Маршрут не найден');

    // Пока водитель не сдал тест по протоколу передачи, маршруты ему
    // не назначаются: этому нельзя научиться по ходу.
    if (!await HiringService().hasPassedTraining(session, driverId)) {
      throw Exception('Водитель ещё не сдал обучение');
    }

    final activated = await RouteTemplate.db.updateRow(
      session,
      route.copyWith(
        driverId: driverId,
        pricePerRideTenge: pricePerRideTenge,
        active: true,
      ),
    );
    await RideGenerator.generateUpcoming(session);
    return activated;
  }

  /// Отключение маршрута: новые поездки по нему не создаются.
  Future<RouteTemplate> deactivateRoute(Session session, int routeId) async {
    final route = await RouteTemplate.db.findById(session, routeId);
    if (route == null) throw Exception('Маршрут не найден');
    return RouteTemplate.db.updateRow(session, route.copyWith(active: false));
  }

  /// Ручной запуск генератора поездок: кнопка у диспетчера и способ
  /// проверить ночную задачу, не дожидаясь полуночи.
  Future<int> generateUpcomingRides(Session session) =>
      RideGenerator.generateUpcoming(session);

  /// Поездки на местную дату (по умолчанию — сегодня) для доски дня.
  Future<List<RideView>> ridesForDate(Session session, {DateTime? date}) async {
    final day = AshgabatTime.dateOf(date ?? AshgabatTime.today());
    final rides = await Ride.db.find(
      session,
      where: (r) => r.date.equals(day),
      orderBy: (r) => r.plannedTime,
    );
    return RideViewBuilder.build(session, rides);
  }

  /// События поездки — лента для разбора проблем.
  Future<List<RideEvent>> rideEvents(Session session, int rideId) =>
      RideEvent.db.find(
        session,
        where: (e) => e.rideId.equals(rideId),
        orderBy: (e) => e.at,
      );

  // --- Уведомления и задачи -------------------------------------------------

  /// Открытые задачи: то, что требует звонка или решения человека.
  Future<List<DispatcherTask>> openTasks(Session session) =>
      DispatcherTask.db.find(
        session,
        where: (task) => task.resolvedAt.equals(null),
        orderBy: (task) => task.createdAt,
        orderDescending: true,
      );

  /// Задача решена — диспетчер закрывает её вручную.
  Future<DispatcherTask?> resolveTask(Session session, int taskId) async {
    final task = await DispatcherTask.db.findById(session, taskId);
    if (task == null) return null;
    return DispatcherTask.db.updateRow(
      session,
      task.copyWith(resolvedAt: DateTime.now().toUtc()),
    );
  }

  /// Очередь уведомлений — видно, что ушло, что ждёт и что не доставлено.
  Future<List<NotificationOutbox>> notifications(Session session) =>
      NotificationOutbox.db.find(
        session,
        orderBy: (row) => row.createdAt,
        orderDescending: true,
        limit: 200,
      );

  /// Ручная отправка SMS из консоли диспетчера.
  Future<NotificationOutbox?> sendManualSms(
    Session session, {
    required String phone,
    required String body,
  }) async {
    final service = NotificationService();
    final row = await service.enqueueManualSms(
      session,
      phone: phone,
      body: body,
    );
    await service.processQueue(session);
    return row;
  }

  // --- Деньги ---------------------------------------------------------------

  /// Приёмы наличных, ожидающие подтверждения.
  Future<List<CashTopUp>> pendingTopUps(Session session) => CashTopUp.db.find(
    session,
    where: (row) => row.confirmedAt.equals(null) & row.rejectedAt.equals(null),
    orderBy: (row) => row.createdAt,
  );

  /// Подтверждение приёма наличных: деньги попадают в книгу операций.
  Future<LedgerEntry?> confirmTopUp(Session session, int topUpId) async {
    final dispatcherId = session.subjectIdFor(AccountRole.dispatcher);
    return LedgerService().confirmCashTopUp(
      session,
      topUpId: topUpId,
      dispatcherId: dispatcherId,
    );
  }

  /// Отказ: денег не было или сумма неверна.
  Future<CashTopUp> rejectTopUp(
    Session session, {
    required int topUpId,
    required String reason,
  }) {
    return LedgerService().rejectCashTopUp(
      session,
      topUpId: topUpId,
      reason: reason,
    );
  }

  /// Корректировка баланса — только новой записью и только с причиной.
  Future<LedgerEntry?> adjustBalance(
    Session session, {
    required int familyId,
    required int amountTenge,
    required String reason,
  }) {
    return LedgerService().adjust(
      session,
      familyId: familyId,
      amountTenge: amountTenge,
      reason: reason,
    );
  }

  /// Баланс конкретной семьи для панели диспетчера.
  Future<BalanceView> familyBalance(Session session, int familyId) =>
      LedgerService().balanceView(session, familyId);

  // --- Пулинг ---------------------------------------------------------------

  /// Поездки, которые можно объединить с этой в одну машину.
  ///
  /// Совместимость: тот же день, то же учреждение и близкое время подачи.
  /// Дальше диспетчер смотрит адреса и решает сам — алгоритм не должен
  /// решать за человека, кого посадить с кем.
  Future<List<PoolCandidate>> poolCandidates(
    Session session,
    int rideId, {
    int maxTimeDiffMinutes = 20,
  }) async {
    final ride = await Ride.db.findById(session, rideId);
    if (ride == null) return [];

    final target = _minutesOf(ride.plannedTime);
    final sameDay = await Ride.db.find(
      session,
      where: (r) =>
          r.date.equals(ride.date) &
          r.status.equals(RideStatus.scheduled) &
          r.id.notEquals(rideId),
    );

    final rideInstitution = await _institutionOf(session, ride);
    final candidates = <PoolCandidate>[];

    for (final other in sameDay) {
      // Уже объединённые поездки не предлагаем.
      final seats = await RidePool.activeSeats(session, other.id!);
      if (seats.length > 1) continue;

      final diff = (_minutesOf(other.plannedTime) - target).abs();
      if (diff > maxTimeDiffMinutes) continue;

      final otherInstitution = await _institutionOf(session, other);
      if (rideInstitution == null || otherInstitution != rideInstitution) {
        continue;
      }

      final child = await Child.db.findById(session, other.childId);
      if (child == null) continue;
      final template = other.templateId == null
          ? null
          : await RouteTemplate.db.findById(session, other.templateId!);

      candidates.add(
        PoolCandidate(
          ride: other,
          childName: child.name,
          fromAddress: template?.fromAddress ?? '',
          toName: otherInstitution ?? '',
          timeDiffMinutes: diff,
          needsChildSeat: child.needsChildSeat,
        ),
      );
    }

    candidates.sort(
      (a, b) => a.timeDiffMinutes.compareTo(b.timeDiffMinutes),
    );
    return candidates;
  }

  /// Объединяет поездку в пул: дети из [rideIds] пересаживаются в [rideId].
  ///
  /// Проверяет вместимость машины и детские кресла — в пул нельзя посадить
  /// больше детей, чем поместится.
  Future<Ride> mergeIntoPool(
    Session session, {
    required int rideId,
    required List<int> rideIds,
  }) async {
    final ride = await Ride.db.findById(session, rideId);
    if (ride == null) throw Exception('Поездка не найдена');
    if (ride.driverId == null) throw Exception('У поездки нет водителя');
    final driver = await Driver.db.findById(session, ride.driverId!);
    if (driver == null) throw Exception('Водитель не найден');

    var order = (await RidePool.activeSeats(session, rideId)).length;

    for (final otherId in rideIds) {
      if (otherId == rideId) continue;
      final other = await Ride.db.findById(session, otherId);
      if (other == null) continue;
      if (other.date != ride.date) {
        throw Exception('Поездки разных дней объединять нельзя');
      }

      final child = await Child.db.findById(session, other.childId);
      if (child == null) continue;

      final capacity = await RidePool.capacityFor(
        session,
        rideId: rideId,
        driver: driver,
        candidate: child,
      );
      if (!capacity.fits) {
        throw Exception(
          'Не хватает места или детского кресла для ${child.name}',
        );
      }

      final seats = await RidePool.seats(session, otherId);
      for (final seat in seats) {
        await RideSeat.db.deleteRow(session, seat);
      }
      await RidePool.addSeat(
        session,
        rideId: rideId,
        childId: child.id!,
        templateId: other.templateId,
        pickupOrder: ++order,
        seatPriceTenge: seats.isEmpty ? 0 : seats.first.seatPriceTenge,
      );

      // Исходная поездка больше не нужна: ребёнок едет в общей машине.
      await Ride.db.deleteRow(session, other);
    }

    return ride;
  }

  /// Свободные места в машине на этой поездке.
  Future<PoolCapacity> poolCapacity(Session session, int rideId) async {
    final ride = await Ride.db.findById(session, rideId);
    if (ride == null || ride.driverId == null) {
      return PoolCapacity(seatsLeft: 0, childSeatsLeft: 0, fits: false);
    }
    final driver = await Driver.db.findById(session, ride.driverId!);
    if (driver == null) {
      return PoolCapacity(seatsLeft: 0, childSeatsLeft: 0, fits: false);
    }
    return RidePool.capacityFor(session, rideId: rideId, driver: driver);
  }

  /// Места поездки — кто именно едет.
  Future<List<RideSeat>> rideSeats(Session session, int rideId) =>
      RidePool.seats(session, rideId);

  int _minutesOf(String hhmm) {
    final parts = hhmm.split(':');
    return int.parse(parts[0]) * 60 +
        int.parse(parts.length > 1 ? parts[1] : '0');
  }

  Future<String?> _institutionOf(Session session, Ride ride) async {
    if (ride.templateId == null) return null;
    final template = await RouteTemplate.db.findById(session, ride.templateId!);
    if (template?.toInstitutionId == null) return template?.toAddress;
    final institution = await Institution.db.findById(
      session,
      template!.toInstitutionId!,
    );
    return institution?.name;
  }
}
