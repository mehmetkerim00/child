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

/// Точка, отправленная приложением водителя.
///
/// Приложение копит точки и шлёт пачкой: так экономится батарея и трафик.
abstract class RideLocationPoint
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RideLocationPoint._({
    required this.at,
    required this.lat,
    required this.lng,
    this.speedKmh,
    this.accuracyM,
  });

  factory RideLocationPoint({
    required DateTime at,
    required double lat,
    required double lng,
    double? speedKmh,
    double? accuracyM,
  }) = _RideLocationPointImpl;

  factory RideLocationPoint.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideLocationPoint(
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
      lat: (jsonSerialization['lat'] as num).toDouble(),
      lng: (jsonSerialization['lng'] as num).toDouble(),
      speedKmh: (jsonSerialization['speedKmh'] as num?)?.toDouble(),
      accuracyM: (jsonSerialization['accuracyM'] as num?)?.toDouble(),
    );
  }

  DateTime at;

  double lat;

  double lng;

  double? speedKmh;

  double? accuracyM;

  /// Returns a shallow copy of this [RideLocationPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideLocationPoint copyWith({
    DateTime? at,
    double? lat,
    double? lng,
    double? speedKmh,
    double? accuracyM,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideLocationPoint',
      'at': at.toJson(),
      'lat': lat,
      'lng': lng,
      if (speedKmh != null) 'speedKmh': speedKmh,
      if (accuracyM != null) 'accuracyM': accuracyM,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RideLocationPoint',
      'at': at.toJson(),
      'lat': lat,
      'lng': lng,
      if (speedKmh != null) 'speedKmh': speedKmh,
      if (accuracyM != null) 'accuracyM': accuracyM,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideLocationPointImpl extends RideLocationPoint {
  _RideLocationPointImpl({
    required DateTime at,
    required double lat,
    required double lng,
    double? speedKmh,
    double? accuracyM,
  }) : super._(
         at: at,
         lat: lat,
         lng: lng,
         speedKmh: speedKmh,
         accuracyM: accuracyM,
       );

  /// Returns a shallow copy of this [RideLocationPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideLocationPoint copyWith({
    DateTime? at,
    double? lat,
    double? lng,
    Object? speedKmh = _Undefined,
    Object? accuracyM = _Undefined,
  }) {
    return RideLocationPoint(
      at: at ?? this.at,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      speedKmh: speedKmh is double? ? speedKmh : this.speedKmh,
      accuracyM: accuracyM is double? ? accuracyM : this.accuracyM,
    );
  }
}
