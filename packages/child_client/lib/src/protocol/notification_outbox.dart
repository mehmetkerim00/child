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
import 'notification_status.dart' as _i2;
import 'notification_channel.dart' as _i3;

/// Очередь исходящих уведомлений — сердце SMS-фолбэка (MVP_PLAN §6).
abstract class NotificationOutbox implements _i1.SerializableModel {
  NotificationOutbox._({
    this.id,
    required this.eventKind,
    required this.recipientPhone,
    required this.channel,
    _i2.NotificationStatus? status,
    int? attempts,
    required this.body,
    this.rideId,
    DateTime? createdAt,
    this.sentAt,
  }) : status = status ?? _i2.NotificationStatus.queued,
       attempts = attempts ?? 0,
       createdAt = createdAt ?? DateTime.now();

  factory NotificationOutbox({
    int? id,
    required String eventKind,
    required String recipientPhone,
    required _i3.NotificationChannel channel,
    _i2.NotificationStatus? status,
    int? attempts,
    required String body,
    int? rideId,
    DateTime? createdAt,
    DateTime? sentAt,
  }) = _NotificationOutboxImpl;

  factory NotificationOutbox.fromJson(Map<String, dynamic> jsonSerialization) {
    return NotificationOutbox(
      id: jsonSerialization['id'] as int?,
      eventKind: jsonSerialization['eventKind'] as String,
      recipientPhone: jsonSerialization['recipientPhone'] as String,
      channel: _i3.NotificationChannel.fromJson(
        (jsonSerialization['channel'] as String),
      ),
      status: jsonSerialization['status'] == null
          ? null
          : _i2.NotificationStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      attempts: jsonSerialization['attempts'] as int?,
      body: jsonSerialization['body'] as String,
      rideId: jsonSerialization['rideId'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      sentAt: jsonSerialization['sentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Событие, породившее уведомление, например ride.pickedUp.
  String eventKind;

  String recipientPhone;

  _i3.NotificationChannel channel;

  _i2.NotificationStatus status;

  int attempts;

  /// Готовый текст сообщения на языке получателя.
  String body;

  int? rideId;

  DateTime createdAt;

  DateTime? sentAt;

  /// Returns a shallow copy of this [NotificationOutbox]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationOutbox copyWith({
    int? id,
    String? eventKind,
    String? recipientPhone,
    _i3.NotificationChannel? channel,
    _i2.NotificationStatus? status,
    int? attempts,
    String? body,
    int? rideId,
    DateTime? createdAt,
    DateTime? sentAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NotificationOutbox',
      if (id != null) 'id': id,
      'eventKind': eventKind,
      'recipientPhone': recipientPhone,
      'channel': channel.toJson(),
      'status': status.toJson(),
      'attempts': attempts,
      'body': body,
      if (rideId != null) 'rideId': rideId,
      'createdAt': createdAt.toJson(),
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationOutboxImpl extends NotificationOutbox {
  _NotificationOutboxImpl({
    int? id,
    required String eventKind,
    required String recipientPhone,
    required _i3.NotificationChannel channel,
    _i2.NotificationStatus? status,
    int? attempts,
    required String body,
    int? rideId,
    DateTime? createdAt,
    DateTime? sentAt,
  }) : super._(
         id: id,
         eventKind: eventKind,
         recipientPhone: recipientPhone,
         channel: channel,
         status: status,
         attempts: attempts,
         body: body,
         rideId: rideId,
         createdAt: createdAt,
         sentAt: sentAt,
       );

  /// Returns a shallow copy of this [NotificationOutbox]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NotificationOutbox copyWith({
    Object? id = _Undefined,
    String? eventKind,
    String? recipientPhone,
    _i3.NotificationChannel? channel,
    _i2.NotificationStatus? status,
    int? attempts,
    String? body,
    Object? rideId = _Undefined,
    DateTime? createdAt,
    Object? sentAt = _Undefined,
  }) {
    return NotificationOutbox(
      id: id is int? ? id : this.id,
      eventKind: eventKind ?? this.eventKind,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      channel: channel ?? this.channel,
      status: status ?? this.status,
      attempts: attempts ?? this.attempts,
      body: body ?? this.body,
      rideId: rideId is int? ? rideId : this.rideId,
      createdAt: createdAt ?? this.createdAt,
      sentAt: sentAt is DateTime? ? sentAt : this.sentAt,
    );
  }
}
