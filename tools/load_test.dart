// Нагрузочный тест на боевом пути.
//
// Меряет то, что ломается в проде: пачка водителей одновременно
// отмечает этапы поездок, а сервер на каждое событие пишет в базу,
// двигает статус по машине состояний, списывает деньги за поездку и
// ставит уведомления в очередь каскада. Проверка живости (/health) про
// эту работу не знает ничего, поэтому мерить по ней бессмысленно.
//
// Цель из V1_ROADMAP.md: 200 одновременных поездок, 1000 событий в
// минуту. Это утро города, а не одной школы.
//
// Запуск (сервер поднят, ./tools/dev_up.sh, режим development):
//   dart tools/load_test.dart
//   dart tools/load_test.dart --drivers 200 --rides 1 --url http://host:8180/
//   dart tools/load_test.dart --keep      # не убирать сиды, посмотреть базу
//
// Скрипт сам засевает водителей с поездками (dev.seedLoad), гоняет
// события и убирает за собой (dev.cleanupLoad). Данные помечены
// префиксом LOAD- и номерами +99399…, настоящих семей они не трогают.
//
// Зависимостей нет намеренно: это инструмент эксплуатации, он должен
// запускаться на голом Dart где угодно, включая сервер.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Один этап поездки: что отправляем и что для этого нужно.
typedef Stage = ({String type, bool codeWord, bool institutionCode});

/// Боевая последовательность одной поездки.
///
/// Ровно то, что нажимает водитель: выехал → забрал (кодовое слово) →
/// приехал → передал (код учреждения). На последнем шаге сервер ещё и
/// списывает деньги, поэтому он самый тяжёлый.
const stages = <Stage>[
  (type: 'enRoute', codeWord: false, institutionCode: false),
  (type: 'pickedUp', codeWord: true, institutionCode: false),
  (type: 'arrived', codeWord: false, institutionCode: false),
  (type: 'handedOver', codeWord: false, institutionCode: true),
];

Future<void> main(List<String> args) async {
  final options = _parseArgs(args);
  final api = _Api(options.url);

  stdout.writeln('Сервер: ${options.url}');
  stdout.writeln(
    'Водителей: ${options.drivers}, поездок на водителя: ${options.rides}',
  );

  // --- Засев -------------------------------------------------------------
  stdout.writeln('Засеваю…');
  final Map<String, dynamic> fixture;
  try {
    fixture = await api.call('dev', 'seedLoad', {
      'drivers': options.drivers,
      'ridesPerDriver': options.rides,
    });
  } catch (error) {
    stderr.writeln('Не удалось засеять данные: $error');
    stderr.writeln(
      'Сервер должен быть поднят в режиме development '
      '(./tools/dev_up.sh), эндпоинт dev в проде отказывает.',
    );
    exit(1);
  }

  final drivers = (fixture['drivers'] as List).cast<Map<String, dynamic>>();
  final institutionCode = fixture['institutionCode'] as String;
  final totalRides = fixture['rides'] as int;
  final totalEvents = totalRides * stages.length;
  stdout.writeln('Засеяно поездок: $totalRides, событий будет: $totalEvents');

  // --- Нагрузка ----------------------------------------------------------
  final latencies = <int>[];
  final errors = <String>[];
  final started = DateTime.now();

  // Каждый водитель — отдельное соединение, как отдельный телефон.
  // Внутри водителя этапы идут по порядку: перепрыгнуть их нельзя,
  // сервер и не даст.
  Future<void> driveOne(Map<String, dynamic> driver) async {
    final token = driver['token'] as String;
    final codeWord = driver['codeWord'] as String;
    final rideIds = (driver['rideIds'] as List).cast<int>();
    final client = _Api(options.url, token: token);

    try {
      for (final rideId in rideIds) {
        for (final stage in stages) {
          final at = DateTime.now().toUtc().toIso8601String();
          final submission = <String, dynamic>{
            'clientEventId': 'load-$rideId-${stage.type}',
            'type': stage.type,
            'at': at,
            'hasSignature': false,
            if (stage.codeWord) 'codeWord': codeWord,
            if (stage.institutionCode) 'institutionCode': institutionCode,
          };

          final stopwatch = Stopwatch()..start();
          try {
            await client.call('rides', 'submitEvent', {
              'rideId': rideId,
              'submission': submission,
            });
          } catch (error) {
            errors.add('${stage.type} поездка $rideId: $error');
          }
          stopwatch.stop();
          latencies.add(stopwatch.elapsedMilliseconds);
        }
      }
    } finally {
      client.close();
    }
  }

  stdout.writeln('Гоню нагрузку…');
  await Future.wait(drivers.map(driveOne));

  final elapsed = DateTime.now().difference(started);
  latencies.sort();

  int percentile(int p) {
    if (latencies.isEmpty) return 0;
    return latencies[((latencies.length - 1) * p / 100).round()];
  }

  final perMinute = elapsed.inMilliseconds == 0
      ? 0
      : (latencies.length * 60000 / elapsed.inMilliseconds).round();

  // --- Проверка того, что работа действительно сделана -------------------
  //
  // Нагрузочный тест, который «прошёл», не доведя ни одной поездки, —
  // это измерение скорости отказов.
  var handedOver = 0;
  try {
    final check = await api.call('dev', 'loadResult', {});
    handedOver = check['handedOver'] as int;
  } catch (_) {
    // Старый сервер без проверки — не повод валить прогон.
  }

  // --- Уборка ------------------------------------------------------------
  if (options.cleanup) {
    stdout.writeln('Убираю сиды…');
    try {
      await api.call('dev', 'cleanupLoad', {});
    } catch (error) {
      stderr.writeln('Уборка не удалась: $error');
      stderr.writeln('Данные помечены LOAD-, их можно убрать вручную.');
    }
  } else {
    stdout.writeln('Сиды оставлены (--keep).');
  }
  api.close();

  // --- Итог --------------------------------------------------------------
  stdout.writeln('');
  stdout.writeln('Событий:      ${latencies.length}');
  stdout.writeln('Время:        ${elapsed.inMilliseconds} мс');
  stdout.writeln('В минуту:     $perMinute событий');
  stdout.writeln('Медиана:      ${percentile(50)} мс');
  stdout.writeln('p95:          ${percentile(95)} мс');
  stdout.writeln('Максимум:     ${latencies.isEmpty ? 0 : latencies.last} мс');
  stdout.writeln('Ошибок:       ${errors.length}');
  stdout.writeln('Довезено:     $handedOver из $totalRides');
  stdout.writeln('');

  for (final error in errors.take(5)) {
    stdout.writeln('  $error');
  }
  if (errors.length > 5) {
    stdout.writeln('  …и ещё ${errors.length - 5}');
  }

  // --- Пороги ------------------------------------------------------------
  var failed = false;
  if (errors.isNotEmpty) {
    stdout.writeln('ПРОВАЛ: ошибки под нагрузкой (${errors.length}).');
    failed = true;
  }
  if (handedOver < totalRides) {
    stdout.writeln(
      'ПРОВАЛ: доведено $handedOver поездок из $totalRides — '
      'часть детей «не доехала».',
    );
    failed = true;
  }
  if (percentile(95) > 2000) {
    stdout.writeln(
      'ПРОВАЛ: p95 больше двух секунд — водитель будет думать, '
      'что кнопка не сработала, и нажмёт ещё раз.',
    );
    failed = true;
  }
  if (perMinute < options.targetPerMinute) {
    stdout.writeln(
      'ПРОВАЛ: пропускная способность $perMinute событий/мин меньше цели '
      '${options.targetPerMinute}/мин.',
    );
    failed = true;
  }

  if (failed) exit(1);
  stdout.writeln('Нагрузку держит.');
}

/// Минимальный клиент Serverpod поверх dart:io.
///
/// Протокол простой: POST на `{host}{endpoint}`, телом — JSON аргументов
/// плюс поле `method`, токен в заголовке Authorization.
class _Api {
  _Api(this.host, {this.token})
    : _client = HttpClient()..connectionTimeout = const Duration(seconds: 30);

  final String host;
  final String? token;
  final HttpClient _client;

  Future<dynamic> call(
    String endpoint,
    String method,
    Map<String, dynamic> args,
  ) async {
    final body = jsonEncode({...args, 'method': method});
    final request = await _client.postUrl(Uri.parse('$host$endpoint'));
    request.headers.contentType = ContentType(
      'application',
      'json',
      charset: 'utf-8',
    );
    if (token != null) {
      request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $token');
    }
    request.contentLength = utf8.encode(body).length;
    request.write(body);
    await request.flush();

    final response = await request.close();
    final text = await response.transform(utf8.decoder).join();
    if (response.statusCode != 200) {
      throw 'HTTP ${response.statusCode}: ${text.trim()}';
    }
    return text.isEmpty ? null : jsonDecode(text);
  }

  void close() => _client.close(force: true);
}

typedef _Options = ({
  String url,
  int drivers,
  int rides,
  int targetPerMinute,
  bool cleanup,
});

_Options _parseArgs(List<String> args) {
  // Порт 8180 — API приложений; веб-сервер с /health живёт на 8182, но
  // он нам больше не нужен: бьём по тем же эндпоинтам, что телефоны.
  var url = 'http://localhost:8180/';
  var drivers = 200;
  var rides = 1;
  var cleanup = true;

  for (var i = 0; i < args.length; i++) {
    switch (args[i]) {
      case '--url' when i + 1 < args.length:
        url = args[i + 1];
      case '--drivers' when i + 1 < args.length:
        drivers = int.tryParse(args[i + 1]) ?? drivers;
      case '--rides' when i + 1 < args.length:
        rides = int.tryParse(args[i + 1]) ?? rides;
      case '--keep':
        cleanup = false;
    }
  }

  return (
    url: url.endsWith('/') ? url : '$url/',
    drivers: drivers,
    rides: rides,
    // Цель роадмапа — 1000 событий в минуту.
    targetPerMinute: 1000,
    cleanup: cleanup,
  );
}
