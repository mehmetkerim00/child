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

/// Переписка по поездке или по семье.
///
/// Номера телефонов сторон не раскрываются: родитель и водитель общаются
/// внутри приложения, у диспетчера видна вся переписка.
abstract class ChatThread implements _i1.SerializableModel {
  ChatThread._({
    this.id,
    required this.familyId,
    this.rideId,
    this.driverId,
    DateTime? createdAt,
    this.lastMessageAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ChatThread({
    int? id,
    required int familyId,
    int? rideId,
    int? driverId,
    DateTime? createdAt,
    DateTime? lastMessageAt,
  }) = _ChatThreadImpl;

  factory ChatThread.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatThread(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      rideId: jsonSerialization['rideId'] as int?,
      driverId: jsonSerialization['driverId'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      lastMessageAt: jsonSerialization['lastMessageAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int familyId;

  /// Поездка, к которой относится разговор. Пусто — общий разговор семьи.
  int? rideId;

  /// Водитель, участвующий в разговоре.
  int? driverId;

  DateTime createdAt;

  DateTime? lastMessageAt;

  /// Returns a shallow copy of this [ChatThread]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatThread copyWith({
    int? id,
    int? familyId,
    int? rideId,
    int? driverId,
    DateTime? createdAt,
    DateTime? lastMessageAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatThread',
      if (id != null) 'id': id,
      'familyId': familyId,
      if (rideId != null) 'rideId': rideId,
      if (driverId != null) 'driverId': driverId,
      'createdAt': createdAt.toJson(),
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatThreadImpl extends ChatThread {
  _ChatThreadImpl({
    int? id,
    required int familyId,
    int? rideId,
    int? driverId,
    DateTime? createdAt,
    DateTime? lastMessageAt,
  }) : super._(
         id: id,
         familyId: familyId,
         rideId: rideId,
         driverId: driverId,
         createdAt: createdAt,
         lastMessageAt: lastMessageAt,
       );

  /// Returns a shallow copy of this [ChatThread]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatThread copyWith({
    Object? id = _Undefined,
    int? familyId,
    Object? rideId = _Undefined,
    Object? driverId = _Undefined,
    DateTime? createdAt,
    Object? lastMessageAt = _Undefined,
  }) {
    return ChatThread(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      rideId: rideId is int? ? rideId : this.rideId,
      driverId: driverId is int? ? driverId : this.driverId,
      createdAt: createdAt ?? this.createdAt,
      lastMessageAt: lastMessageAt is DateTime?
          ? lastMessageAt
          : this.lastMessageAt,
    );
  }
}
