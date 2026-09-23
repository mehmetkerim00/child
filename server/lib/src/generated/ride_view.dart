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
import 'ride.dart' as _i2;
import 'ride_seat.dart' as _i3;
import 'package:child_server/src/generated/protocol.dart' as _i4;

/// Поездка вместе с данными, которые нужны на экране,
/// чтобы приложение не делало лишних запросов.
abstract class RideView
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RideView._({
    required this.ride,
    required this.childName,
    required this.codeWord,
    required this.fromAddress,
    required this.toName,
    this.driverName,
    int? childrenInCar,
    this.seats,
  }) : childrenInCar = childrenInCar ?? 1;

  factory RideView({
    required _i2.Ride ride,
    required String childName,
    required String codeWord,
    required String fromAddress,
    required String toName,
    String? driverName,
    int? childrenInCar,
    List<_i3.RideSeat>? seats,
  }) = _RideViewImpl;

  factory RideView.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideView(
      ride: _i4.Protocol().deserialize<_i2.Ride>(jsonSerialization['ride']),
      childName: jsonSerialization['childName'] as String,
      codeWord: jsonSerialization['codeWord'] as String,
      fromAddress: jsonSerialization['fromAddress'] as String,
      toName: jsonSerialization['toName'] as String,
      driverName: jsonSerialization['driverName'] as String?,
      childrenInCar: jsonSerialization['childrenInCar'] as int?,
      seats: jsonSerialization['seats'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.RideSeat>>(
              jsonSerialization['seats'],
            ),
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

  /// Сколько детей едет в машине. Родителю видно только число:
  /// чужие имена и адреса не раскрываются.
  int childrenInCar;

  /// Места поездки. Родителю сюда попадает только его ребёнок.
  List<_i3.RideSeat>? seats;

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
    int? childrenInCar,
    List<_i3.RideSeat>? seats,
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
      'childrenInCar': childrenInCar,
      if (seats != null) 'seats': seats?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RideView',
      'ride': ride.toJsonForProtocol(),
      'childName': childName,
      'codeWord': codeWord,
      'fromAddress': fromAddress,
      'toName': toName,
      if (driverName != null) 'driverName': driverName,
      'childrenInCar': childrenInCar,
      if (seats != null)
        'seats': seats?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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
    int? childrenInCar,
    List<_i3.RideSeat>? seats,
  }) : super._(
         ride: ride,
         childName: childName,
         codeWord: codeWord,
         fromAddress: fromAddress,
         toName: toName,
         driverName: driverName,
         childrenInCar: childrenInCar,
         seats: seats,
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
    int? childrenInCar,
    Object? seats = _Undefined,
  }) {
    return RideView(
      ride: ride ?? this.ride.copyWith(),
      childName: childName ?? this.childName,
      codeWord: codeWord ?? this.codeWord,
      fromAddress: fromAddress ?? this.fromAddress,
      toName: toName ?? this.toName,
      driverName: driverName is String? ? driverName : this.driverName,
      childrenInCar: childrenInCar ?? this.childrenInCar,
      seats: seats is List<_i3.RideSeat>?
          ? seats
          : this.seats?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
