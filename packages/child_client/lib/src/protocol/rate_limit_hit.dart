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

/// Обращение, учитываемое ограничителем частоты.
///
/// Хранится в базе, а не в памяти: после перезапуска сервера окно не
/// должно обнуляться, иначе ограничение обходится перезагрузкой.
abstract class RateLimitHit implements _i1.SerializableModel {
  RateLimitHit._({
    this.id,
    required this.bucket,
    required this.at,
  });

  factory RateLimitHit({
    int? id,
    required String bucket,
    required DateTime at,
  }) = _RateLimitHitImpl;

  factory RateLimitHit.fromJson(Map<String, dynamic> jsonSerialization) {
    return RateLimitHit(
      id: jsonSerialization['id'] as int?,
      bucket: jsonSerialization['bucket'] as String,
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Что ограничиваем: «auth:+99365…», «chat:7».
  String bucket;

  DateTime at;

  /// Returns a shallow copy of this [RateLimitHit]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RateLimitHit copyWith({
    int? id,
    String? bucket,
    DateTime? at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RateLimitHit',
      if (id != null) 'id': id,
      'bucket': bucket,
      'at': at.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RateLimitHitImpl extends RateLimitHit {
  _RateLimitHitImpl({
    int? id,
    required String bucket,
    required DateTime at,
  }) : super._(
         id: id,
         bucket: bucket,
         at: at,
       );

  /// Returns a shallow copy of this [RateLimitHit]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RateLimitHit copyWith({
    Object? id = _Undefined,
    String? bucket,
    DateTime? at,
  }) {
    return RateLimitHit(
      id: id is int? ? id : this.id,
      bucket: bucket ?? this.bucket,
      at: at ?? this.at,
    );
  }
}
