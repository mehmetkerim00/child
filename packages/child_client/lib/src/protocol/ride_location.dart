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

/// Точка трека поездки.
///
/// Пишется только во время активной поездки (en_route → handed_over)
/// и хранится не дольше 30 дней: это данные о перемещении ребёнка.
abstract class RideLocation implements _i1.SerializableModel {
  RideLocation._({
    this.id,
    required this.rideId,
    required this.at,
    required this.lat,
    required this.lng,
    this.speedKmh,
    this.accuracyM,
  });

  factory RideLocation({
    int? id,
    required int rideId,
    required DateTime at,
    required double lat,
    required double lng,
    double? speedKmh,
    double? accuracyM,
  }) = _RideLocationImpl;

  factory RideLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideLocation(
      id: jsonSerialization['id'] as int?,
      rideId: jsonSerialization['rideId'] as int,
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
      lat: (jsonSerialization['lat'] as num).toDouble(),
      lng: (jsonSerialization['lng'] as num).toDouble(),
      speedKmh: (jsonSerialization['speedKmh'] as num?)?.toDouble(),
      accuracyM: (jsonSerialization['accuracyM'] as num?)?.toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int rideId;

  DateTime at;

  double lat;

  double lng;

  /// Скорость в км/ч, если устройство её дало.
  double? speedKmh;

  /// Точность определения в метрах.
  double? accuracyM;

  /// Returns a shallow copy of this [RideLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideLocation copyWith({
    int? id,
    int? rideId,
    DateTime? at,
    double? lat,
    double? lng,
    double? speedKmh,
    double? accuracyM,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideLocation',
      if (id != null) 'id': id,
      'rideId': rideId,
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

class _RideLocationImpl extends RideLocation {
  _RideLocationImpl({
    int? id,
    required int rideId,
    required DateTime at,
    required double lat,
    required double lng,
    double? speedKmh,
    double? accuracyM,
  }) : super._(
         id: id,
         rideId: rideId,
         at: at,
         lat: lat,
         lng: lng,
         speedKmh: speedKmh,
         accuracyM: accuracyM,
       );

  /// Returns a shallow copy of this [RideLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideLocation copyWith({
    Object? id = _Undefined,
    int? rideId,
    DateTime? at,
    double? lat,
    double? lng,
    Object? speedKmh = _Undefined,
    Object? accuracyM = _Undefined,
  }) {
    return RideLocation(
      id: id is int? ? id : this.id,
      rideId: rideId ?? this.rideId,
      at: at ?? this.at,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      speedKmh: speedKmh is double? ? speedKmh : this.speedKmh,
      accuracyM: accuracyM is double? ? accuracyM : this.accuracyM,
    );
  }
}
