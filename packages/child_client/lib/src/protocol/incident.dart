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
import 'incident_severity.dart' as _i2;

/// Журнал инцидентов.
///
/// Разбор уважительный: удержание водителей критично (RESEARCH.md).
/// Запись фиксирует факт и решение, а не служит наказанием.
abstract class Incident implements _i1.SerializableModel {
  Incident._({
    this.id,
    this.driverId,
    this.rideId,
    this.familyId,
    required this.severity,
    required this.description,
    this.resolution,
    DateTime? createdAt,
    this.createdBy,
    this.resolvedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Incident({
    int? id,
    int? driverId,
    int? rideId,
    int? familyId,
    required _i2.IncidentSeverity severity,
    required String description,
    String? resolution,
    DateTime? createdAt,
    int? createdBy,
    DateTime? resolvedAt,
  }) = _IncidentImpl;

  factory Incident.fromJson(Map<String, dynamic> jsonSerialization) {
    return Incident(
      id: jsonSerialization['id'] as int?,
      driverId: jsonSerialization['driverId'] as int?,
      rideId: jsonSerialization['rideId'] as int?,
      familyId: jsonSerialization['familyId'] as int?,
      severity: _i2.IncidentSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      description: jsonSerialization['description'] as String,
      resolution: jsonSerialization['resolution'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdBy: jsonSerialization['createdBy'] as int?,
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? driverId;

  int? rideId;

  int? familyId;

  _i2.IncidentSeverity severity;

  /// Что случилось, словами.
  String description;

  /// Что решили и что сделали.
  String? resolution;

  DateTime createdAt;

  int? createdBy;

  DateTime? resolvedAt;

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Incident copyWith({
    int? id,
    int? driverId,
    int? rideId,
    int? familyId,
    _i2.IncidentSeverity? severity,
    String? description,
    String? resolution,
    DateTime? createdAt,
    int? createdBy,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Incident',
      if (id != null) 'id': id,
      if (driverId != null) 'driverId': driverId,
      if (rideId != null) 'rideId': rideId,
      if (familyId != null) 'familyId': familyId,
      'severity': severity.toJson(),
      'description': description,
      if (resolution != null) 'resolution': resolution,
      'createdAt': createdAt.toJson(),
      if (createdBy != null) 'createdBy': createdBy,
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IncidentImpl extends Incident {
  _IncidentImpl({
    int? id,
    int? driverId,
    int? rideId,
    int? familyId,
    required _i2.IncidentSeverity severity,
    required String description,
    String? resolution,
    DateTime? createdAt,
    int? createdBy,
    DateTime? resolvedAt,
  }) : super._(
         id: id,
         driverId: driverId,
         rideId: rideId,
         familyId: familyId,
         severity: severity,
         description: description,
         resolution: resolution,
         createdAt: createdAt,
         createdBy: createdBy,
         resolvedAt: resolvedAt,
       );

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Incident copyWith({
    Object? id = _Undefined,
    Object? driverId = _Undefined,
    Object? rideId = _Undefined,
    Object? familyId = _Undefined,
    _i2.IncidentSeverity? severity,
    String? description,
    Object? resolution = _Undefined,
    DateTime? createdAt,
    Object? createdBy = _Undefined,
    Object? resolvedAt = _Undefined,
  }) {
    return Incident(
      id: id is int? ? id : this.id,
      driverId: driverId is int? ? driverId : this.driverId,
      rideId: rideId is int? ? rideId : this.rideId,
      familyId: familyId is int? ? familyId : this.familyId,
      severity: severity ?? this.severity,
      description: description ?? this.description,
      resolution: resolution is String? ? resolution : this.resolution,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy is int? ? createdBy : this.createdBy,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}
