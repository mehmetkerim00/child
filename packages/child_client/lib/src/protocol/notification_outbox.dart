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
import 'account_role.dart' as _i3;
import 'notification_channel.dart' as _i4;

/// Очередь исходящих уведомлений — сердце SMS-фолбэка (MVP_PLAN §6).
///
/// Одна строка = одна попытка доставить одно событие одному получателю
/// по одному каналу. Push и SMS по одному событию — две разные строки.
abstract class NotificationOutbox implements _i1.SerializableModel {
  NotificationOutbox._({
    this.id,
    required this.dedupeKey,
    required this.eventKind,
    bool? critical,
    required this.recipientPhone,
    required this.recipientRole,
    required this.channel,
    _i2.NotificationStatus? status,
    int? attempts,
    required this.body,
    this.rideId,
    this.familyId,
    required this.createdAt,
    this.nextAttemptAt,
    this.sentAt,
    this.ackedAt,
    this.ackDeadline,
    this.lastError,
  }) : critical = critical ?? false,
       status = status ?? _i2.NotificationStatus.queued,
       attempts = attempts ?? 0;

  factory NotificationOutbox({
    int? id,
    required String dedupeKey,
    required String eventKind,
    bool? critical,
    required String recipientPhone,
    required _i3.AccountRole recipientRole,
    required _i4.NotificationChannel channel,
    _i2.NotificationStatus? status,
    int? attempts,
    required String body,
    int? rideId,
    int? familyId,
    required DateTime createdAt,
    DateTime? nextAttemptAt,
    DateTime? sentAt,
    DateTime? ackedAt,
    DateTime? ackDeadline,
    String? lastError,
  }) = _NotificationOutboxImpl;

  factory NotificationOutbox.fromJson(Map<String, dynamic> jsonSerialization) {
    return NotificationOutbox(
      id: jsonSerialization['id'] as int?,
      dedupeKey: jsonSerialization['dedupeKey'] as String,
      eventKind: jsonSerialization['eventKind'] as String,
      critical: jsonSerialization['critical'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['critical']),
      recipientPhone: jsonSerialization['recipientPhone'] as String,
      recipientRole: _i3.AccountRole.fromJson(
        (jsonSerialization['recipientRole'] as String),
      ),
      channel: _i4.NotificationChannel.fromJson(
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
      familyId: jsonSerialization['familyId'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      nextAttemptAt: jsonSerialization['nextAttemptAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['nextAttemptAt'],
            ),
      sentAt: jsonSerialization['sentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      ackedAt: jsonSerialization['ackedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['ackedAt']),
      ackDeadline: jsonSerialization['ackDeadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['ackDeadline'],
            ),
      lastError: jsonSerialization['lastError'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Ключ идемпотентности: событие + получатель + канал.
  /// Уникальный индекс не даёт отправить одно и то же дважды.
  String dedupeKey;

  /// Событие, породившее уведомление, например ride.pickedUp.
  String eventKind;

  /// Критические события уходят по SMS сразу, не дожидаясь ack.
  bool critical;

  String recipientPhone;

  /// Кому: родитель, водитель или диспетчер.
  _i3.AccountRole recipientRole;

  _i4.NotificationChannel channel;

  _i2.NotificationStatus status;

  int attempts;

  /// Готовый текст на языке получателя.
  String body;

  int? rideId;

  int? familyId;

  DateTime createdAt;

  /// Когда можно делать следующую попытку (нарастающая пауза).
  DateTime? nextAttemptAt;

  DateTime? sentAt;

  /// Приложение подтвердило получение push.
  DateTime? ackedAt;

  /// До этого момента ждём ack, потом включаем SMS-фолбэк.
  DateTime? ackDeadline;

  String? lastError;

  /// Returns a shallow copy of this [NotificationOutbox]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationOutbox copyWith({
    int? id,
    String? dedupeKey,
    String? eventKind,
    bool? critical,
    String? recipientPhone,
    _i3.AccountRole? recipientRole,
    _i4.NotificationChannel? channel,
    _i2.NotificationStatus? status,
    int? attempts,
    String? body,
    int? rideId,
    int? familyId,
    DateTime? createdAt,
    DateTime? nextAttemptAt,
    DateTime? sentAt,
    DateTime? ackedAt,
    DateTime? ackDeadline,
    String? lastError,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NotificationOutbox',
      if (id != null) 'id': id,
      'dedupeKey': dedupeKey,
      'eventKind': eventKind,
      'critical': critical,
      'recipientPhone': recipientPhone,
      'recipientRole': recipientRole.toJson(),
      'channel': channel.toJson(),
      'status': status.toJson(),
      'attempts': attempts,
      'body': body,
      if (rideId != null) 'rideId': rideId,
      if (familyId != null) 'familyId': familyId,
      'createdAt': createdAt.toJson(),
      if (nextAttemptAt != null) 'nextAttemptAt': nextAttemptAt?.toJson(),
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
      if (ackedAt != null) 'ackedAt': ackedAt?.toJson(),
      if (ackDeadline != null) 'ackDeadline': ackDeadline?.toJson(),
      if (lastError != null) 'lastError': lastError,
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
    required String dedupeKey,
    required String eventKind,
    bool? critical,
    required String recipientPhone,
    required _i3.AccountRole recipientRole,
    required _i4.NotificationChannel channel,
    _i2.NotificationStatus? status,
    int? attempts,
    required String body,
    int? rideId,
    int? familyId,
    required DateTime createdAt,
    DateTime? nextAttemptAt,
    DateTime? sentAt,
    DateTime? ackedAt,
    DateTime? ackDeadline,
    String? lastError,
  }) : super._(
         id: id,
         dedupeKey: dedupeKey,
         eventKind: eventKind,
         critical: critical,
         recipientPhone: recipientPhone,
         recipientRole: recipientRole,
         channel: channel,
         status: status,
         attempts: attempts,
         body: body,
         rideId: rideId,
         familyId: familyId,
         createdAt: createdAt,
         nextAttemptAt: nextAttemptAt,
         sentAt: sentAt,
         ackedAt: ackedAt,
         ackDeadline: ackDeadline,
         lastError: lastError,
       );

  /// Returns a shallow copy of this [NotificationOutbox]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NotificationOutbox copyWith({
    Object? id = _Undefined,
    String? dedupeKey,
    String? eventKind,
    bool? critical,
    String? recipientPhone,
    _i3.AccountRole? recipientRole,
    _i4.NotificationChannel? channel,
    _i2.NotificationStatus? status,
    int? attempts,
    String? body,
    Object? rideId = _Undefined,
    Object? familyId = _Undefined,
    DateTime? createdAt,
    Object? nextAttemptAt = _Undefined,
    Object? sentAt = _Undefined,
    Object? ackedAt = _Undefined,
    Object? ackDeadline = _Undefined,
    Object? lastError = _Undefined,
  }) {
    return NotificationOutbox(
      id: id is int? ? id : this.id,
      dedupeKey: dedupeKey ?? this.dedupeKey,
      eventKind: eventKind ?? this.eventKind,
      critical: critical ?? this.critical,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      recipientRole: recipientRole ?? this.recipientRole,
      channel: channel ?? this.channel,
      status: status ?? this.status,
      attempts: attempts ?? this.attempts,
      body: body ?? this.body,
      rideId: rideId is int? ? rideId : this.rideId,
      familyId: familyId is int? ? familyId : this.familyId,
      createdAt: createdAt ?? this.createdAt,
      nextAttemptAt: nextAttemptAt is DateTime?
          ? nextAttemptAt
          : this.nextAttemptAt,
      sentAt: sentAt is DateTime? ? sentAt : this.sentAt,
      ackedAt: ackedAt is DateTime? ? ackedAt : this.ackedAt,
      ackDeadline: ackDeadline is DateTime? ? ackDeadline : this.ackDeadline,
      lastError: lastError is String? ? lastError : this.lastError,
    );
  }
}
