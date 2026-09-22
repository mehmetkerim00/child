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
import 'parent_role.dart' as _i2;

/// Родитель. Оба родителя видят поездки своих детей.
abstract class Parent implements _i1.SerializableModel {
  Parent._({
    this.id,
    required this.familyId,
    required this.phone,
    required this.name,
    _i2.ParentRole? role,
    DateTime? createdAt,
  }) : role = role ?? _i2.ParentRole.owner,
       createdAt = createdAt ?? DateTime.now();

  factory Parent({
    int? id,
    required int familyId,
    required String phone,
    required String name,
    _i2.ParentRole? role,
    DateTime? createdAt,
  }) = _ParentImpl;

  factory Parent.fromJson(Map<String, dynamic> jsonSerialization) {
    return Parent(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      phone: jsonSerialization['phone'] as String,
      name: jsonSerialization['name'] as String,
      role: jsonSerialization['role'] == null
          ? null
          : _i2.ParentRole.fromJson((jsonSerialization['role'] as String)),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int familyId;

  String phone;

  String name;

  _i2.ParentRole role;

  DateTime createdAt;

  /// Returns a shallow copy of this [Parent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Parent copyWith({
    int? id,
    int? familyId,
    String? phone,
    String? name,
    _i2.ParentRole? role,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Parent',
      if (id != null) 'id': id,
      'familyId': familyId,
      'phone': phone,
      'name': name,
      'role': role.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ParentImpl extends Parent {
  _ParentImpl({
    int? id,
    required int familyId,
    required String phone,
    required String name,
    _i2.ParentRole? role,
    DateTime? createdAt,
  }) : super._(
         id: id,
         familyId: familyId,
         phone: phone,
         name: name,
         role: role,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Parent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Parent copyWith({
    Object? id = _Undefined,
    int? familyId,
    String? phone,
    String? name,
    _i2.ParentRole? role,
    DateTime? createdAt,
  }) {
    return Parent(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
