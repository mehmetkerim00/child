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
import 'application_status.dart' as _i2;

/// Анкета кандидата в водители.
///
/// Водители-няни — дефицитный ресурс и настоящий продукт (RESEARCH.md):
/// анкета заполняется с телефона, дальше её ведёт диспетчер по чек-листу.
abstract class DriverApplication implements _i1.SerializableModel {
  DriverApplication._({
    this.id,
    required this.fullName,
    required this.phone,
    required this.experienceWithChildren,
    required this.drivingYears,
    required this.carModel,
    required this.carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    this.comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    this.driverId,
    this.rejectedReason,
  }) : isFemale = isFemale ?? false,
       hasChildSeat = hasChildSeat ?? false,
       status = status ?? _i2.ApplicationStatus.submitted,
       createdAt = createdAt ?? DateTime.now();

  factory DriverApplication({
    int? id,
    required String fullName,
    required String phone,
    required String experienceWithChildren,
    required int drivingYears,
    required String carModel,
    required String carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    String? comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    int? driverId,
    String? rejectedReason,
  }) = _DriverApplicationImpl;

  factory DriverApplication.fromJson(Map<String, dynamic> jsonSerialization) {
    return DriverApplication(
      id: jsonSerialization['id'] as int?,
      fullName: jsonSerialization['fullName'] as String,
      phone: jsonSerialization['phone'] as String,
      experienceWithChildren:
          jsonSerialization['experienceWithChildren'] as String,
      drivingYears: jsonSerialization['drivingYears'] as int,
      carModel: jsonSerialization['carModel'] as String,
      carPlate: jsonSerialization['carPlate'] as String,
      isFemale: jsonSerialization['isFemale'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isFemale']),
      hasChildSeat: jsonSerialization['hasChildSeat'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['hasChildSeat']),
      comment: jsonSerialization['comment'] as String?,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.ApplicationStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      driverId: jsonSerialization['driverId'] as int?,
      rejectedReason: jsonSerialization['rejectedReason'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String fullName;

  String phone;

  /// Опыт работы с детьми: свои дети, садик, школа, секция.
  String experienceWithChildren;

  /// Водительский стаж в годах.
  int drivingYears;

  String carModel;

  String carPlate;

  bool isFemale;

  /// Есть ли детское кресло у кандидата.
  bool hasChildSeat;

  String? comment;

  _i2.ApplicationStatus status;

  DateTime createdAt;

  /// Водитель, созданный из этой анкеты после найма.
  int? driverId;

  String? rejectedReason;

  /// Returns a shallow copy of this [DriverApplication]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DriverApplication copyWith({
    int? id,
    String? fullName,
    String? phone,
    String? experienceWithChildren,
    int? drivingYears,
    String? carModel,
    String? carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    String? comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    int? driverId,
    String? rejectedReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DriverApplication',
      if (id != null) 'id': id,
      'fullName': fullName,
      'phone': phone,
      'experienceWithChildren': experienceWithChildren,
      'drivingYears': drivingYears,
      'carModel': carModel,
      'carPlate': carPlate,
      'isFemale': isFemale,
      'hasChildSeat': hasChildSeat,
      if (comment != null) 'comment': comment,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (driverId != null) 'driverId': driverId,
      if (rejectedReason != null) 'rejectedReason': rejectedReason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DriverApplicationImpl extends DriverApplication {
  _DriverApplicationImpl({
    int? id,
    required String fullName,
    required String phone,
    required String experienceWithChildren,
    required int drivingYears,
    required String carModel,
    required String carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    String? comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    int? driverId,
    String? rejectedReason,
  }) : super._(
         id: id,
         fullName: fullName,
         phone: phone,
         experienceWithChildren: experienceWithChildren,
         drivingYears: drivingYears,
         carModel: carModel,
         carPlate: carPlate,
         isFemale: isFemale,
         hasChildSeat: hasChildSeat,
         comment: comment,
         status: status,
         createdAt: createdAt,
         driverId: driverId,
         rejectedReason: rejectedReason,
       );

  /// Returns a shallow copy of this [DriverApplication]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DriverApplication copyWith({
    Object? id = _Undefined,
    String? fullName,
    String? phone,
    String? experienceWithChildren,
    int? drivingYears,
    String? carModel,
    String? carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    Object? comment = _Undefined,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    Object? driverId = _Undefined,
    Object? rejectedReason = _Undefined,
  }) {
    return DriverApplication(
      id: id is int? ? id : this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      experienceWithChildren:
          experienceWithChildren ?? this.experienceWithChildren,
      drivingYears: drivingYears ?? this.drivingYears,
      carModel: carModel ?? this.carModel,
      carPlate: carPlate ?? this.carPlate,
      isFemale: isFemale ?? this.isFemale,
      hasChildSeat: hasChildSeat ?? this.hasChildSeat,
      comment: comment is String? ? comment : this.comment,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      driverId: driverId is int? ? driverId : this.driverId,
      rejectedReason: rejectedReason is String?
          ? rejectedReason
          : this.rejectedReason,
    );
  }
}
