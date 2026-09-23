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

/// Сводка за один день. Не хранится в базе — считается на лету.
abstract class DayStats implements _i1.SerializableModel {
  DayStats._({
    required this.date,
    required this.planned,
    required this.completed,
    required this.cancelled,
    required this.revenueTenge,
    required this.smsCount,
    required this.smsCostTenge,
    required this.activeDrivers,
  });

  factory DayStats({
    required DateTime date,
    required int planned,
    required int completed,
    required int cancelled,
    required int revenueTenge,
    required int smsCount,
    required int smsCostTenge,
    required int activeDrivers,
  }) = _DayStatsImpl;

  factory DayStats.fromJson(Map<String, dynamic> jsonSerialization) {
    return DayStats(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      planned: jsonSerialization['planned'] as int,
      completed: jsonSerialization['completed'] as int,
      cancelled: jsonSerialization['cancelled'] as int,
      revenueTenge: jsonSerialization['revenueTenge'] as int,
      smsCount: jsonSerialization['smsCount'] as int,
      smsCostTenge: jsonSerialization['smsCostTenge'] as int,
      activeDrivers: jsonSerialization['activeDrivers'] as int,
    );
  }

  DateTime date;

  /// Сколько поездок было запланировано на этот день.
  int planned;

  /// Сколько довезли до конца (ребёнок передан).
  int completed;

  /// Сколько сорвалось: отмены семьёй, водителем и «без водителя».
  int cancelled;

  /// Выручка за день, тенге (только фактические списания).
  int revenueTenge;

  /// Сколько SMS ушло за день.
  int smsCount;

  /// Во сколько эти SMS обошлись, тенге.
  int smsCostTenge;

  /// Сколько водителей реально работало в этот день.
  int activeDrivers;

  /// Returns a shallow copy of this [DayStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DayStats copyWith({
    DateTime? date,
    int? planned,
    int? completed,
    int? cancelled,
    int? revenueTenge,
    int? smsCount,
    int? smsCostTenge,
    int? activeDrivers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DayStats',
      'date': date.toJson(),
      'planned': planned,
      'completed': completed,
      'cancelled': cancelled,
      'revenueTenge': revenueTenge,
      'smsCount': smsCount,
      'smsCostTenge': smsCostTenge,
      'activeDrivers': activeDrivers,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DayStatsImpl extends DayStats {
  _DayStatsImpl({
    required DateTime date,
    required int planned,
    required int completed,
    required int cancelled,
    required int revenueTenge,
    required int smsCount,
    required int smsCostTenge,
    required int activeDrivers,
  }) : super._(
         date: date,
         planned: planned,
         completed: completed,
         cancelled: cancelled,
         revenueTenge: revenueTenge,
         smsCount: smsCount,
         smsCostTenge: smsCostTenge,
         activeDrivers: activeDrivers,
       );

  /// Returns a shallow copy of this [DayStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DayStats copyWith({
    DateTime? date,
    int? planned,
    int? completed,
    int? cancelled,
    int? revenueTenge,
    int? smsCount,
    int? smsCostTenge,
    int? activeDrivers,
  }) {
    return DayStats(
      date: date ?? this.date,
      planned: planned ?? this.planned,
      completed: completed ?? this.completed,
      cancelled: cancelled ?? this.cancelled,
      revenueTenge: revenueTenge ?? this.revenueTenge,
      smsCount: smsCount ?? this.smsCount,
      smsCostTenge: smsCostTenge ?? this.smsCostTenge,
      activeDrivers: activeDrivers ?? this.activeDrivers,
    );
  }
}
