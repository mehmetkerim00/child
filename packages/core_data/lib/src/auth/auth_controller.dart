import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/providers.dart';
import 'token_storage.dart';

/// Состояние входа в приложение.
sealed class AuthState {
  const AuthState();
}

/// Ещё не знаем: читаем сохранённую сессию с устройства.
class AuthRestoring extends AuthState {
  const AuthRestoring();
}

/// Пользователь не вошёл.
class AuthSignedOut extends AuthState {
  const AuthSignedOut();
}

/// Код отправлен, ждём ввода.
class AuthCodeSent extends AuthState {
  const AuthCodeSent(this.phone);

  final String phone;
}

/// Вошёл: роль, имя и токен.
class AuthSignedIn extends AuthState {
  const AuthSignedIn(this.session);

  final AuthResult session;
}

/// Вход по телефону и одноразовому коду.
///
/// Незнакомый номер получает отказ: аккаунты заводит диспетчер.
class AuthController extends StateNotifier<AuthState> {
  AuthController(this._ref, this._storage) : super(const AuthRestoring()) {
    restore();
  }

  final Ref _ref;
  final TokenStorage _storage;

  Client get _client => _ref.read(apiClientProvider);

  /// Восстанавливает сессию после перезапуска приложения.
  Future<void> restore() async {
    final saved = await _storage.read();
    if (saved == null) {
      state = const AuthSignedOut();
      return;
    }
    _ref.read(authKeyProviderProvider).token = saved.token;
    state = AuthSignedIn(saved);
  }

  /// Запрашивает код подтверждения на номер.
  Future<void> requestCode(String phone) async {
    await _client.auth.requestCode(phone);
    state = AuthCodeSent(phone);
  }

  /// Подтверждает код и сохраняет сессию.
  Future<void> verifyCode(String phone, String code) async {
    final result = await _client.auth.verifyCode(phone, code);
    await _storage.write(result);
    _ref.read(authKeyProviderProvider).token = result.token;
    state = AuthSignedIn(result);
  }

  /// Возврат к вводу номера.
  void changePhone() => state = const AuthSignedOut();

  /// Выход: сессия гасится и на сервере, и на устройстве.
  Future<void> logout() async {
    try {
      await _client.auth.logout();
    } catch (_) {
      // Нет сети — всё равно выходим локально.
    }
    await _storage.clear();
    _ref.read(authKeyProviderProvider).token = null;
    state = const AuthSignedOut();
  }
}
