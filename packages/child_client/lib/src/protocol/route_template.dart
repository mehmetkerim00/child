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
import 'route_direction.dart' as _i2;
import 'package:child_client/src/protocol/protocol.dart' as _i3;

/// Шаблон регулярного маршрута: заявку создаёт родитель, активирует диспетчер.
abstract class RouteTemplate implements _i1.SerializableModel {
  RouteTemplate._({
    this.id,
    required this.childId,
    required this.weekdays,
    required this.pickupTime,
    required this.fromAddress,
    this.fromLat,
    this.fromLng,
    this.toInstitutionId,
    this.toAddress,
    required this.direction,
    this.driverId,
    int? pricePerRide,
    bool? active,
    DateTime? createdAt,
  }) : pricePerRide = pricePerRide ?? 0,
       active = active ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory RouteTemplate({
    int? id,
    required int childId,
    required List<int> weekdays,
    required String pickupTime,
    required String fromAddress,
    double? fromLat,
    double? fromLng,
    int? toInstitutionId,
    String? toAddress,
    required _i2.RouteDirection direction,
    int? driverId,
    int? pricePerRide,
    bool? active,
    DateTime? createdAt,
  }) = _RouteTemplateImpl;

  factory RouteTemplate.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteTemplate(
      id: jsonSerialization['id'] as int?,
      childId: jsonSerialization['childId'] as int,
      weekdays: _i3.Protocol().deserialize<List<int>>(
        jsonSerialization['weekdays'],
      ),
      pickupTime: jsonSerialization['pickupTime'] as String,
      fromAddress: jsonSerialization['fromAddress'] as String,
      fromLat: (jsonSerialization['fromLat'] as num?)?.toDouble(),
      fromLng: (jsonSerialization['fromLng'] as num?)?.toDouble(),
      toInstitutionId: jsonSerialization['toInstitutionId'] as int?,
      toAddress: jsonSerialization['toAddress'] as String?,
      direction: _i2.RouteDirection.fromJson(
        (jsonSerialization['direction'] as String),
      ),
      driverId: jsonSerialization['driverId'] as int?,
      pricePerRide: jsonSerialization['pricePerRide'] as int?,
      active: jsonSerialization['active'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['active']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int childId;

  /// Дни недели: 1 — понедельник … 7 — воскресенье.
  List<int> weekdays;

  /// Время подачи в формате HH:mm (местное время Ашхабада).
  String pickupTime;

  String fromAddress;

  double? fromLat;

  double? fromLng;

  int? toInstitutionId;

  String? toAddress;

  _i2.RouteDirection direction;

  int? driverId;

  int pricePerRide;

  /// false — заявка ждёт активации диспетчером.
  bool active;

  DateTime createdAt;

  /// Returns a shallow copy of this [RouteTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteTemplate copyWith({
    int? id,
    int? childId,
    List<int>? weekdays,
    String? pickupTime,
    String? fromAddress,
    double? fromLat,
    double? fromLng,
    int? toInstitutionId,
    String? toAddress,
    _i2.RouteDirection? direction,
    int? driverId,
    int? pricePerRide,
    bool? active,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RouteTemplate',
      if (id != null) 'id': id,
      'childId': childId,
      'weekdays': weekdays.toJson(),
      'pickupTime': pickupTime,
      'fromAddress': fromAddress,
      if (fromLat != null) 'fromLat': fromLat,
      if (fromLng != null) 'fromLng': fromLng,
      if (toInstitutionId != null) 'toInstitutionId': toInstitutionId,
      if (toAddress != null) 'toAddress': toAddress,
      'direction': direction.toJson(),
      if (driverId != null) 'driverId': driverId,
      'pricePerRide': pricePerRide,
      'active': active,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteTemplateImpl extends RouteTemplate {
  _RouteTemplateImpl({
    int? id,
    required int childId,
    required List<int> weekdays,
    required String pickupTime,
    required String fromAddress,
    double? fromLat,
    double? fromLng,
    int? toInstitutionId,
    String? toAddress,
    required _i2.RouteDirection direction,
    int? driverId,
    int? pricePerRide,
    bool? active,
    DateTime? createdAt,
  }) : super._(
         id: id,
         childId: childId,
         weekdays: weekdays,
         pickupTime: pickupTime,
         fromAddress: fromAddress,
         fromLat: fromLat,
         fromLng: fromLng,
         toInstitutionId: toInstitutionId,
         toAddress: toAddress,
         direction: direction,
         driverId: driverId,
         pricePerRide: pricePerRide,
         active: active,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RouteTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteTemplate copyWith({
    Object? id = _Undefined,
    int? childId,
    List<int>? weekdays,
    String? pickupTime,
    String? fromAddress,
    Object? fromLat = _Undefined,
    Object? fromLng = _Undefined,
    Object? toInstitutionId = _Undefined,
    Object? toAddress = _Undefined,
    _i2.RouteDirection? direction,
    Object? driverId = _Undefined,
    int? pricePerRide,
    bool? active,
    DateTime? createdAt,
  }) {
    return RouteTemplate(
      id: id is int? ? id : this.id,
      childId: childId ?? this.childId,
      weekdays: weekdays ?? this.weekdays.map((e0) => e0).toList(),
      pickupTime: pickupTime ?? this.pickupTime,
      fromAddress: fromAddress ?? this.fromAddress,
      fromLat: fromLat is double? ? fromLat : this.fromLat,
      fromLng: fromLng is double? ? fromLng : this.fromLng,
      toInstitutionId: toInstitutionId is int?
          ? toInstitutionId
          : this.toInstitutionId,
      toAddress: toAddress is String? ? toAddress : this.toAddress,
      direction: direction ?? this.direction,
      driverId: driverId is int? ? driverId : this.driverId,
      pricePerRide: pricePerRide ?? this.pricePerRide,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
