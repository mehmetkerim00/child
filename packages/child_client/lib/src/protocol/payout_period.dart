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

/// Расчёт водителю за период.
///
/// Оплата по блокам: утренний и дневной блок оплачиваются гарантированно,
/// даже если поездок в блоке оказалось меньше — иначе водителя не удержать.
abstract class PayoutPeriod implements _i1.SerializableModel {
  PayoutPeriod._({
    this.id,
    required this.driverId,
    required this.fromDate,
    required this.toDate,
    required this.blocks,
    required this.blockPayTenge,
    required this.ridePayTenge,
    required this.totalTenge,
    this.paidAt,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory PayoutPeriod({
    int? id,
    required int driverId,
    required DateTime fromDate,
    required DateTime toDate,
    required int blocks,
    required int blockPayTenge,
    required int ridePayTenge,
    required int totalTenge,
    DateTime? paidAt,
    DateTime? createdAt,
  }) = _PayoutPeriodImpl;

  factory PayoutPeriod.fromJson(Map<String, dynamic> jsonSerialization) {
    return PayoutPeriod(
      id: jsonSerialization['id'] as int?,
      driverId: jsonSerialization['driverId'] as int,
      fromDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['fromDate'],
      ),
      toDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['toDate']),
      blocks: jsonSerialization['blocks'] as int,
      blockPayTenge: jsonSerialization['blockPayTenge'] as int,
      ridePayTenge: jsonSerialization['ridePayTenge'] as int,
      totalTenge: jsonSerialization['totalTenge'] as int,
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int driverId;

  DateTime fromDate;

  DateTime toDate;

  /// Сколько блоков отработано.
  int blocks;

  /// Гарантированная оплата за блоки, тенге.
  int blockPayTenge;

  /// Доплата за поездки сверх блоков, тенге.
  int ridePayTenge;

  /// Итого к выплате, тенге.
  int totalTenge;

  DateTime? paidAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [PayoutPeriod]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PayoutPeriod copyWith({
    int? id,
    int? driverId,
    DateTime? fromDate,
    DateTime? toDate,
    int? blocks,
    int? blockPayTenge,
    int? ridePayTenge,
    int? totalTenge,
    DateTime? paidAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PayoutPeriod',
      if (id != null) 'id': id,
      'driverId': driverId,
      'fromDate': fromDate.toJson(),
      'toDate': toDate.toJson(),
      'blocks': blocks,
      'blockPayTenge': blockPayTenge,
      'ridePayTenge': ridePayTenge,
      'totalTenge': totalTenge,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PayoutPeriodImpl extends PayoutPeriod {
  _PayoutPeriodImpl({
    int? id,
    required int driverId,
    required DateTime fromDate,
    required DateTime toDate,
    required int blocks,
    required int blockPayTenge,
    required int ridePayTenge,
    required int totalTenge,
    DateTime? paidAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         driverId: driverId,
         fromDate: fromDate,
         toDate: toDate,
         blocks: blocks,
         blockPayTenge: blockPayTenge,
         ridePayTenge: ridePayTenge,
         totalTenge: totalTenge,
         paidAt: paidAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PayoutPeriod]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PayoutPeriod copyWith({
    Object? id = _Undefined,
    int? driverId,
    DateTime? fromDate,
    DateTime? toDate,
    int? blocks,
    int? blockPayTenge,
    int? ridePayTenge,
    int? totalTenge,
    Object? paidAt = _Undefined,
    DateTime? createdAt,
  }) {
    return PayoutPeriod(
      id: id is int? ? id : this.id,
      driverId: driverId ?? this.driverId,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      blocks: blocks ?? this.blocks,
      blockPayTenge: blockPayTenge ?? this.blockPayTenge,
      ridePayTenge: ridePayTenge ?? this.ridePayTenge,
      totalTenge: totalTenge ?? this.totalTenge,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
