import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// Вход по телефону: одноразовый код + токен сессии.
abstract final class PhoneAuth {
  /// Сколько живёт код подтверждения.
  static const codeLifetime = Duration(minutes: 5);

  /// Сколько живёт сессия до повторного входа.
  static const tokenLifetime = Duration(days: 30);

  /// Максимум попыток ввода одного кода.
  static const maxAttempts = 5;

  static final _random = Random.secure();

  /// Приводит номер к виду +993XXXXXXXX: пользователи вводят его по-разному.
  static String normalizePhone(String input) {
    final digits = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.startsWith('993')) return '+$digits';
    if (digits.startsWith('8') && digits.length == 9) {
      return '+993${digits.substring(1)}';
    }
    if (digits.length == 8) return '+993$digits';
    return '+$digits';
  }

  /// Шестизначный код. Хранится только его хэш.
  static String generateCode() => (_random.nextInt(900000) + 100000).toString();

  static String hash(String value) =>
      sha256.convert(utf8.encode(value)).toString();

  /// Случайный токен сессии (передаётся клиенту один раз).
  static String generateToken() {
    final bytes = List<int>.generate(32, (_) => _random.nextInt(256));
    return base64Url.encode(bytes);
  }
}
