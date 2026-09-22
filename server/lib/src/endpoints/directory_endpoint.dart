import 'package:serverpod/serverpod.dart';

import 'package:core_domain/core_domain.dart' show AshgabatTime;

import '../auth/phone_auth.dart';
import '../generated/protocol.dart';
import '../services/notifications/notification_service.dart';
import '../services/rides/ride_generator.dart';
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
    required int pricePerRide,
  }) async {
    final route = await RouteTemplate.db.findById(session, routeId);
    if (route == null) throw Exception('Маршрут не найден');

    final activated = await RouteTemplate.db.updateRow(
      session,
      route.copyWith(
        driverId: driverId,
        pricePerRide: pricePerRide,
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
}
