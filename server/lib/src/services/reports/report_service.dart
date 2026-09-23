import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../clock.dart';

/// Отчёты владельцу.
///
/// Владельцу нужен ответ на два вопроса: сходится ли экономика и какие
/// маршруты её портят. Поэтому отчёт считается из тех же записей, по
/// которым работает сервис, — книги операций и статусов поездок. Никаких
/// отдельных «счётчиков», которые со временем разойдутся с реальностью.
class ReportService {
  ReportService({
    this.clock = const Clock(),
    this.smsPriceTenge = defaultSmsPriceTenge,
    this.blockPayTenge = defaultBlockPayTenge,
    this.perRideTenge = defaultPerRideTenge,
  });

  final Clock clock;

  /// Цена одной SMS. Реального шлюза ещё нет (MVP_PLAN §9), поэтому
  /// ставка задаётся снаружи, а по умолчанию берётся осторожная оценка.
  final int smsPriceTenge;

  /// Ставки водителю — те же, что в расчётах S13.
  final int blockPayTenge;
  final int perRideTenge;

  static const defaultSmsPriceTenge = 300;
  static const defaultBlockPayTenge = 10000;
  static const defaultPerRideTenge = 2000;

  /// Статусы, при которых поездка считается сорванной.
  static final _failedStatuses = {
    RideStatus.cancelledByFamily,
    RideStatus.cancelledNoDriver,
  };

  /// Полный отчёт за период. Даты — по Ашхабаду, а не по UTC.
  Future<OwnerReport> report(
    Session session, {
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    final from = AshgabatTime.dateOf(fromDate);
    final to = AshgabatTime.dateOf(toDate);

    final rides = await Ride.db.find(
      session,
      where: (r) => (r.date >= from) & (r.date <= to),
      orderBy: (r) => r.date,
    );
    final entries = await LedgerEntry.db.find(session);
    final outbox = await NotificationOutbox.db.find(
      session,
      where: (row) => row.channel.equals(NotificationChannel.sms),
    );

    final days = await _days(session, rides, entries, outbox, from, to);
    final drivers = await _drivers(session, rides);
    final routes = await _routes(session, rides, entries, outbox);

    final revenue = days.fold<int>(0, (sum, day) => sum + day.revenueTenge);
    final smsCost = days.fold<int>(0, (sum, day) => sum + day.smsCostTenge);

    // Гарантированная оплата блоков считается отдельно: на маршруты она
    // не разносится, но из кармана уходит так же, как всё остальное.
    final blockPay = drivers.fold<int>(
      0,
      (sum, load) => sum + load.blocks * blockPayTenge,
    );
    final ridePay = drivers.fold<int>(
      0,
      (sum, load) => sum + load.rides * perRideTenge,
    );
    final driverPay = blockPay + ridePay;

    // Сумма марж по маршрутам выглядит лучше реальной: в ней нет блоков.
    // Поэтому рядом всегда идёт вторая строка — уже с их стоимостью.
    final routeMargin = routes.fold<int>(
      0,
      (sum, route) => sum + route.marginTenge,
    );

    final completed = rides
        .where((ride) => ride.status == RideStatus.handedOver)
        .length;
    final completion = rides.isEmpty
        ? 100
        : (completed * 100 / rides.length).round();

    // Балансы семей: сколько денег сервис уже держит и сколько семей
    // ушли в минус — это будущие неоплаченные поездки.
    final balances = <int, int>{};
    for (final entry in entries) {
      balances[entry.familyId] =
          (balances[entry.familyId] ?? 0) + entry.amountTenge;
    }

    return OwnerReport(
      fromDate: from,
      toDate: to,
      days: days,
      drivers: drivers,
      routes: routes,
      familyBalanceTenge: balances.values.fold<int>(0, (a, b) => a + b),
      familiesInDebt: balances.values.where((value) => value < 0).length,
      revenueTenge: revenue,
      smsCostTenge: smsCost,
      driverPayTenge: driverPay,
      blockPayTenge: blockPay,
      routeMarginTenge: routeMargin,
      routeMarginWithBlocksTenge: routeMargin - blockPay,
      marginTenge: revenue - smsCost - driverPay,
      completionPercent: completion,
      emptyHours: _emptyHours(rides),
    );
  }

  /// Разбивка по дням.
  Future<List<DayStats>> _days(
    Session session,
    List<Ride> rides,
    List<LedgerEntry> entries,
    List<NotificationOutbox> outbox,
    DateTime from,
    DateTime to,
  ) async {
    final stats = <DayStats>[];

    for (var day = from; !day.isAfter(to); day = AshgabatTime.addDays(day, 1)) {
      final ofDay = rides.where((ride) => ride.date == day).toList();
      final rideIds = ofDay.map((ride) => ride.id).toSet();

      // Выручка — только фактические списания за поездки этого дня.
      final revenue = entries
          .where(
            (entry) =>
                entry.type == LedgerEntryType.rideCharge &&
                rideIds.contains(entry.rideId),
          )
          .fold<int>(0, (sum, entry) => sum - entry.amountTenge);

      final sms = outbox
          .where(
            (row) =>
                row.sentAt != null && AshgabatTime.dateOf(row.sentAt!) == day,
          )
          .length;

      stats.add(
        DayStats(
          date: day,
          planned: ofDay.length,
          completed: ofDay
              .where((ride) => ride.status == RideStatus.handedOver)
              .length,
          cancelled: ofDay
              .where((ride) => _failedStatuses.contains(ride.status))
              .length,
          revenueTenge: revenue,
          smsCount: sms,
          smsCostTenge: sms * smsPriceTenge,
          activeDrivers: ofDay
              .map((ride) => ride.driverId)
              .whereType<int>()
              .toSet()
              .length,
        ),
      );
    }
    return stats;
  }

  /// Загрузка водителей: кто перегружен, а у кого блок оплачен впустую.
  Future<List<DriverLoad>> _drivers(Session session, List<Ride> rides) async {
    final byDriver = <int, List<Ride>>{};
    for (final ride in rides) {
      final driverId = ride.driverId;
      if (driverId == null) continue;
      byDriver.putIfAbsent(driverId, () => []).add(ride);
    }

    final loads = <DriverLoad>[];
    for (final entry in byDriver.entries) {
      final driver = await Driver.db.findById(session, entry.key);
      if (driver == null) continue;

      final completed = entry.value
          .where((ride) => ride.status == RideStatus.handedOver)
          .toList();
      final blocks = <String>{
        for (final ride in completed)
          '${ride.date.toIso8601String()}:'
              '${int.parse(ride.plannedTime.split(':').first) < 12 ? 'm' : 'd'}',
      };

      loads.add(
        DriverLoad(
          driverId: driver.id!,
          driverName: driver.name,
          rides: completed.length,
          blocks: blocks.length,
          ridesPerBlock: blocks.isEmpty ? 0 : completed.length / blocks.length,
          failed: entry.value
              .where((ride) => _failedStatuses.contains(ride.status))
              .length,
        ),
      );
    }

    // Самые загруженные — сверху: с них начинается разговор о найме.
    loads.sort((a, b) => b.rides.compareTo(a.rides));
    return loads;
  }

  /// Экономика по маршрутам: видно, какие маршруты убыточны.
  Future<List<RouteEconomics>> _routes(
    Session session,
    List<Ride> rides,
    List<LedgerEntry> entries,
    List<NotificationOutbox> outbox,
  ) async {
    final byTemplate = <int, List<Ride>>{};
    for (final ride in rides) {
      final templateId = ride.templateId;
      if (templateId == null) continue;
      byTemplate.putIfAbsent(templateId, () => []).add(ride);
    }

    final result = <RouteEconomics>[];
    for (final entry in byTemplate.entries) {
      final template = await RouteTemplate.db.findById(session, entry.key);
      if (template == null) continue;
      final child = await Child.db.findById(session, template.childId);

      final rideIds = entry.value.map((ride) => ride.id).toSet();
      final completed = entry.value
          .where((ride) => ride.status == RideStatus.handedOver)
          .length;

      final revenue = entries
          .where(
            (row) =>
                row.type == LedgerEntryType.rideCharge &&
                rideIds.contains(row.rideId),
          )
          .fold<int>(0, (sum, row) => sum - row.amountTenge);

      final sms = outbox
          .where((row) => row.sentAt != null && rideIds.contains(row.rideId))
          .length;

      // Водителю маршрут стоит доплаты за поездку: гарантированный блок
      // делится между всеми маршрутами блока и на отдельный не вешается.
      final driverPay = completed * perRideTenge;
      final smsCost = sms * smsPriceTenge;

      final destination = template.direction == RouteDirection.toHome
          ? (template.toAddress ?? 'домой')
          : await _institutionName(session, template.toInstitutionId);

      result.add(
        RouteEconomics(
          routeId: template.id!,
          childName: child?.name ?? '',
          destination: destination,
          rides: completed,
          revenueTenge: revenue,
          smsCostTenge: smsCost,
          driverPayTenge: driverPay,
          marginTenge: revenue - smsCost - driverPay,
        ),
      );
    }

    // Убыточные — сверху: владельцу важно именно это.
    result.sort((a, b) => a.marginTenge.compareTo(b.marginTenge));
    return result;
  }

  Future<String> _institutionName(Session session, int? institutionId) async {
    if (institutionId == null) return '';
    final institution = await Institution.db.findById(session, institutionId);
    return institution?.name ?? '';
  }

  /// Часы, в которые за период не было ни одной поездки.
  ///
  /// Это свободное время водителей: в них можно ставить разовые заказы,
  /// иначе машина простаивает, а блок оплачен.
  List<int> _emptyHours(List<Ride> rides) {
    final busy = <int>{
      for (final ride in rides) int.parse(ride.plannedTime.split(':').first),
    };
    // Считаем только рабочий день: ночные часы пустые по определению.
    return [
      for (var hour = 7; hour <= 20; hour++)
        if (!busy.contains(hour)) hour,
    ];
  }

  /// Выгрузка отчёта таблицей.
  ///
  /// Формат — CSV с разделителем «;» и BOM: такой файл Excel открывает
  /// двойным щелчком, с русскими буквами и колонками на своих местах.
  /// Родной .xlsx потребовал бы тянуть ещё одну библиотеку ради того же
  /// результата.
  String toCsv(OwnerReport report) {
    final rows = <List<Object>>[
      ['Отчёт с', _date(report.fromDate), 'по', _date(report.toDate)],
      [],
      [
        'День',
        'Запланировано',
        'Довезли',
        'Сорвано',
        'Выручка, тенге',
        'SMS',
        'SMS, тенге',
        'Водителей',
      ],
      for (final day in report.days)
        [
          _date(day.date),
          day.planned,
          day.completed,
          day.cancelled,
          day.revenueTenge,
          day.smsCount,
          day.smsCostTenge,
          day.activeDrivers,
        ],
      [],
      ['Водитель', 'Поездок', 'Блоков', 'Поездок на блок', 'Сорвано'],
      for (final load in report.drivers)
        [
          load.driverName,
          load.rides,
          load.blocks,
          load.ridesPerBlock.toStringAsFixed(1),
          load.failed,
        ],
      [],
      [
        'Маршрут',
        'Куда',
        'Поездок',
        'Выручка',
        'SMS',
        'Водителю',
        'Маржа',
      ],
      for (final route in report.routes)
        [
          route.childName,
          route.destination,
          route.rides,
          route.revenueTenge,
          route.smsCostTenge,
          route.driverPayTenge,
          route.marginTenge,
        ],
      [],
      ['Сумма по маршрутам (без блоков)', report.routeMarginTenge],
      ['Оплата блоков', -report.blockPayTenge],
      ['Итого по маршрутам с учётом блоков', report.routeMarginWithBlocksTenge],
      [],
      ['Выручка', report.revenueTenge],
      ['SMS', report.smsCostTenge],
      ['Водителям', report.driverPayTenge],
      ['в том числе блоки', report.blockPayTenge],
      ['Валовая маржа', report.marginTenge],
      ['Выполняемость, %', report.completionPercent],
      ['Баланс семей', report.familyBalanceTenge],
      ['Семей в минусе', report.familiesInDebt],
    ];

    final text = rows.map((row) => row.map(_cell).join(';')).join('\r\n');
    // BOM: без него Excel читает файл как ANSI и портит кириллицу.
    return '﻿$text';
  }

  String _cell(Object value) {
    final text = '$value';
    return text.contains(';') || text.contains('"')
        ? '"${text.replaceAll('"', '""')}"'
        : text;
  }

  String _date(DateTime value) =>
      '${value.day.toString().padLeft(2, '0')}.'
      '${value.month.toString().padLeft(2, '0')}.${value.year}';
}
