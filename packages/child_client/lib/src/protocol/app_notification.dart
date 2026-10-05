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

/// Уведомление, доставленное в приложение по WebSocket.
///
/// План Б на случай, когда FCM недоступен (туркменский хостинг может не
/// пускать сервисы Google). Пока приложение открыто, оно получает
/// уведомления этим каналом; всё, что нельзя пропустить, дублируется SMS.
abstract class AppNotification implements _i1.SerializableModel {
  AppNotification._({
    required this.outboxId,
    required this.eventKind,
    required this.title,
    required this.body,
    required this.critical,
    this.rideId,
    required this.at,
  });

  factory AppNotification({
    required int outboxId,
    required String eventKind,
    required String title,
    required String body,
    required bool critical,
    int? rideId,
    required DateTime at,
  }) = _AppNotificationImpl;

  factory AppNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppNotification(
      outboxId: jsonSerialization['outboxId'] as int,
      eventKind: jsonSerialization['eventKind'] as String,
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
      critical: _i1.BoolJsonExtension.fromJson(jsonSerialization['critical']),
      rideId: jsonSerialization['rideId'] as int?,
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
    );
  }

  /// Строка очереди: приложение вернёт этот id в ack.
  int outboxId;

  String eventKind;

  String title;

  String body;

  bool critical;

  int? rideId;

  DateTime at;

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppNotification copyWith({
    int? outboxId,
    String? eventKind,
    String? title,
    String? body,
    bool? critical,
    int? rideId,
    DateTime? at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppNotification',
      'outboxId': outboxId,
      'eventKind': eventKind,
      'title': title,
      'body': body,
      'critical': critical,
      if (rideId != null) 'rideId': rideId,
      'at': at.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppNotificationImpl extends AppNotification {
  _AppNotificationImpl({
    required int outboxId,
    required String eventKind,
    required String title,
    required String body,
    required bool critical,
    int? rideId,
    required DateTime at,
  }) : super._(
         outboxId: outboxId,
         eventKind: eventKind,
         title: title,
         body: body,
         critical: critical,
         rideId: rideId,
         at: at,
       );

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppNotification copyWith({
    int? outboxId,
    String? eventKind,
    String? title,
    String? body,
    bool? critical,
    Object? rideId = _Undefined,
    DateTime? at,
  }) {
    return AppNotification(
      outboxId: outboxId ?? this.outboxId,
      eventKind: eventKind ?? this.eventKind,
      title: title ?? this.title,
      body: body ?? this.body,
      critical: critical ?? this.critical,
      rideId: rideId is int? ? rideId : this.rideId,
      at: at ?? this.at,
    );
  }
}
