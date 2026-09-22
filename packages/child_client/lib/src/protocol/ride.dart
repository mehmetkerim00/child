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
import 'ride_status.dart' as _i2;

/// Конкретная поездка на дату. Генерируется из шаблонов (S2).
abstract class Ride implements _i1.SerializableModel {
  Ride._({
    this.id,
    this.templateId,
    required this.childId,
    this.driverId,
    required this.date,
    required this.plannedTime,
    _i2.RideStatus? status,
    this.confirmedAt,
    DateTime? createdAt,
  }) : status = status ?? _i2.RideStatus.scheduled,
       createdAt = createdAt ?? DateTime.now();

  factory Ride({
    int? id,
    int? templateId,
    required int childId,
    int? driverId,
    required DateTime date,
    required String plannedTime,
    _i2.RideStatus? status,
    DateTime? confirmedAt,
    DateTime? createdAt,
  }) = _RideImpl;

  factory Ride.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ride(
      id: jsonSerialization['id'] as int?,
      templateId: jsonSerialization['templateId'] as int?,
      childId: jsonSerialization['childId'] as int,
      driverId: jsonSerialization['driverId'] as int?,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      plannedTime: jsonSerialization['plannedTime'] as String,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.RideStatus.fromJson((jsonSerialization['status'] as String)),
      confirmedAt: jsonSerialization['confirmedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? templateId;

  int childId;

  int? driverId;

  DateTime date;

  String plannedTime;

  _i2.RideStatus status;

  DateTime? confirmedAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [Ride]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ride copyWith({
    int? id,
    int? templateId,
    int? childId,
    int? driverId,
    DateTime? date,
    String? plannedTime,
    _i2.RideStatus? status,
    DateTime? confirmedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Ride',
      if (id != null) 'id': id,
      if (templateId != null) 'templateId': templateId,
      'childId': childId,
      if (driverId != null) 'driverId': driverId,
      'date': date.toJson(),
      'plannedTime': plannedTime,
      'status': status.toJson(),
      if (confirmedAt != null) 'confirmedAt': confirmedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideImpl extends Ride {
  _RideImpl({
    int? id,
    int? templateId,
    required int childId,
    int? driverId,
    required DateTime date,
    required String plannedTime,
    _i2.RideStatus? status,
    DateTime? confirmedAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         templateId: templateId,
         childId: childId,
         driverId: driverId,
         date: date,
         plannedTime: plannedTime,
         status: status,
         confirmedAt: confirmedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Ride]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Ride copyWith({
    Object? id = _Undefined,
    Object? templateId = _Undefined,
    int? childId,
    Object? driverId = _Undefined,
    DateTime? date,
    String? plannedTime,
    _i2.RideStatus? status,
    Object? confirmedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return Ride(
      id: id is int? ? id : this.id,
      templateId: templateId is int? ? templateId : this.templateId,
      childId: childId ?? this.childId,
      driverId: driverId is int? ? driverId : this.driverId,
      date: date ?? this.date,
      plannedTime: plannedTime ?? this.plannedTime,
      status: status ?? this.status,
      confirmedAt: confirmedAt is DateTime? ? confirmedAt : this.confirmedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
