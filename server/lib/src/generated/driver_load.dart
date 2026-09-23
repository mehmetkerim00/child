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

import 'package:serverpod/serverpod.dart' as _i1;

/// Загрузка одного водителя за период.
abstract class DriverLoad
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DriverLoad._({
    required this.driverId,
    required this.driverName,
    required this.rides,
    required this.blocks,
    required this.ridesPerBlock,
    required this.failed,
  });

  factory DriverLoad({
    required int driverId,
    required String driverName,
    required int rides,
    required int blocks,
    required double ridesPerBlock,
    required int failed,
  }) = _DriverLoadImpl;

  factory DriverLoad.fromJson(Map<String, dynamic> jsonSerialization) {
    return DriverLoad(
      driverId: jsonSerialization['driverId'] as int,
      driverName: jsonSerialization['driverName'] as String,
      rides: jsonSerialization['rides'] as int,
      blocks: jsonSerialization['blocks'] as int,
      ridesPerBlock: (jsonSerialization['ridesPerBlock'] as num).toDouble(),
      failed: jsonSerialization['failed'] as int,
    );
  }

  int driverId;

  String driverName;

  /// Завершённые поездки.
  int rides;

  /// Оплачиваемые блоки (утро/день).
  int blocks;

  /// Поездок на блок: меньше одной — блок оплачен почти впустую.
  double ridesPerBlock;

  /// Сорванные поездки: отказы и неявки.
  int failed;

  /// Returns a shallow copy of this [DriverLoad]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DriverLoad copyWith({
    int? driverId,
    String? driverName,
    int? rides,
    int? blocks,
    double? ridesPerBlock,
    int? failed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DriverLoad',
      'driverId': driverId,
      'driverName': driverName,
      'rides': rides,
      'blocks': blocks,
      'ridesPerBlock': ridesPerBlock,
      'failed': failed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DriverLoad',
      'driverId': driverId,
      'driverName': driverName,
      'rides': rides,
      'blocks': blocks,
      'ridesPerBlock': ridesPerBlock,
      'failed': failed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DriverLoadImpl extends DriverLoad {
  _DriverLoadImpl({
    required int driverId,
    required String driverName,
    required int rides,
    required int blocks,
    required double ridesPerBlock,
    required int failed,
  }) : super._(
         driverId: driverId,
         driverName: driverName,
         rides: rides,
         blocks: blocks,
         ridesPerBlock: ridesPerBlock,
         failed: failed,
       );

  /// Returns a shallow copy of this [DriverLoad]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DriverLoad copyWith({
    int? driverId,
    String? driverName,
    int? rides,
    int? blocks,
    double? ridesPerBlock,
    int? failed,
  }) {
    return DriverLoad(
      driverId: driverId ?? this.driverId,
      driverName: driverName ?? this.driverName,
      rides: rides ?? this.rides,
      blocks: blocks ?? this.blocks,
      ridesPerBlock: ridesPerBlock ?? this.ridesPerBlock,
      failed: failed ?? this.failed,
    );
  }
}
