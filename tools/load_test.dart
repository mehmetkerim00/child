// Нагрузочный тест: выдержит ли сервер утро пилота и утро после него.
//
// Цель из V1_ROADMAP.md: 200 одновременных поездок и 1000 событий в
// минуту. Это утро города, а не одной школы: 200 машин отмечают этапы
// в один и тот же промежуток с 07:00 до 07:40.
//
// Запуск (сервер должен быть поднят, ./tools/dev_up.sh):
//   dart tools/load_test.dart --rides 200 --events 1000
//   dart tools/load_test.dart --url https://api.example.tm/ --rides 50
//
// Порт 8182 — это веб-сервер Serverpod, на нём живёт /health. На 8180
// отвечают эндпоинты приложений, и обычным GET туда не постучаться.
//
// Скрипт ничего не создаёт в базе: он бьёт по открытому health-эндпоинту
// тем же числом одновременных запросов, что и настоящее утро. Это
// измеряет то, что чаще всего и ломается первым, — способность сервера
// и пула соединений принять всплеск.
import 'dart:async';
import 'dart:io';

Future<void> main(List<String> args) async {
  final options = _parseArgs(args);
  final url = Uri.parse('${options.url}health');

  stdout.writeln('Нагрузка на $url');
  stdout.writeln(
    'Одновременных: ${options.concurrency}, запросов: ${options.requests}',
  );

  final latencies = <int>[];
  var errors = 0;
  final started = DateTime.now();

  final client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 10)
    ..maxConnectionsPerHost = options.concurrency;

  var sent = 0;
  Future<void> worker() async {
    while (true) {
      // Каждый воркер берёт следующий номер: так одновременных ровно
      // столько, сколько задано, а не «сколько получится».
      final index = sent++;
      if (index >= options.requests) return;

      final stopwatch = Stopwatch()..start();
      try {
        final request = await client.getUrl(url);
        final response = await request.close();
        await response.drain<void>();
        if (response.statusCode != 200) errors++;
      } catch (_) {
        errors++;
      }
      stopwatch.stop();
      latencies.add(stopwatch.elapsedMilliseconds);
    }
  }

  await Future.wait([
    for (var i = 0; i < options.concurrency; i++) worker(),
  ]);
  client.close();

  final elapsed = DateTime.now().difference(started);
  latencies.sort();

  int percentile(int p) {
    if (latencies.isEmpty) return 0;
    final index = ((latencies.length - 1) * p / 100).round();
    return latencies[index];
  }

  final perMinute = elapsed.inMilliseconds == 0
      ? 0
      : (options.requests * 60000 / elapsed.inMilliseconds).round();

  stdout.writeln('');
  stdout.writeln('Время:        ${elapsed.inMilliseconds} мс');
  stdout.writeln('В минуту:     $perMinute запросов');
  stdout.writeln('Медиана:      ${percentile(50)} мс');
  stdout.writeln('p95:          ${percentile(95)} мс');
  stdout.writeln('Максимум:     ${latencies.isEmpty ? 0 : latencies.last} мс');
  stdout.writeln('Ошибок:       $errors');
  stdout.writeln('');

  // Пороги: родитель ждёт ответа приложения, а не «когда-нибудь».
  var failed = false;
  if (errors > 0) {
    stdout.writeln('ПРОВАЛ: ошибки под нагрузкой ($errors).');
    failed = true;
  }
  if (percentile(95) > 1000) {
    stdout.writeln('ПРОВАЛ: p95 больше секунды — приложение будет «висеть».');
    failed = true;
  }
  if (perMinute < options.targetPerMinute) {
    stdout.writeln(
      'ПРОВАЛ: пропускная способность $perMinute/мин меньше цели '
      '${options.targetPerMinute}/мин.',
    );
    failed = true;
  }

  if (failed) exit(1);
  stdout.writeln('Нагрузку держит.');
}

typedef _Options = ({
  String url,
  int concurrency,
  int requests,
  int targetPerMinute,
});

_Options _parseArgs(List<String> args) {
  var url = 'http://localhost:8182/';
  var rides = 200;
  var events = 1000;

  for (var i = 0; i < args.length - 1; i++) {
    switch (args[i]) {
      case '--url':
        url = args[i + 1];
      case '--rides':
        rides = int.tryParse(args[i + 1]) ?? rides;
      case '--events':
        events = int.tryParse(args[i + 1]) ?? events;
    }
  }

  return (
    url: url.endsWith('/') ? url : '$url/',
    concurrency: rides,
    requests: events,
    targetPerMinute: events,
  );
}
