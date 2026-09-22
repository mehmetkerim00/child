import 'package:serverpod/serverpod.dart';

import '../auth/phone_auth.dart';
import '../generated/protocol.dart';

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
}
