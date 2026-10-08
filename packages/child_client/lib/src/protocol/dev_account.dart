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

/// Аккаунт из сидов — для входа одним нажатием при ручной проверке.
///
/// Отдаётся только в режиме development: это список готовых учётных
/// записей, и в бою он был бы подсказкой, кого ломать.
abstract class DevAccount implements _i1.SerializableModel {
  DevAccount._({
    required this.phone,
    required this.name,
    required this.role,
  });

  factory DevAccount({
    required String phone,
    required String name,
    required _i2.AccountRole role,
  }) = _DevAccountImpl;

  factory DevAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return DevAccount(
      phone: jsonSerialization['phone'] as String,
      name: jsonSerialization['name'] as String,
      role: _i2.AccountRole.fromJson((jsonSerialization['role'] as String)),
    );
  }

  String phone;

  String name;

  _i2.AccountRole role;

  /// Returns a shallow copy of this [DevAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DevAccount copyWith({
    String? phone,
    String? name,
    _i2.AccountRole? role,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DevAccount',
      'phone': phone,
      'name': name,
      'role': role.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DevAccountImpl extends DevAccount {
  _DevAccountImpl({
    required String phone,
    required String name,
    required _i2.AccountRole role,
  }) : super._(
         phone: phone,
         name: name,
         role: role,
       );

  /// Returns a shallow copy of this [DevAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DevAccount copyWith({
    String? phone,
    String? name,
    _i2.AccountRole? role,
  }) {
    return DevAccount(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }
}
