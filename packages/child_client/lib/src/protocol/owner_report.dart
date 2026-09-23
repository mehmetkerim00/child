/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'day_stats.dart' as _i2;
import 'driver_load.dart' as _i3;
import 'route_economics.dart' as _i4;
import 'package:child_client/src/protocol/protocol.dart' as _i5;

/// Отчёт владельцу за период.
abstract class OwnerReport implements _i1.SerializableModel {
  OwnerReport._({
    required this.fromDate,
    required this.toDate,
    required this.days,
    required this.drivers,
    required this.routes,
    required this.familyBalanceTenge,
    required this.familiesInDebt,
    required this.revenueTenge,
    required this.smsCostTenge,
    required this.driverPayTenge,
    required this.blockPayTenge,
    required this.routeMarginTenge,
    required this.routeMarginWithBlocksTenge,
    required this.marginTenge,
    required this.completionPercent,
    required this.emptyHours,
  });

  factory OwnerReport({
    required DateTime fromDate,
    required DateTime toDate,
    required List<_i2.DayStats> days,
    required List<_i3.DriverLoad> drivers,
    required List<_i4.RouteEconomics> routes,
    required int familyBalanceTenge,
    required int familiesInDebt,
    required int revenueTenge,
    required int smsCostTenge,
    required int driverPayTenge,
    required int blockPayTenge,
    required int routeMarginTenge,
    required int routeMarginWithBlocksTenge,
    required int marginTenge,
    required int completionPercent,
    required List<int> emptyHours,
  }) = _OwnerReportImpl;

  factory OwnerReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return OwnerReport(
      fromDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['fromDate'],
      ),
      toDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['toDate']),
      days: _i5.Protocol().deserialize<List<_i2.DayStats>>(
        jsonSerialization['days'],
      ),
      drivers: _i5.Protocol().deserialize<List<_i3.DriverLoad>>(
        jsonSerialization['drivers'],
      ),
      routes: _i5.Protocol().deserialize<List<_i4.RouteEconomics>>(
        jsonSerialization['routes'],
      ),
      familyBalanceTenge: jsonSerialization['familyBalanceTenge'] as int,
      familiesInDebt: jsonSerialization['familiesInDebt'] as int,
      revenueTenge: jsonSerialization['revenueTenge'] as int,
      smsCostTenge: jsonSerialization['smsCostTenge'] as int,
      driverPayTenge: jsonSerialization['driverPayTenge'] as int,
      blockPayTenge: jsonSerialization['blockPayTenge'] as int,
      routeMarginTenge: jsonSerialization['routeMarginTenge'] as int,
      routeMarginWithBlocksTenge:
          jsonSerialization['routeMarginWithBlocksTenge'] as int,
      marginTenge: jsonSerialization['marginTenge'] as int,
      completionPercent: jsonSerialization['completionPercent'] as int,
      emptyHours: _i5.Protocol().deserialize<List<int>>(
        jsonSerialization['emptyHours'],
      ),
    );
  }

  DateTime fromDate;

  DateTime toDate;

  List<_i2.DayStats> days;

  List<_i3.DriverLoad> drivers;

  List<_i4.RouteEconomics> routes;

  /// Сумма всех балансов семей: сколько денег сервис уже держит.
  int familyBalanceTenge;

  /// Сколько семей ушли в минус.
  int familiesInDebt;

  int revenueTenge;

  int smsCostTenge;

  int driverPayTenge;

  /// Гарантированная оплата блоков — часть driverPayTenge.
  ///
  /// Вынесена отдельно, потому что на маршруты она не разносится:
  /// блок оплачивается за время, а не за конкретный рейс.
  int blockPayTenge;

  /// Сумма марж по маршрутам — БЕЗ оплаты блоков.
  ///
  /// Само по себе это число выглядит лучше реального. Показывать его
  /// без следующей строки нельзя.
  int routeMarginTenge;

  /// Итого по маршрутам с учётом стоимости блоков: routeMargin − blockPay.
  ///
  /// Честный ответ на вопрос «окупаются ли маршруты»: гарантированную
  /// оплату блоков платим, даже если рейсов в блоке мало.
  int routeMarginWithBlocksTenge;

  int marginTenge;

  /// Доля доведённых до конца поездок, проценты.
  int completionPercent;

  /// Часы, в которые за период не было ни одной поездки (0–23).
  List<int> emptyHours;

  /// Returns a shallow copy of this [OwnerReport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OwnerReport copyWith({
    DateTime? fromDate,
    DateTime? toDate,
    List<_i2.DayStats>? days,
    List<_i3.DriverLoad>? drivers,
    List<_i4.RouteEconomics>? routes,
    int? familyBalanceTenge,
    int? familiesInDebt,
    int? revenueTenge,
    int? smsCostTenge,
    int? driverPayTenge,
    int? blockPayTenge,
    int? routeMarginTenge,
    int? routeMarginWithBlocksTenge,
    int? marginTenge,
    int? completionPercent,
    List<int>? emptyHours,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OwnerReport',
      'fromDate': fromDate.toJson(),
      'toDate': toDate.toJson(),
      'days': days.toJson(valueToJson: (v) => v.toJson()),
      'drivers': drivers.toJson(valueToJson: (v) => v.toJson()),
      'routes': routes.toJson(valueToJson: (v) => v.toJson()),
      'familyBalanceTenge': familyBalanceTenge,
      'familiesInDebt': familiesInDebt,
      'revenueTenge': revenueTenge,
      'smsCostTenge': smsCostTenge,
      'driverPayTenge': driverPayTenge,
      'blockPayTenge': blockPayTenge,
      'routeMarginTenge': routeMarginTenge,
      'routeMarginWithBlocksTenge': routeMarginWithBlocksTenge,
      'marginTenge': marginTenge,
      'completionPercent': completionPercent,
      'emptyHours': emptyHours.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _OwnerReportImpl extends OwnerReport {
  _OwnerReportImpl({
    required DateTime fromDate,
    required DateTime toDate,
    required List<_i2.DayStats> days,
    required List<_i3.DriverLoad> drivers,
    required List<_i4.RouteEconomics> routes,
    required int familyBalanceTenge,
    required int familiesInDebt,
    required int revenueTenge,
    required int smsCostTenge,
    required int driverPayTenge,
    required int blockPayTenge,
    required int routeMarginTenge,
    required int routeMarginWithBlocksTenge,
    required int marginTenge,
    required int completionPercent,
    required List<int> emptyHours,
  }) : super._(
         fromDate: fromDate,
         toDate: toDate,
         days: days,
         drivers: drivers,
         routes: routes,
         familyBalanceTenge: familyBalanceTenge,
         familiesInDebt: familiesInDebt,
         revenueTenge: revenueTenge,
         smsCostTenge: smsCostTenge,
         driverPayTenge: driverPayTenge,
         blockPayTenge: blockPayTenge,
         routeMarginTenge: routeMarginTenge,
         routeMarginWithBlocksTenge: routeMarginWithBlocksTenge,
         marginTenge: marginTenge,
         completionPercent: completionPercent,
         emptyHours: emptyHours,
       );

  /// Returns a shallow copy of this [OwnerReport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OwnerReport copyWith({
    DateTime? fromDate,
    DateTime? toDate,
    List<_i2.DayStats>? days,
    List<_i3.DriverLoad>? drivers,
    List<_i4.RouteEconomics>? routes,
    int? familyBalanceTenge,
    int? familiesInDebt,
    int? revenueTenge,
    int? smsCostTenge,
    int? driverPayTenge,
    int? blockPayTenge,
    int? routeMarginTenge,
    int? routeMarginWithBlocksTenge,
    int? marginTenge,
    int? completionPercent,
    List<int>? emptyHours,
  }) {
    return OwnerReport(
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      days: days ?? this.days.map((e0) => e0.copyWith()).toList(),
      drivers: drivers ?? this.drivers.map((e0) => e0.copyWith()).toList(),
      routes: routes ?? this.routes.map((e0) => e0.copyWith()).toList(),
      familyBalanceTenge: familyBalanceTenge ?? this.familyBalanceTenge,
      familiesInDebt: familiesInDebt ?? this.familiesInDebt,
      revenueTenge: revenueTenge ?? this.revenueTenge,
      smsCostTenge: smsCostTenge ?? this.smsCostTenge,
      driverPayTenge: driverPayTenge ?? this.driverPayTenge,
      blockPayTenge: blockPayTenge ?? this.blockPayTenge,
      routeMarginTenge: routeMarginTenge ?? this.routeMarginTenge,
      routeMarginWithBlocksTenge:
          routeMarginWithBlocksTenge ?? this.routeMarginWithBlocksTenge,
      marginTenge: marginTenge ?? this.marginTenge,
      completionPercent: completionPercent ?? this.completionPercent,
      emptyHours: emptyHours ?? this.emptyHours.map((e0) => e0).toList(),
    );
  }
}
