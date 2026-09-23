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

/// Доступ учреждения к своему списку детей.
///
/// Воспитателю не нужно ставить приложение и заводить аккаунт: он
/// открывает ссылку с токеном. Ссылку выдаёт диспетчер, при утечке —
/// отзывает и выдаёт новую.
abstract class InstitutionAccess implements _i1.SerializableModel {
  InstitutionAccess._({
    this.id,
    required this.institutionId,
    required this.tokenHash,
    required this.issuedTo,
    DateTime? createdAt,
    this.lastUsedAt,
    this.revokedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory InstitutionAccess({
    int? id,
    required int institutionId,
    required String tokenHash,
    required String issuedTo,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? revokedAt,
  }) = _InstitutionAccessImpl;

  factory InstitutionAccess.fromJson(Map<String, dynamic> jsonSerialization) {
    return InstitutionAccess(
      id: jsonSerialization['id'] as int?,
      institutionId: jsonSerialization['institutionId'] as int,
      tokenHash: jsonSerialization['tokenHash'] as String,
      issuedTo: jsonSerialization['issuedTo'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      revokedAt: jsonSerialization['revokedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['revokedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int institutionId;

  /// Хэш токена: сама ссылка хранится только у учреждения.
  String tokenHash;

  /// Кому выдана ссылка — чтобы знать, кого просить не пересылать её.
  String issuedTo;

  DateTime createdAt;

  DateTime? lastUsedAt;

  DateTime? revokedAt;

  /// Returns a shallow copy of this [InstitutionAccess]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InstitutionAccess copyWith({
    int? id,
    int? institutionId,
    String? tokenHash,
    String? issuedTo,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? revokedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InstitutionAccess',
      if (id != null) 'id': id,
      'institutionId': institutionId,
      'tokenHash': tokenHash,
      'issuedTo': issuedTo,
      'createdAt': createdAt.toJson(),
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InstitutionAccessImpl extends InstitutionAccess {
  _InstitutionAccessImpl({
    int? id,
    required int institutionId,
    required String tokenHash,
    required String issuedTo,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? revokedAt,
  }) : super._(
         id: id,
         institutionId: institutionId,
         tokenHash: tokenHash,
         issuedTo: issuedTo,
         createdAt: createdAt,
         lastUsedAt: lastUsedAt,
         revokedAt: revokedAt,
       );

  /// Returns a shallow copy of this [InstitutionAccess]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InstitutionAccess copyWith({
    Object? id = _Undefined,
    int? institutionId,
    String? tokenHash,
    String? issuedTo,
    DateTime? createdAt,
    Object? lastUsedAt = _Undefined,
    Object? revokedAt = _Undefined,
  }) {
    return InstitutionAccess(
      id: id is int? ? id : this.id,
      institutionId: institutionId ?? this.institutionId,
      tokenHash: tokenHash ?? this.tokenHash,
      issuedTo: issuedTo ?? this.issuedTo,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      revokedAt: revokedAt is DateTime? ? revokedAt : this.revokedAt,
    );
  }
}
