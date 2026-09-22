import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'phone_auth.dart';

/// Проверяет токен сессии в каждом запросе.
///
/// Возвращает роль как scope: parent, driver или dispatcher.
Future<AuthenticationInfo?> authenticationHandler(
  Session session,
  String token,
) async {
  final stored = await AuthToken.db.findFirstRow(
    session,
    where: (t) => t.tokenHash.equals(PhoneAuth.hash(token)),
  );
  if (stored == null || stored.revokedAt != null) return null;
  if (stored.expiresAt.isBefore(DateTime.now().toUtc())) return null;

  // userIdentifier — «роль:id», чтобы parent 7 и driver 7 не путались.
  return AuthenticationInfo(
    '${stored.role.name}:${stored.subjectId}',
    {Scope(stored.role.name)},
    authId: stored.id!.toString(),
  );
}
