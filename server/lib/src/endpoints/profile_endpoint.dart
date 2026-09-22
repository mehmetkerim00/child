import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Данные вошедшего пользователя: семья и дети — родителю,
/// профиль — водителю.
class ProfileEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Семья вошедшего родителя.
  Future<Family?> myFamily(Session session) async {
    final parent = await _parent(session);
    if (parent == null) return null;
    return Family.db.findById(session, parent.familyId);
  }

  /// Дети вошедшего родителя.
  Future<List<Child>> myChildren(Session session) async {
    final parent = await _parent(session);
    if (parent == null) return [];
    return Child.db.find(
      session,
      where: (c) => c.familyId.equals(parent.familyId),
      orderBy: (c) => c.name,
    );
  }

  /// Водители из «круга семьи»: постоянный и резервные.
  Future<List<Driver>> myDrivers(Session session) async {
    final parent = await _parent(session);
    if (parent == null) return [];
    final circle = await FamilyCircle.db.find(
      session,
      where: (c) => c.familyId.equals(parent.familyId),
      orderBy: (c) => c.rank,
    );
    final drivers = <Driver>[];
    for (final entry in circle) {
      final driver = await Driver.db.findById(session, entry.driverId);
      if (driver != null) drivers.add(driver);
    }
    return drivers;
  }

  /// Профиль вошедшего водителя.
  Future<Driver?> myDriverProfile(Session session) async {
    final id = _subjectId(session, AccountRole.driver);
    if (id == null) return null;
    return Driver.db.findById(session, id);
  }

  Future<Parent?> _parent(Session session) async {
    final id = _subjectId(session, AccountRole.parent);
    if (id == null) return null;
    return Parent.db.findById(session, id);
  }

  /// id записи для нужной роли из userIdentifier вида «parent:7».
  int? _subjectId(Session session, AccountRole role) {
    final auth = session.authenticated;
    if (auth == null || !auth.scopes.contains(Scope(role.name))) return null;
    final parts = auth.userIdentifier.split(':');
    return parts.length == 2 ? int.tryParse(parts[1]) : null;
  }
}
