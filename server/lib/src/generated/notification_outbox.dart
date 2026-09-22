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
import 'notification_channel.dart' as _i3;

/// Очередь исходящих уведомлений — сердце SMS-фолбэка (MVP_PLAN §6).
abstract class NotificationOutbox
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = NotificationOutboxTable();

  static const db = NotificationOutboxRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

class NotificationOutboxUpdateTable
    extends _i1.UpdateTable<NotificationOutboxTable> {
  NotificationOutboxUpdateTable(super.table);

  _i1.ColumnValue<String, String> eventKind(String value) => _i1.ColumnValue(
    table.eventKind,
    value,
  );

  _i1.ColumnValue<String, String> recipientPhone(String value) =>
      _i1.ColumnValue(
        table.recipientPhone,
        value,
      );

  _i1.ColumnValue<_i3.NotificationChannel, _i3.NotificationChannel> channel(
    _i3.NotificationChannel value,
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

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> sentAt(DateTime? value) =>
      _i1.ColumnValue(
        table.sentAt,
        value,
      );
}

class NotificationOutboxTable extends _i1.Table<int?> {
  NotificationOutboxTable({super.tableRelation})
    : super(tableName: 'notification_outbox') {
    updateTable = NotificationOutboxUpdateTable(this);
    eventKind = _i1.ColumnString(
      'eventKind',
      this,
    );
    recipientPhone = _i1.ColumnString(
      'recipientPhone',
      this,
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
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    sentAt = _i1.ColumnDateTime(
      'sentAt',
      this,
    );
  }

  late final NotificationOutboxUpdateTable updateTable;

  /// Событие, породившее уведомление, например ride.pickedUp.
  late final _i1.ColumnString eventKind;

  late final _i1.ColumnString recipientPhone;

  late final _i1.ColumnEnum<_i3.NotificationChannel> channel;

  late final _i1.ColumnEnum<_i2.NotificationStatus> status;

  late final _i1.ColumnInt attempts;

  /// Готовый текст сообщения на языке получателя.
  late final _i1.ColumnString body;

  late final _i1.ColumnInt rideId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime sentAt;

  @override
  List<_i1.Column> get columns => [
    id,
    eventKind,
    recipientPhone,
    channel,
    status,
    attempts,
    body,
    rideId,
    createdAt,
    sentAt,
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
