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

/// Владелец сервиса: видит деньги и отчёты, но не управляет поездками.
///
/// Роль отдельная от диспетчера намеренно: диспетчер не должен видеть
/// выручку и балансы всех семей, владелец — не должен случайно менять
/// чужую поездку.
abstract class OwnerAccount implements _i1.SerializableModel {
  OwnerAccount._({
    this.id,
    required this.phone,
    required this.name,
    bool? active,
    DateTime? createdAt,
  }) : active = active ?? true,
       createdAt = createdAt ?? DateTime.now();

  factory OwnerAccount({
    int? id,
    required String phone,
    required String name,
    bool? active,
    DateTime? createdAt,
  }) = _OwnerAccountImpl;

  factory OwnerAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return OwnerAccount(
      id: jsonSerialization['id'] as int?,
      phone: jsonSerialization['phone'] as String,
      name: jsonSerialization['name'] as String,
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

  bool active;

  DateTime createdAt;

  /// Returns a shallow copy of this [OwnerAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OwnerAccount copyWith({
    int? id,
    String? phone,
    String? name,
    bool? active,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OwnerAccount',
      if (id != null) 'id': id,
      'phone': phone,
      'name': name,
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

class _OwnerAccountImpl extends OwnerAccount {
  _OwnerAccountImpl({
    int? id,
    required String phone,
    required String name,
    bool? active,
    DateTime? createdAt,
  }) : super._(
         id: id,
         phone: phone,
         name: name,
         active: active,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [OwnerAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OwnerAccount copyWith({
    Object? id = _Undefined,
    String? phone,
    String? name,
    bool? active,
    DateTime? createdAt,
  }) {
    return OwnerAccount(
      id: id is int? ? id : this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
