import 'package:serverpod/serverpod.dart';

import '../auth/phone_auth.dart';
import '../generated/protocol.dart';
import '../services/sms/sms_gateway.dart';

/// Вход по номеру телефона и одноразовому коду.
///
/// Аккаунты заводит диспетчер: незнакомый номер получает отказ
/// `unknownPhone`, а не создаёт нового пользователя.
class AuthEndpoint extends Endpoint {
  /// Запрашивает код подтверждения. Код уходит через SmsGateway
  /// (в dev-режиме — в консоль сервера).
  Future<void> requestCode(Session session, String phoneInput) async {
    final phone = PhoneAuth.normalizePhone(phoneInput);
    final account = await _findAccount(session, phone);
    if (account == null) {
      throw AuthException(reason: AuthFailureReason.unknownPhone);
    }

    final code = PhoneAuth.generateCode();
    final now = DateTime.now().toUtc();

    // Прошлые неиспользованные коды этого номера больше не действуют.
    await OtpCode.db.deleteWhere(
      session,
      where: (c) => c.phone.equals(phone) & c.usedAt.equals(null),
    );
    await OtpCode.db.insertRow(
      session,
      OtpCode(
        phone: phone,
        codeHash: PhoneAuth.hash(code),
        expiresAt: now.add(PhoneAuth.codeLifetime),
      ),
    );

    await smsGateway.send(
      session,
      phone: phone,
      body: 'Child: код для входа $code',
    );
  }

  /// Подтверждает код и выдаёт токен сессии.
  Future<AuthResult> verifyCode(
    Session session,
    String phoneInput,
    String code,
  ) async {
    final phone = PhoneAuth.normalizePhone(phoneInput);
    final now = DateTime.now().toUtc();

    final otp = await OtpCode.db.findFirstRow(
      session,
      where: (c) => c.phone.equals(phone) & c.usedAt.equals(null),
      orderBy: (c) => c.createdAt,
      orderDescending: true,
    );
    if (otp == null) {
      throw AuthException(reason: AuthFailureReason.codeNotRequested);
    }
    if (otp.expiresAt.isBefore(now)) {
      throw AuthException(reason: AuthFailureReason.codeExpired);
    }
    if (otp.attempts >= PhoneAuth.maxAttempts) {
      throw AuthException(reason: AuthFailureReason.tooManyAttempts);
    }
    if (otp.codeHash != PhoneAuth.hash(code)) {
      await OtpCode.db.updateRow(
        session,
        otp.copyWith(attempts: otp.attempts + 1),
      );
      throw AuthException(reason: AuthFailureReason.wrongCode);
    }

    final account = await _findAccount(session, phone);
    if (account == null) {
      throw AuthException(reason: AuthFailureReason.unknownPhone);
    }

    await OtpCode.db.updateRow(session, otp.copyWith(usedAt: now));

    final token = PhoneAuth.generateToken();
    await AuthToken.db.insertRow(
      session,
      AuthToken(
        tokenHash: PhoneAuth.hash(token),
        role: account.role,
        subjectId: account.subjectId,
        phone: phone,
        expiresAt: now.add(PhoneAuth.tokenLifetime),
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

  /// Завершает сессию текущего устройства.
  Future<void> logout(Session session) async {
    final authId = session.authenticated?.authId;
    if (authId == null) return;
    final tokenId = int.tryParse(authId);
    if (tokenId == null) return;
    final stored = await AuthToken.db.findById(session, tokenId);
    if (stored == null) return;
    await AuthToken.db.updateRow(
      session,
      stored.copyWith(revokedAt: DateTime.now().toUtc()),
    );
  }

  Future<_Account?> _findAccount(Session session, String phone) async {
    final dispatcher = await DispatcherAccount.db.findFirstRow(
      session,
      where: (d) => d.phone.equals(phone) & d.active.equals(true),
    );
    if (dispatcher != null) {
      return _Account(AccountRole.dispatcher, dispatcher.id!, dispatcher.name);
    }

    final driver = await Driver.db.findFirstRow(
      session,
      where: (d) => d.phone.equals(phone) & d.active.equals(true),
    );
    if (driver != null) {
      return _Account(AccountRole.driver, driver.id!, driver.name);
    }

    final parent = await Parent.db.findFirstRow(
      session,
      where: (p) => p.phone.equals(phone),
    );
    if (parent != null) {
      return _Account(
        AccountRole.parent,
        parent.id!,
        parent.name,
        familyId: parent.familyId,
      );
    }
    return null;
  }
}

class _Account {
  _Account(this.role, this.subjectId, this.displayName, {this.familyId});

  final AccountRole role;
  final int subjectId;
  final String displayName;
  final int? familyId;
}
