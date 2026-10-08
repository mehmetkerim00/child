import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../../auth/phone_auth.dart';

/// Кто стоит за номером телефона.
class AccountRef {
  const AccountRef(
    this.role,
    this.subjectId,
    this.displayName, {
    this.familyId,
  });

  final AccountRole role;
  final int subjectId;
  final String displayName;
  final int? familyId;
}

/// Поиск аккаунта по номеру и выдача сессии.
///
/// Вынесено из AuthEndpoint, чтобы вход по коду и вход для разработки
/// шли одним путём. Если бы dev-вход выдавал токен по-своему, ручная
/// проверка подтверждала бы работу кода, которого нет в бою.
abstract final class SessionIssuer {
  /// Находит аккаунт по номеру.
  ///
  /// Владелец первым: его номер может совпадать с диспетчерским, и
  /// тогда он должен входить как владелец, а не терять доступ к деньгам.
  static Future<AccountRef?> findAccount(Session session, String phone) async {
    final owner = await OwnerAccount.db.findFirstRow(
      session,
      where: (o) => o.phone.equals(phone) & o.active.equals(true),
    );
    if (owner != null) {
      return AccountRef(AccountRole.owner, owner.id!, owner.name);
    }

    final dispatcher = await DispatcherAccount.db.findFirstRow(
      session,
      where: (d) => d.phone.equals(phone) & d.active.equals(true),
    );
    if (dispatcher != null) {
      return AccountRef(
        AccountRole.dispatcher,
        dispatcher.id!,
        dispatcher.name,
      );
    }

    final driver = await Driver.db.findFirstRow(
      session,
      where: (d) => d.phone.equals(phone) & d.active.equals(true),
    );
    if (driver != null) {
      return AccountRef(AccountRole.driver, driver.id!, driver.name);
    }

    final parent = await Parent.db.findFirstRow(
      session,
      where: (p) => p.phone.equals(phone),
    );
    if (parent != null) {
      return AccountRef(
        AccountRole.parent,
        parent.id!,
        parent.name,
        familyId: parent.familyId,
      );
    }
    return null;
  }

  /// Создаёт токен сессии и возвращает результат входа.
  static Future<AuthResult> issue(
    Session session,
    AccountRef account,
    String phone,
  ) async {
    final token = PhoneAuth.generateToken();
    await AuthToken.db.insertRow(
      session,
      AuthToken(
        tokenHash: PhoneAuth.hash(token),
        role: account.role,
        subjectId: account.subjectId,
        phone: phone,
        expiresAt: DateTime.now().toUtc().add(PhoneAuth.tokenLifetime),
      ),
    );

    return AuthResult(
      token: token,
      role: account.role,
      displayName: account.displayName,
      subjectId: account.subjectId,
      familyId: account.familyId,
    );
  }
}
