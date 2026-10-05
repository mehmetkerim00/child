import 'dart:io';

/// Доступен ли FCM с этого сервера.
///
/// Вопрос не теоретический: сервис разворачивается на туркменском
/// хостинге, а сервисы Google оттуда могут быть недоступны. Если это
/// так, push молчит — и молчит незаметно, потому что отправка «успешна»
/// до первого таймаута.
///
/// Поэтому доступность проверяется заранее и сама: пока FCM отвечает,
/// работает обычный канал; как только перестал — сервер переключается
/// на план Б (WebSocket в приложении плюс SMS) без правки конфигов и
/// без участия человека.
class PushAvailability {
  PushAvailability({
    this.host = 'fcm.googleapis.com',
    this.port = 443,
    this.timeout = const Duration(seconds: 5),
    this.recheckAfter = const Duration(minutes: 10),
    this.recheckAfterFailure = const Duration(minutes: 2),
    DateTime Function()? now,
  }) : _now = now ?? (() => DateTime.now().toUtc());

  final String host;
  final int port;

  /// Сколько ждём соединения. Долгая проверка задержала бы очередь.
  final Duration timeout;

  /// Как часто перепроверяем, когда всё хорошо.
  final Duration recheckAfter;

  /// Как часто перепроверяем, когда FCM не отвечает.
  ///
  /// Чаще, чем в обычном режиме: блокировка может быть временной, и
  /// возвращаться к бесплатному каналу нужно быстро — каждый час на
  /// плане Б стоит денег за SMS.
  final Duration recheckAfterFailure;

  final DateTime Function() _now;

  bool? _available;
  DateTime? _checkedAt;

  /// Последний известный ответ без похода в сеть: null — ещё не знаем.
  bool? get lastKnown => _available;

  /// Когда проверяли в последний раз.
  DateTime? get checkedAt => _checkedAt;

  /// Доступен ли FCM. Результат кэшируется.
  Future<bool> isAvailable() async {
    final checked = _checkedAt;
    final cached = _available;
    if (checked != null && cached != null) {
      final ttl = cached ? recheckAfter : recheckAfterFailure;
      if (_now().difference(checked) < ttl) return cached;
    }

    final result = await probe();
    _available = result;
    _checkedAt = _now();
    return result;
  }

  /// Одна проверка связи без кэша.
  ///
  /// Обычный TCP-коннект, без запроса: нас интересует, пускает ли сюда
  /// сеть, а не что ответит Google.
  Future<bool> probe() async {
    try {
      final socket = await Socket.connect(host, port, timeout: timeout);
      socket.destroy();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Принудительно задать состояние — для тестов и ручного переключения.
  void override({required bool available}) {
    _available = available;
    _checkedAt = _now();
  }

  /// Забыть результат: следующая проверка пойдёт в сеть.
  void reset() {
    _available = null;
    _checkedAt = null;
  }
}

/// Текущая проверка доступности push.
///
/// Одна на сервер: иначе каждый проход очереди ходил бы в сеть заново.
PushAvailability pushAvailability = PushAvailability();
