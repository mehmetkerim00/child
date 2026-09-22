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
import 'account_role.dart' as _i2;

/// Токен сессии: выдаётся после подтверждения кода.
abstract class AuthToken implements _i1.SerializableModel {
  AuthToken._({
    this.id,
    required this.tokenHash,
    required this.role,
    required this.subjectId,
    required this.phone,
    DateTime? createdAt,
    required this.expiresAt,
    this.revokedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory AuthToken({
    int? id,
    required String tokenHash,
    required _i2.AccountRole role,
    required int subjectId,
    required String phone,
    DateTime? createdAt,
    required DateTime expiresAt,
    DateTime? revokedAt,
  }) = _AuthTokenImpl;

  factory AuthToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthToken(
      id: jsonSerialization['id'] as int?,
      tokenHash: jsonSerialization['tokenHash'] as String,
      role: _i2.AccountRole.fromJson((jsonSerialization['role'] as String)),
      subjectId: jsonSerialization['subjectId'] as int,
      phone: jsonSerialization['phone'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      revokedAt: jsonSerialization['revokedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['revokedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Хэш токена; сам токен хранится только на устройстве.
  String tokenHash;

  _i2.AccountRole role;

  /// id записи Parent, Driver или DispatcherAccount — в зависимости от роли.
  int subjectId;

  String phone;

  DateTime createdAt;

  DateTime expiresAt;

  DateTime? revokedAt;

  /// Returns a shallow copy of this [AuthToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthToken copyWith({
    int? id,
    String? tokenHash,
    _i2.AccountRole? role,
    int? subjectId,
    String? phone,
    DateTime? createdAt,
    DateTime? expiresAt,
    DateTime? revokedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthToken',
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'role': role.toJson(),
      'subjectId': subjectId,
      'phone': phone,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthTokenImpl extends AuthToken {
  _AuthTokenImpl({
    int? id,
    required String tokenHash,
    required _i2.AccountRole role,
    required int subjectId,
    required String phone,
    DateTime? createdAt,
    required DateTime expiresAt,
    DateTime? revokedAt,
  }) : super._(
         id: id,
         tokenHash: tokenHash,
         role: role,
         subjectId: subjectId,
         phone: phone,
         createdAt: createdAt,
         expiresAt: expiresAt,
         revokedAt: revokedAt,
       );

  /// Returns a shallow copy of this [AuthToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthToken copyWith({
    Object? id = _Undefined,
    String? tokenHash,
    _i2.AccountRole? role,
    int? subjectId,
    String? phone,
    DateTime? createdAt,
    DateTime? expiresAt,
    Object? revokedAt = _Undefined,
  }) {
    return AuthToken(
      id: id is int? ? id : this.id,
      tokenHash: tokenHash ?? this.tokenHash,
      role: role ?? this.role,
      subjectId: subjectId ?? this.subjectId,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      revokedAt: revokedAt is DateTime? ? revokedAt : this.revokedAt,
    );
  }
}
