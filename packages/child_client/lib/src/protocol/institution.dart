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
import 'institution_type.dart' as _i2;

/// Сад, школа, секция или кружок.
abstract class Institution implements _i1.SerializableModel {
  Institution._({
    this.id,
    required this.type,
    required this.name,
    required this.address,
    this.lat,
    this.lng,
    this.contactPhone,
    required this.handoverCode,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Institution({
    int? id,
    required _i2.InstitutionType type,
    required String name,
    required String address,
    double? lat,
    double? lng,
    String? contactPhone,
    required String handoverCode,
    DateTime? createdAt,
  }) = _InstitutionImpl;

  factory Institution.fromJson(Map<String, dynamic> jsonSerialization) {
    return Institution(
      id: jsonSerialization['id'] as int?,
      type: _i2.InstitutionType.fromJson((jsonSerialization['type'] as String)),
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] as String,
      lat: (jsonSerialization['lat'] as num?)?.toDouble(),
      lng: (jsonSerialization['lng'] as num?)?.toDouble(),
      contactPhone: jsonSerialization['contactPhone'] as String?,
      handoverCode: jsonSerialization['handoverCode'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.InstitutionType type;

  String name;

  String address;

  double? lat;

  double? lng;

  String? contactPhone;

  /// Код учреждения для подтверждения передачи ребёнка.
  String handoverCode;

  DateTime createdAt;

  /// Returns a shallow copy of this [Institution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Institution copyWith({
    int? id,
    _i2.InstitutionType? type,
    String? name,
    String? address,
    double? lat,
    double? lng,
    String? contactPhone,
    String? handoverCode,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Institution',
      if (id != null) 'id': id,
      'type': type.toJson(),
      'name': name,
      'address': address,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (contactPhone != null) 'contactPhone': contactPhone,
      'handoverCode': handoverCode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InstitutionImpl extends Institution {
  _InstitutionImpl({
    int? id,
    required _i2.InstitutionType type,
    required String name,
    required String address,
    double? lat,
    double? lng,
    String? contactPhone,
    required String handoverCode,
    DateTime? createdAt,
  }) : super._(
         id: id,
         type: type,
         name: name,
         address: address,
         lat: lat,
         lng: lng,
         contactPhone: contactPhone,
         handoverCode: handoverCode,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Institution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Institution copyWith({
    Object? id = _Undefined,
    _i2.InstitutionType? type,
    String? name,
    String? address,
    Object? lat = _Undefined,
    Object? lng = _Undefined,
    Object? contactPhone = _Undefined,
    String? handoverCode,
    DateTime? createdAt,
  }) {
    return Institution(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      address: address ?? this.address,
      lat: lat is double? ? lat : this.lat,
      lng: lng is double? ? lng : this.lng,
      contactPhone: contactPhone is String? ? contactPhone : this.contactPhone,
      handoverCode: handoverCode ?? this.handoverCode,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
