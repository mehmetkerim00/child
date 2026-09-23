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

/// Строка списка: какого ребёнка привезут или заберут.
///
/// Учреждению не нужны адреса и телефоны семьи: только имя ребёнка,
/// время и кто везёт.
abstract class InstitutionChildRow implements _i1.SerializableModel {
  InstitutionChildRow._({
    required this.rideId,
    required this.childId,
    required this.childName,
    required this.plannedTime,
    this.driverName,
    this.handedOverAt,
    this.confirmedByInstitutionAt,
    this.absenceReason,
  });

  factory InstitutionChildRow({
    required int rideId,
    required int childId,
    required String childName,
    required String plannedTime,
    String? driverName,
    DateTime? handedOverAt,
    DateTime? confirmedByInstitutionAt,
    String? absenceReason,
  }) = _InstitutionChildRowImpl;

  factory InstitutionChildRow.fromJson(Map<String, dynamic> jsonSerialization) {
    return InstitutionChildRow(
      rideId: jsonSerialization['rideId'] as int,
      childId: jsonSerialization['childId'] as int,
      childName: jsonSerialization['childName'] as String,
      plannedTime: jsonSerialization['plannedTime'] as String,
      driverName: jsonSerialization['driverName'] as String?,
      handedOverAt: jsonSerialization['handedOverAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['handedOverAt'],
            ),
      confirmedByInstitutionAt:
          jsonSerialization['confirmedByInstitutionAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedByInstitutionAt'],
            ),
      absenceReason: jsonSerialization['absenceReason'] as String?,
    );
  }

  int rideId;

  int childId;

  String childName;

  String plannedTime;

  String? driverName;

  /// Уже привезли и передали.
  DateTime? handedOverAt;

  /// Учреждение подтвердило приём — независимое подтверждение передачи.
  DateTime? confirmedByInstitutionAt;

  /// Семья заранее предупредила, что сегодня не едет.
  String? absenceReason;

  /// Returns a shallow copy of this [InstitutionChildRow]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InstitutionChildRow copyWith({
    int? rideId,
    int? childId,
    String? childName,
    String? plannedTime,
    String? driverName,
    DateTime? handedOverAt,
    DateTime? confirmedByInstitutionAt,
    String? absenceReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InstitutionChildRow',
      'rideId': rideId,
      'childId': childId,
      'childName': childName,
      'plannedTime': plannedTime,
      if (driverName != null) 'driverName': driverName,
      if (handedOverAt != null) 'handedOverAt': handedOverAt?.toJson(),
      if (confirmedByInstitutionAt != null)
        'confirmedByInstitutionAt': confirmedByInstitutionAt?.toJson(),
      if (absenceReason != null) 'absenceReason': absenceReason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InstitutionChildRowImpl extends InstitutionChildRow {
  _InstitutionChildRowImpl({
    required int rideId,
    required int childId,
    required String childName,
    required String plannedTime,
    String? driverName,
    DateTime? handedOverAt,
    DateTime? confirmedByInstitutionAt,
    String? absenceReason,
  }) : super._(
         rideId: rideId,
         childId: childId,
         childName: childName,
         plannedTime: plannedTime,
         driverName: driverName,
         handedOverAt: handedOverAt,
         confirmedByInstitutionAt: confirmedByInstitutionAt,
         absenceReason: absenceReason,
       );

  /// Returns a shallow copy of this [InstitutionChildRow]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InstitutionChildRow copyWith({
    int? rideId,
    int? childId,
    String? childName,
    String? plannedTime,
    Object? driverName = _Undefined,
    Object? handedOverAt = _Undefined,
    Object? confirmedByInstitutionAt = _Undefined,
    Object? absenceReason = _Undefined,
  }) {
    return InstitutionChildRow(
      rideId: rideId ?? this.rideId,
      childId: childId ?? this.childId,
      childName: childName ?? this.childName,
      plannedTime: plannedTime ?? this.plannedTime,
      driverName: driverName is String? ? driverName : this.driverName,
      handedOverAt: handedOverAt is DateTime?
          ? handedOverAt
          : this.handedOverAt,
      confirmedByInstitutionAt: confirmedByInstitutionAt is DateTime?
          ? confirmedByInstitutionAt
          : this.confirmedByInstitutionAt,
      absenceReason: absenceReason is String?
          ? absenceReason
          : this.absenceReason,
    );
  }
}
