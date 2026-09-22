import 'package:core_data/core_data.dart';

/// Хранилище сессии для тестов: без обращения к диску.
class FakeTokenStorage extends TokenStorage {
  FakeTokenStorage([this._session]);

  AuthResult? _session;

  @override
  Future<AuthResult?> read() async => _session;

  @override
  Future<void> write(AuthResult session) async => _session = session;

  @override
  Future<void> clear() async => _session = null;
}

/// Готовая сессия родителя для тестов.
AuthResult testParentSession({String name = 'Огулджан'}) => AuthResult(
  token: 'test-token',
  role: AccountRole.parent,
  displayName: name,
  subjectId: 1,
  familyId: 1,
);

/// Готовая сессия водителя для тестов.
AuthResult testDriverSession({String name = 'Аман'}) => AuthResult(
  token: 'test-token',
  role: AccountRole.driver,
  displayName: name,
  subjectId: 1,
);

/// Готовая сессия диспетчера для тестов.
AuthResult testDispatcherSession({String name = 'Мерджен'}) => AuthResult(
  token: 'test-token',
  role: AccountRole.dispatcher,
  displayName: name,
  subjectId: 1,
);
