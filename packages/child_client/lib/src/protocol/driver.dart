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
import 'vetting_status.dart' as _i2;

/// Водитель-няня. Аккаунт создаёт только диспетчер.
abstract class Driver implements _i1.SerializableModel {
  Driver._({
    this.id,
    required this.phone,
    required this.name,
    required this.carModel,
    required this.carPlate,
    this.experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    this.photoUrl,
    bool? active,
    DateTime? createdAt,
  }) : vettingStatus = vettingStatus ?? _i2.VettingStatus.pending,
       isFemale = isFemale ?? false,
       active = active ?? true,
       createdAt = createdAt ?? DateTime.now();

  factory Driver({
    int? id,
    required String phone,
    required String name,
    required String carModel,
    required String carPlate,
    String? experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    String? photoUrl,
    bool? active,
    DateTime? createdAt,
  }) = _DriverImpl;

  factory Driver.fromJson(Map<String, dynamic> jsonSerialization) {
    return Driver(
      id: jsonSerialization['id'] as int?,
      phone: jsonSerialization['phone'] as String,
      name: jsonSerialization['name'] as String,
      carModel: jsonSerialization['carModel'] as String,
      carPlate: jsonSerialization['carPlate'] as String,
      experienceNote: jsonSerialization['experienceNote'] as String?,
      vettingStatus: jsonSerialization['vettingStatus'] == null
          ? null
          : _i2.VettingStatus.fromJson(
              (jsonSerialization['vettingStatus'] as String),
            ),
      isFemale: jsonSerialization['isFemale'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isFemale']),
      photoUrl: jsonSerialization['photoUrl'] as String?,
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

  String phone;

  String name;

  String carModel;

  String carPlate;

  String? experienceNote;

  _i2.VettingStatus vettingStatus;

  bool isFemale;

  String? photoUrl;

  bool active;

  DateTime createdAt;

  /// Returns a shallow copy of this [Driver]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Driver copyWith({
    int? id,
    String? phone,
    String? name,
    String? carModel,
    String? carPlate,
    String? experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    String? photoUrl,
    bool? active,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Driver',
      if (id != null) 'id': id,
      'phone': phone,
      'name': name,
      'carModel': carModel,
      'carPlate': carPlate,
      if (experienceNote != null) 'experienceNote': experienceNote,
      'vettingStatus': vettingStatus.toJson(),
      'isFemale': isFemale,
      if (photoUrl != null) 'photoUrl': photoUrl,
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

class _DriverImpl extends Driver {
  _DriverImpl({
    int? id,
    required String phone,
    required String name,
    required String carModel,
    required String carPlate,
    String? experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    String? photoUrl,
    bool? active,
    DateTime? createdAt,
  }) : super._(
         id: id,
         phone: phone,
         name: name,
         carModel: carModel,
         carPlate: carPlate,
         experienceNote: experienceNote,
         vettingStatus: vettingStatus,
         isFemale: isFemale,
         photoUrl: photoUrl,
         active: active,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Driver]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Driver copyWith({
    Object? id = _Undefined,
    String? phone,
    String? name,
    String? carModel,
    String? carPlate,
    Object? experienceNote = _Undefined,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    Object? photoUrl = _Undefined,
    bool? active,
    DateTime? createdAt,
  }) {
    return Driver(
      id: id is int? ? id : this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      carModel: carModel ?? this.carModel,
      carPlate: carPlate ?? this.carPlate,
      experienceNote: experienceNote is String?
          ? experienceNote
          : this.experienceNote,
      vettingStatus: vettingStatus ?? this.vettingStatus,
      isFemale: isFemale ?? this.isFemale,
      photoUrl: photoUrl is String? ? photoUrl : this.photoUrl,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
