import 'package:serverpod/serverpod.dart';

/// Отправка SMS. Реализация подменяется: провайдер, GSM-модем или заглушка.
///
/// Клиентские приложения никогда не отправляют SMS сами — только сервер
/// (MVP_PLAN §6).
abstract interface class SmsGateway {
  /// Отправляет сообщение. Бросает исключение, если доставка не удалась.
  Future<void> send(
    Session session, {
    required String phone,
    required String body,
  });
}

/// Заглушка для разработки: печатает сообщение в консоль сервера.
class ConsoleSmsGateway implements SmsGateway {
  const ConsoleSmsGateway();

  @override
  Future<void> send(
    Session session, {
    required String phone,
    required String body,
  }) async {
    session.log('[SMS → $phone] $body');
    // Дублируем в stdout: в dev-режиме удобно видеть код входа сразу.
    // ignore: avoid_print
    print('[SMS → $phone] $body');
  }
}

/// Текущий шлюз. В проде подменяется на реального провайдера (§9, п.1).
SmsGateway smsGateway = const ConsoleSmsGateway();
