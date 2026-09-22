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

import 'package:serverpod/serverpod.dart' as _i1;
import 'account_role.dart' as _i2;

/// Результат успешного входа.
abstract class AuthResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AuthResult._({
    required this.token,
    required this.role,
    required this.displayName,
    required this.subjectId,
    this.familyId,
  });

  factory AuthResult({
    required String token,
    required _i2.AccountRole role,
    required String displayName,
    required int subjectId,
    int? familyId,
  }) = _AuthResultImpl;

  factory AuthResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthResult(
      token: jsonSerialization['token'] as String,
      role: _i2.AccountRole.fromJson((jsonSerialization['role'] as String)),
      displayName: jsonSerialization['displayName'] as String,
      subjectId: jsonSerialization['subjectId'] as int,
      familyId: jsonSerialization['familyId'] as int?,
    );
  }

  /// Токен сессии: хранится на устройстве, передаётся в каждом запросе.
  String token;

  _i2.AccountRole role;

  /// Имя для приветствия в интерфейсе.
  String displayName;

  /// id записи Parent, Driver или DispatcherAccount.
  int subjectId;

  /// Для родителя — его семья.
  int? familyId;

  /// Returns a shallow copy of this [AuthResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthResult copyWith({
    String? token,
    _i2.AccountRole? role,
    String? displayName,
    int? subjectId,
    int? familyId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthResult',
      'token': token,
      'role': role.toJson(),
      'displayName': displayName,
      'subjectId': subjectId,
      if (familyId != null) 'familyId': familyId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AuthResult',
      'token': token,
      'role': role.toJson(),
      'displayName': displayName,
      'subjectId': subjectId,
      if (familyId != null) 'familyId': familyId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthResultImpl extends AuthResult {
  _AuthResultImpl({
    required String token,
    required _i2.AccountRole role,
    required String displayName,
    required int subjectId,
    int? familyId,
  }) : super._(
         token: token,
         role: role,
         displayName: displayName,
         subjectId: subjectId,
         familyId: familyId,
       );

  /// Returns a shallow copy of this [AuthResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthResult copyWith({
    String? token,
    _i2.AccountRole? role,
    String? displayName,
    int? subjectId,
    Object? familyId = _Undefined,
  }) {
    return AuthResult(
      token: token ?? this.token,
      role: role ?? this.role,
      displayName: displayName ?? this.displayName,
      subjectId: subjectId ?? this.subjectId,
      familyId: familyId is int? ? familyId : this.familyId,
    );
  }
}
