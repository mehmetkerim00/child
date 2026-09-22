import 'dart:convert';

import 'package:child_client/child_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Хранилище сессии на устройстве: токен и кто вошёл.
///
/// Токен хранится локально; на сервере лежит только его хэш.
class TokenStorage {
  static const _key = 'child.auth.session';

  Future<AuthResult?> read() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return AuthResult(
        token: map['token'] as String,
        role: AccountRole.values.byName(map['role'] as String),
        displayName: map['displayName'] as String,
        subjectId: map['subjectId'] as int,
        familyId: map['familyId'] as int?,
      );
    } catch (_) {
      // Формат изменился или данные повреждены — считаем, что сессии нет.
      await prefs.remove(_key);
      return null;
    }
  }

  Future<void> write(AuthResult session) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode({
        'token': session.token,
        'role': session.role.name,
        'displayName': session.displayName,
        'subjectId': session.subjectId,
        'familyId': session.familyId,
      }),
    );
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
