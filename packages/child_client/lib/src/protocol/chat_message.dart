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
import 'quick_phrase.dart' as _i3;

/// Сообщение в переписке.
abstract class ChatMessage implements _i1.SerializableModel {
  ChatMessage._({
    this.id,
    required this.threadId,
    required this.senderRole,
    required this.senderId,
    required this.senderName,
    required this.body,
    this.quickPhrase,
    bool? critical,
    DateTime? createdAt,
    required this.clientMessageId,
  }) : critical = critical ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory ChatMessage({
    int? id,
    required int threadId,
    required _i2.AccountRole senderRole,
    required int senderId,
    required String senderName,
    required String body,
    _i3.QuickPhrase? quickPhrase,
    bool? critical,
    DateTime? createdAt,
    required String clientMessageId,
  }) = _ChatMessageImpl;

  factory ChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatMessage(
      id: jsonSerialization['id'] as int?,
      threadId: jsonSerialization['threadId'] as int,
      senderRole: _i2.AccountRole.fromJson(
        (jsonSerialization['senderRole'] as String),
      ),
      senderId: jsonSerialization['senderId'] as int,
      senderName: jsonSerialization['senderName'] as String,
      body: jsonSerialization['body'] as String,
      quickPhrase: jsonSerialization['quickPhrase'] == null
          ? null
          : _i3.QuickPhrase.fromJson(
              (jsonSerialization['quickPhrase'] as String),
            ),
      critical: jsonSerialization['critical'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['critical']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      clientMessageId: jsonSerialization['clientMessageId'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int threadId;

  _i2.AccountRole senderRole;

  /// id отправителя в его таблице (родитель, водитель, диспетчер).
  int senderId;

  /// Имя отправителя на момент отправки — чтобы история читалась.
  String senderName;

  String body;

  /// Готовая фраза, если сообщение отправлено кнопкой.
  _i3.QuickPhrase? quickPhrase;

  /// Критичные сообщения дублируются SMS через обычный каскад.
  bool critical;

  DateTime createdAt;

  /// Ключ идемпотентности: повторная отправка не задваивает сообщение.
  String clientMessageId;

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessage copyWith({
    int? id,
    int? threadId,
    _i2.AccountRole? senderRole,
    int? senderId,
    String? senderName,
    String? body,
    _i3.QuickPhrase? quickPhrase,
    bool? critical,
    DateTime? createdAt,
    String? clientMessageId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChatMessage',
      if (id != null) 'id': id,
      'threadId': threadId,
      'senderRole': senderRole.toJson(),
      'senderId': senderId,
      'senderName': senderName,
      'body': body,
      if (quickPhrase != null) 'quickPhrase': quickPhrase?.toJson(),
      'critical': critical,
      'createdAt': createdAt.toJson(),
      'clientMessageId': clientMessageId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageImpl extends ChatMessage {
  _ChatMessageImpl({
    int? id,
    required int threadId,
    required _i2.AccountRole senderRole,
    required int senderId,
    required String senderName,
    required String body,
    _i3.QuickPhrase? quickPhrase,
    bool? critical,
    DateTime? createdAt,
    required String clientMessageId,
  }) : super._(
         id: id,
         threadId: threadId,
         senderRole: senderRole,
         senderId: senderId,
         senderName: senderName,
         body: body,
         quickPhrase: quickPhrase,
         critical: critical,
         createdAt: createdAt,
         clientMessageId: clientMessageId,
       );

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatMessage copyWith({
    Object? id = _Undefined,
    int? threadId,
    _i2.AccountRole? senderRole,
    int? senderId,
    String? senderName,
    String? body,
    Object? quickPhrase = _Undefined,
    bool? critical,
    DateTime? createdAt,
    String? clientMessageId,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      threadId: threadId ?? this.threadId,
      senderRole: senderRole ?? this.senderRole,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      body: body ?? this.body,
      quickPhrase: quickPhrase is _i3.QuickPhrase?
          ? quickPhrase
          : this.quickPhrase,
      critical: critical ?? this.critical,
      createdAt: createdAt ?? this.createdAt,
      clientMessageId: clientMessageId ?? this.clientMessageId,
    );
  }
}
