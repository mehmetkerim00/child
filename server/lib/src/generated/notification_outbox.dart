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
import 'notification_status.dart' as _i2;
import 'account_role.dart' as _i3;
import 'notification_channel.dart' as _i4;

/// Очередь исходящих уведомлений — сердце SMS-фолбэка (MVP_PLAN §6).
///
/// Одна строка = одна попытка доставить одно событие одному получателю
/// по одному каналу. Push и SMS по одному событию — две разные строки.
abstract class NotificationOutbox
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = NotificationOutboxTable();

  static const db = NotificationOutboxRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static NotificationOutboxInclude include() {
    return NotificationOutboxInclude._();
  }

  static NotificationOutboxIncludeList includeList({
    _i1.WhereExpressionBuilder<NotificationOutboxTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationOutboxTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationOutboxTable>? orderByList,
    NotificationOutboxInclude? include,
  }) {
    return NotificationOutboxIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationOutbox.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NotificationOutbox.t),
      include: include,
    );
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

class NotificationOutboxUpdateTable
    extends _i1.UpdateTable<NotificationOutboxTable> {
  NotificationOutboxUpdateTable(super.table);

  _i1.ColumnValue<String, String> dedupeKey(String value) => _i1.ColumnValue(
    table.dedupeKey,
    value,
  );

  _i1.ColumnValue<String, String> eventKind(String value) => _i1.ColumnValue(
    table.eventKind,
    value,
  );

  _i1.ColumnValue<bool, bool> critical(bool value) => _i1.ColumnValue(
    table.critical,
    value,
  );

  _i1.ColumnValue<String, String> recipientPhone(String value) =>
      _i1.ColumnValue(
        table.recipientPhone,
        value,
      );

  _i1.ColumnValue<_i3.AccountRole, _i3.AccountRole> recipientRole(
    _i3.AccountRole value,
  ) => _i1.ColumnValue(
    table.recipientRole,
    value,
  );

  _i1.ColumnValue<_i4.NotificationChannel, _i4.NotificationChannel> channel(
    _i4.NotificationChannel value,
  ) => _i1.ColumnValue(
    table.channel,
    value,
  );

  _i1.ColumnValue<_i2.NotificationStatus, _i2.NotificationStatus> status(
    _i2.NotificationStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<int, int> attempts(int value) => _i1.ColumnValue(
    table.attempts,
    value,
  );

  _i1.ColumnValue<String, String> body(String value) => _i1.ColumnValue(
    table.body,
    value,
  );

  _i1.ColumnValue<int, int> rideId(int? value) => _i1.ColumnValue(
    table.rideId,
    value,
  );

  _i1.ColumnValue<int, int> familyId(int? value) => _i1.ColumnValue(
    table.familyId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> nextAttemptAt(DateTime? value) =>
      _i1.ColumnValue(
        table.nextAttemptAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> sentAt(DateTime? value) =>
      _i1.ColumnValue(
        table.sentAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> ackedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.ackedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> ackDeadline(DateTime? value) =>
      _i1.ColumnValue(
        table.ackDeadline,
        value,
      );

  _i1.ColumnValue<String, String> lastError(String? value) => _i1.ColumnValue(
    table.lastError,
    value,
  );
}

class NotificationOutboxTable extends _i1.Table<int?> {
  NotificationOutboxTable({super.tableRelation})
    : super(tableName: 'notification_outbox') {
    updateTable = NotificationOutboxUpdateTable(this);
    dedupeKey = _i1.ColumnString(
      'dedupeKey',
      this,
    );
    eventKind = _i1.ColumnString(
      'eventKind',
      this,
    );
    critical = _i1.ColumnBool(
      'critical',
      this,
      hasDefault: true,
    );
    recipientPhone = _i1.ColumnString(
      'recipientPhone',
      this,
    );
    recipientRole = _i1.ColumnEnum(
      'recipientRole',
      this,
      _i1.EnumSerialization.byName,
    );
    channel = _i1.ColumnEnum(
      'channel',
      this,
      _i1.EnumSerialization.byName,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    attempts = _i1.ColumnInt(
      'attempts',
      this,
      hasDefault: true,
    );
    body = _i1.ColumnString(
      'body',
      this,
    );
    rideId = _i1.ColumnInt(
      'rideId',
      this,
    );
    familyId = _i1.ColumnInt(
      'familyId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    nextAttemptAt = _i1.ColumnDateTime(
      'nextAttemptAt',
      this,
    );
    sentAt = _i1.ColumnDateTime(
      'sentAt',
      this,
    );
    ackedAt = _i1.ColumnDateTime(
      'ackedAt',
      this,
    );
    ackDeadline = _i1.ColumnDateTime(
      'ackDeadline',
      this,
    );
    lastError = _i1.ColumnString(
      'lastError',
      this,
    );
  }

  late final NotificationOutboxUpdateTable updateTable;

  /// Ключ идемпотентности: событие + получатель + канал.
  /// Уникальный индекс не даёт отправить одно и то же дважды.
  late final _i1.ColumnString dedupeKey;

  /// Событие, породившее уведомление, например ride.pickedUp.
  late final _i1.ColumnString eventKind;

  /// Критические события уходят по SMS сразу, не дожидаясь ack.
  late final _i1.ColumnBool critical;

  late final _i1.ColumnString recipientPhone;

  /// Кому: родитель, водитель или диспетчер.
  late final _i1.ColumnEnum<_i3.AccountRole> recipientRole;

  late final _i1.ColumnEnum<_i4.NotificationChannel> channel;

  late final _i1.ColumnEnum<_i2.NotificationStatus> status;

  late final _i1.ColumnInt attempts;

  /// Готовый текст на языке получателя.
  late final _i1.ColumnString body;

  late final _i1.ColumnInt rideId;

  late final _i1.ColumnInt familyId;

  late final _i1.ColumnDateTime createdAt;

  /// Когда можно делать следующую попытку (нарастающая пауза).
  late final _i1.ColumnDateTime nextAttemptAt;

  late final _i1.ColumnDateTime sentAt;

  /// Приложение подтвердило получение push.
  late final _i1.ColumnDateTime ackedAt;

  /// До этого момента ждём ack, потом включаем SMS-фолбэк.
  late final _i1.ColumnDateTime ackDeadline;

  late final _i1.ColumnString lastError;

  @override
  List<_i1.Column> get columns => [
    id,
    dedupeKey,
    eventKind,
    critical,
    recipientPhone,
    recipientRole,
    channel,
    status,
    attempts,
    body,
    rideId,
    familyId,
    createdAt,
    nextAttemptAt,
    sentAt,
    ackedAt,
    ackDeadline,
    lastError,
  ];
}

class NotificationOutboxInclude extends _i1.IncludeObject {
  NotificationOutboxInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => NotificationOutbox.t;
}

class NotificationOutboxIncludeList extends _i1.IncludeList {
  NotificationOutboxIncludeList._({
    _i1.WhereExpressionBuilder<NotificationOutboxTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NotificationOutbox.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => NotificationOutbox.t;
}

class NotificationOutboxRepository {
  const NotificationOutboxRepository._();

  /// Returns a list of [NotificationOutbox]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<NotificationOutbox>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationOutboxTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationOutboxTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationOutboxTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<NotificationOutbox>(
      where: where?.call(NotificationOutbox.t),
      orderBy: orderBy?.call(NotificationOutbox.t),
      orderByList: orderByList?.call(NotificationOutbox.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [NotificationOutbox] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<NotificationOutbox?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationOutboxTable>? where,
    int? offset,
    _i1.OrderByBuilder<NotificationOutboxTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationOutboxTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<NotificationOutbox>(
      where: where?.call(NotificationOutbox.t),
      orderBy: orderBy?.call(NotificationOutbox.t),
      orderByList: orderByList?.call(NotificationOutbox.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [NotificationOutbox] by its [id] or null if no such row exists.
  Future<NotificationOutbox?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<NotificationOutbox>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [NotificationOutbox]s in the list and returns the inserted rows.
  ///
  /// The returned [NotificationOutbox]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<NotificationOutbox>> insert(
    _i1.DatabaseSession session,
    List<NotificationOutbox> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<NotificationOutbox>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [NotificationOutbox] and returns the inserted row.
  ///
  /// The returned [NotificationOutbox] will have its `id` field set.
  Future<NotificationOutbox> insertRow(
    _i1.DatabaseSession session,
    NotificationOutbox row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NotificationOutbox>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [NotificationOutbox]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<NotificationOutbox>> update(
    _i1.DatabaseSession session,
    List<NotificationOutbox> rows, {
    _i1.ColumnSelections<NotificationOutboxTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NotificationOutbox>(
      rows,
      columns: columns?.call(NotificationOutbox.t),
      transaction: transaction,
    );
  }

  /// Updates a single [NotificationOutbox]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<NotificationOutbox> updateRow(
    _i1.DatabaseSession session,
    NotificationOutbox row, {
    _i1.ColumnSelections<NotificationOutboxTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NotificationOutbox>(
      row,
      columns: columns?.call(NotificationOutbox.t),
      transaction: transaction,
    );
  }

  /// Updates a single [NotificationOutbox] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<NotificationOutbox?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<NotificationOutboxUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<NotificationOutbox>(
      id,
      columnValues: columnValues(NotificationOutbox.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [NotificationOutbox]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<NotificationOutbox>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<NotificationOutboxUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<NotificationOutboxTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationOutboxTable>? orderBy,
    _i1.OrderByListBuilder<NotificationOutboxTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<NotificationOutbox>(
      columnValues: columnValues(NotificationOutbox.t.updateTable),
      where: where(NotificationOutbox.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationOutbox.t),
      orderByList: orderByList?.call(NotificationOutbox.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [NotificationOutbox]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<NotificationOutbox>> delete(
    _i1.DatabaseSession session,
    List<NotificationOutbox> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NotificationOutbox>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [NotificationOutbox].
  Future<NotificationOutbox> deleteRow(
    _i1.DatabaseSession session,
    NotificationOutbox row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NotificationOutbox>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<NotificationOutbox>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationOutboxTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NotificationOutbox>(
      where: where(NotificationOutbox.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationOutboxTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NotificationOutbox>(
      where: where?.call(NotificationOutbox.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [NotificationOutbox] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationOutboxTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<NotificationOutbox>(
      where: where(NotificationOutbox.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
