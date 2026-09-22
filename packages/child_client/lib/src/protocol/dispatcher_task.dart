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
import 'dispatcher_task_kind.dart' as _i2;

/// Задача диспетчеру: то, что нельзя решить автоматически.
///
/// Сюда попадают «тихие сбои»: водитель не подтвердил завтрашние поездки,
/// не выехал вовремя, не дошло ни push, ни SMS.
abstract class DispatcherTask implements _i1.SerializableModel {
  DispatcherTask._({
    this.id,
    required this.kind,
    required this.text,
    this.rideId,
    this.familyId,
    this.driverId,
    required this.dedupeKey,
    required this.createdAt,
    this.resolvedAt,
  });

  factory DispatcherTask({
    int? id,
    required _i2.DispatcherTaskKind kind,
    required String text,
    int? rideId,
    int? familyId,
    int? driverId,
    required String dedupeKey,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) = _DispatcherTaskImpl;

  factory DispatcherTask.fromJson(Map<String, dynamic> jsonSerialization) {
    return DispatcherTask(
      id: jsonSerialization['id'] as int?,
      kind: _i2.DispatcherTaskKind.fromJson(
        (jsonSerialization['kind'] as String),
      ),
      text: jsonSerialization['text'] as String,
      rideId: jsonSerialization['rideId'] as int?,
      familyId: jsonSerialization['familyId'] as int?,
      driverId: jsonSerialization['driverId'] as int?,
      dedupeKey: jsonSerialization['dedupeKey'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.DispatcherTaskKind kind;

  /// Что случилось, человеческим языком — диспетчер читает и звонит.
  String text;

  int? rideId;

  int? familyId;

  int? driverId;

  /// Ключ идемпотентности: одна и та же проблема не плодит задачи.
  String dedupeKey;

  DateTime createdAt;

  DateTime? resolvedAt;

  /// Returns a shallow copy of this [DispatcherTask]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DispatcherTask copyWith({
    int? id,
    _i2.DispatcherTaskKind? kind,
    String? text,
    int? rideId,
    int? familyId,
    int? driverId,
    String? dedupeKey,
    DateTime? createdAt,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DispatcherTask',
      if (id != null) 'id': id,
      'kind': kind.toJson(),
      'text': text,
      if (rideId != null) 'rideId': rideId,
      if (familyId != null) 'familyId': familyId,
      if (driverId != null) 'driverId': driverId,
      'dedupeKey': dedupeKey,
      'createdAt': createdAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DispatcherTaskImpl extends DispatcherTask {
  _DispatcherTaskImpl({
    int? id,
    required _i2.DispatcherTaskKind kind,
    required String text,
    int? rideId,
    int? familyId,
    int? driverId,
    required String dedupeKey,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) : super._(
         id: id,
         kind: kind,
         text: text,
         rideId: rideId,
         familyId: familyId,
         driverId: driverId,
         dedupeKey: dedupeKey,
         createdAt: createdAt,
         resolvedAt: resolvedAt,
       );

  /// Returns a shallow copy of this [DispatcherTask]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DispatcherTask copyWith({
    Object? id = _Undefined,
    _i2.DispatcherTaskKind? kind,
    String? text,
    Object? rideId = _Undefined,
    Object? familyId = _Undefined,
    Object? driverId = _Undefined,
    String? dedupeKey,
    DateTime? createdAt,
    Object? resolvedAt = _Undefined,
  }) {
    return DispatcherTask(
      id: id is int? ? id : this.id,
      kind: kind ?? this.kind,
      text: text ?? this.text,
      rideId: rideId is int? ? rideId : this.rideId,
      familyId: familyId is int? ? familyId : this.familyId,
      driverId: driverId is int? ? driverId : this.driverId,
      dedupeKey: dedupeKey ?? this.dedupeKey,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}
