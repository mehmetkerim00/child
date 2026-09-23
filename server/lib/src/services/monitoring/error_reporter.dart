import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';

/// Сбор ошибок. Реализация подменяется — как SMS и push.
///
/// Ошибку, о которой никто не узнал, никто и не починит: в Ашхабаде
/// родитель не станет писать в поддержку, он просто перестанет
/// пользоваться сервисом.
abstract interface class ErrorReporter {
  /// Сообщает об ошибке. Сам никогда не бросает исключений: падение
  /// сборщика ошибок не должно ронять то, что он наблюдает.
  Future<void> report(
    Session? session,
    Object error,
    StackTrace stackTrace, {
    String? context,
  });
}

/// Заглушка для разработки: печатает в консоль сервера.
class ConsoleErrorReporter implements ErrorReporter {
  const ConsoleErrorReporter();

  @override
  Future<void> report(
    Session? session,
    Object error,
    StackTrace stackTrace, {
    String? context,
  }) async {
    final where = context == null ? '' : ' [$context]';
    // ignore: avoid_print
    print('[ОШИБКА$where] $error\n$stackTrace');
    session?.log('[ОШИБКА$where] $error', level: LogLevel.error);
  }
}

/// Отправка в Sentry по DSN.
///
/// Без внешнего пакета: Sentry принимает обычный JSON по HTTPS, а тянуть
/// SDK ради одного POST на канале в 20 КБ/с не стоит.
///
/// DSN берётся из переменной окружения `SENTRY_DSN`. Пока её нет,
/// используется консольный сборщик — разработка этим не блокируется.
class SentryErrorReporter implements ErrorReporter {
  SentryErrorReporter(this.dsn, {this.environment = 'production'});

  final String dsn;
  final String environment;

  @override
  Future<void> report(
    Session? session,
    Object error,
    StackTrace stackTrace, {
    String? context,
  }) async {
    try {
      final parsed = _parse(dsn);
      if (parsed == null) return;

      final payload = jsonEncode({
        'timestamp': DateTime.now().toUtc().toIso8601String(),
        'platform': 'other',
        'environment': environment,
        'logger': context ?? 'server',
        'level': 'error',
        'exception': {
          'values': [
            {
              'type': error.runtimeType.toString(),
              // Текст ошибки может содержать телефон или имя ребёнка,
              // поэтому в Sentry уходит только тип и место, без данных.
              'value': _safeMessage(error),
            },
          ],
        },
        'extra': {'stack': stackTrace.toString().split('\n').take(30).toList()},
      });

      final client = HttpClient()
        ..connectionTimeout = const Duration(seconds: 5);
      final request = await client.postUrl(parsed.endpoint);
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      request.headers.set(
        'X-Sentry-Auth',
        'Sentry sentry_version=7, sentry_key=${parsed.key}, '
            'sentry_client=child/1.0',
      );
      request.write(payload);
      final response = await request.close();
      await response.drain<void>();
      client.close();
    } catch (_) {
      // Сборщик ошибок не имеет права ронять сервер.
    }
  }

  /// То же, что `_safeMessage`, но доступно тесту: правило «телефоны не
  /// уходят наружу» стоит проверять, а не надеяться.
  String safeMessageForTest(Object error) => _safeMessage(error);

  /// Текст без персональных данных.
  ///
  /// В сообщениях наших исключений бывают имена детей и телефоны — им
  /// нечего делать во внешнем сервисе.
  String _safeMessage(Object error) {
    final text = error.toString();
    final digits = RegExp(r'\+?\d[\d\s\-()]{6,}');
    return text.replaceAll(digits, '<номер>');
  }

  /// Разбирает DSN вида https://key@host/projectId.
  ({Uri endpoint, String key})? _parse(String dsn) {
    final uri = Uri.tryParse(dsn);
    if (uri == null || uri.userInfo.isEmpty) return null;
    final projectId = uri.pathSegments.isEmpty ? null : uri.pathSegments.last;
    if (projectId == null || projectId.isEmpty) return null;

    return (
      endpoint: Uri(
        scheme: uri.scheme,
        host: uri.host,
        port: uri.hasPort ? uri.port : null,
        path: '/api/$projectId/store/',
      ),
      key: uri.userInfo.split(':').first,
    );
  }
}

/// Текущий сборщик ошибок.
///
/// Подменяется на старте сервера: есть SENTRY_DSN — уходит в Sentry,
/// нет — печатается в консоль.
ErrorReporter errorReporter = const ConsoleErrorReporter();

/// Выбирает сборщик по окружению. Вызывается один раз при старте.
void configureErrorReporter({String? dsn, String environment = 'production'}) {
  final value = dsn ?? Platform.environment['SENTRY_DSN'];
  if (value == null || value.isEmpty) return;
  errorReporter = SentryErrorReporter(value, environment: environment);
}

/// Выполняет работу и сообщает об ошибке, не гася её.
///
/// Нужна фоновым задачам: упавший ночной проход генератора поездок
/// иначе исчезнет молча, а утром дети останутся без машин.
Future<T?> reportingErrors<T>(
  Future<T> Function() work, {
  Session? session,
  String? context,
}) async {
  try {
    return await work();
  } catch (error, stackTrace) {
    await errorReporter.report(session, error, stackTrace, context: context);
    return null;
  }
}
