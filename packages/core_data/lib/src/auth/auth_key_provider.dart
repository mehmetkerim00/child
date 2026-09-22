import 'package:child_client/child_client.dart';

/// Отдаёт клиенту Serverpod заголовок авторизации текущей сессии.
class SessionAuthKeyProvider implements ClientAuthKeyProvider {
  String? _token;

  set token(String? value) => _token = value;

  @override
  Future<String?> get authHeaderValue async {
    final token = _token;
    return token == null ? null : wrapAsBearerAuthHeaderValue(token);
  }
}
