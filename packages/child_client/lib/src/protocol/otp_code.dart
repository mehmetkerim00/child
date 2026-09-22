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

/// Одноразовый код входа по телефону.
abstract class OtpCode implements _i1.SerializableModel {
  OtpCode._({
    this.id,
    required this.phone,
    required this.codeHash,
    required this.expiresAt,
    int? attempts,
    this.usedAt,
    DateTime? createdAt,
  }) : attempts = attempts ?? 0,
       createdAt = createdAt ?? DateTime.now();

  factory OtpCode({
    int? id,
    required String phone,
    required String codeHash,
    required DateTime expiresAt,
    int? attempts,
    DateTime? usedAt,
    DateTime? createdAt,
  }) = _OtpCodeImpl;

  factory OtpCode.fromJson(Map<String, dynamic> jsonSerialization) {
    return OtpCode(
      id: jsonSerialization['id'] as int?,
      phone: jsonSerialization['phone'] as String,
      codeHash: jsonSerialization['codeHash'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      attempts: jsonSerialization['attempts'] as int?,
      usedAt: jsonSerialization['usedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['usedAt']),
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

  /// Хранится только хэш кода — сам код уходит в SMS и в лог dev-режима.
  String codeHash;

  DateTime expiresAt;

  int attempts;

  DateTime? usedAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [OtpCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OtpCode copyWith({
    int? id,
    String? phone,
    String? codeHash,
    DateTime? expiresAt,
    int? attempts,
    DateTime? usedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OtpCode',
      if (id != null) 'id': id,
      'phone': phone,
      'codeHash': codeHash,
      'expiresAt': expiresAt.toJson(),
      'attempts': attempts,
      if (usedAt != null) 'usedAt': usedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OtpCodeImpl extends OtpCode {
  _OtpCodeImpl({
    int? id,
    required String phone,
    required String codeHash,
    required DateTime expiresAt,
    int? attempts,
    DateTime? usedAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         phone: phone,
         codeHash: codeHash,
         expiresAt: expiresAt,
         attempts: attempts,
         usedAt: usedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [OtpCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OtpCode copyWith({
    Object? id = _Undefined,
    String? phone,
    String? codeHash,
    DateTime? expiresAt,
    int? attempts,
    Object? usedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return OtpCode(
      id: id is int? ? id : this.id,
      phone: phone ?? this.phone,
      codeHash: codeHash ?? this.codeHash,
      expiresAt: expiresAt ?? this.expiresAt,
      attempts: attempts ?? this.attempts,
      usedAt: usedAt is DateTime? ? usedAt : this.usedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
