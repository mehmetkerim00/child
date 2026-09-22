import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Кто вошёл: роль и запись в базе.
///
/// Саму роль проверяет Serverpod через `requiredScopes` эндпоинта —
/// здесь только достаём запись пользователя.
///
/// userIdentifier имеет вид «parent:7» — см. auth/auth_handler.dart.
extension SessionSubject on Session {
  /// id записи для роли или null, если роль другая.
  int? subjectIdFor(AccountRole role) {
    final auth = authenticated;
    if (auth == null || !auth.scopes.contains(Scope(role.name))) return null;
    final parts = auth.userIdentifier.split(':');
    return parts.length == 2 ? int.tryParse(parts[1]) : null;
  }

  /// Вошедший родитель. Бросает исключение, если роль другая.
  Future<Parent> requireParent() async {
    final id = subjectIdFor(AccountRole.parent);
    final parent = id == null ? null : await Parent.db.findById(this, id);
    if (parent == null) throw Exception('Доступно только родителю');
    return parent;
  }

  /// Вошедший водитель. Бросает исключение, если роль другая.
  Future<Driver> requireDriver() async {
    final id = subjectIdFor(AccountRole.driver);
    final driver = id == null ? null : await Driver.db.findById(this, id);
    if (driver == null) throw Exception('Доступно только водителю');
    return driver;
  }
}
