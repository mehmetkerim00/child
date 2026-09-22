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

/// Ответ проверки связи с сервером.
abstract class ServerHealth
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ServerHealth._({
    required this.status,
    required this.serverVersion,
    required this.serverTime,
  });

  factory ServerHealth({
    required String status,
    required String serverVersion,
    required DateTime serverTime,
  }) = _ServerHealthImpl;

  factory ServerHealth.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerHealth(
      status: jsonSerialization['status'] as String,
      serverVersion: jsonSerialization['serverVersion'] as String,
      serverTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['serverTime'],
      ),
    );
  }

  /// Всегда "ok", если сервер ответил.
  String status;

  /// Версия бэкенда (для проверки «доступна новая версия» в будущем).
  String serverVersion;

  /// Время сервера (UTC).
  DateTime serverTime;

  /// Returns a shallow copy of this [ServerHealth]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServerHealth copyWith({
    String? status,
    String? serverVersion,
    DateTime? serverTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ServerHealth',
      'status': status,
      'serverVersion': serverVersion,
      'serverTime': serverTime.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ServerHealth',
      'status': status,
      'serverVersion': serverVersion,
      'serverTime': serverTime.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ServerHealthImpl extends ServerHealth {
  _ServerHealthImpl({
    required String status,
    required String serverVersion,
    required DateTime serverTime,
  }) : super._(
         status: status,
         serverVersion: serverVersion,
         serverTime: serverTime,
       );

  /// Returns a shallow copy of this [ServerHealth]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServerHealth copyWith({
    String? status,
    String? serverVersion,
    DateTime? serverTime,
  }) {
    return ServerHealth(
      status: status ?? this.status,
      serverVersion: serverVersion ?? this.serverVersion,
      serverTime: serverTime ?? this.serverTime,
    );
  }
}
