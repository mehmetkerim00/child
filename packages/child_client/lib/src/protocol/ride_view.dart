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
import 'ride.dart' as _i2;
import 'package:child_client/src/protocol/protocol.dart' as _i3;

/// Поездка вместе с данными, которые нужны на экране,
/// чтобы приложение не делало лишних запросов.
abstract class RideView implements _i1.SerializableModel {
  RideView._({
    required this.ride,
    required this.childName,
    required this.codeWord,
    required this.fromAddress,
    required this.toName,
    this.driverName,
  });

  factory RideView({
    required _i2.Ride ride,
    required String childName,
    required String codeWord,
    required String fromAddress,
    required String toName,
    String? driverName,
  }) = _RideViewImpl;

  factory RideView.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideView(
      ride: _i3.Protocol().deserialize<_i2.Ride>(jsonSerialization['ride']),
      childName: jsonSerialization['childName'] as String,
      codeWord: jsonSerialization['codeWord'] as String,
      fromAddress: jsonSerialization['fromAddress'] as String,
      toName: jsonSerialization['toName'] as String,
      driverName: jsonSerialization['driverName'] as String?,
    );
  }

  _i2.Ride ride;

  String childName;

  /// Кодовое слово семьи — водитель называет его при посадке.
  String codeWord;

  String fromAddress;

  /// Куда везём: название учреждения или адрес.
  String toName;

  String? driverName;

  /// Returns a shallow copy of this [RideView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideView copyWith({
    _i2.Ride? ride,
    String? childName,
    String? codeWord,
    String? fromAddress,
    String? toName,
    String? driverName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideView',
      'ride': ride.toJson(),
      'childName': childName,
      'codeWord': codeWord,
      'fromAddress': fromAddress,
      'toName': toName,
      if (driverName != null) 'driverName': driverName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideViewImpl extends RideView {
  _RideViewImpl({
    required _i2.Ride ride,
    required String childName,
    required String codeWord,
    required String fromAddress,
    required String toName,
    String? driverName,
  }) : super._(
         ride: ride,
         childName: childName,
         codeWord: codeWord,
         fromAddress: fromAddress,
         toName: toName,
         driverName: driverName,
       );

  /// Returns a shallow copy of this [RideView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideView copyWith({
    _i2.Ride? ride,
    String? childName,
    String? codeWord,
    String? fromAddress,
    String? toName,
    Object? driverName = _Undefined,
  }) {
    return RideView(
      ride: ride ?? this.ride.copyWith(),
      childName: childName ?? this.childName,
      codeWord: codeWord ?? this.codeWord,
      fromAddress: fromAddress ?? this.fromAddress,
      toName: toName ?? this.toName,
      driverName: driverName is String? ? driverName : this.driverName,
    );
  }
}
