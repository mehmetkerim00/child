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
import 'dispatcher_task_kind.dart' as _i2;

/// Задача диспетчеру: то, что нельзя решить автоматически.
///
/// Сюда попадают «тихие сбои»: водитель не подтвердил завтрашние поездки,
/// не выехал вовремя, не дошло ни push, ни SMS.
abstract class DispatcherTask
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = DispatcherTaskTable();

  static const db = DispatcherTaskRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static DispatcherTaskInclude include() {
    return DispatcherTaskInclude._();
  }

  static DispatcherTaskIncludeList includeList({
    _i1.WhereExpressionBuilder<DispatcherTaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DispatcherTaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DispatcherTaskTable>? orderByList,
    DispatcherTaskInclude? include,
  }) {
    return DispatcherTaskIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DispatcherTask.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DispatcherTask.t),
      include: include,
    );
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

class DispatcherTaskUpdateTable extends _i1.UpdateTable<DispatcherTaskTable> {
  DispatcherTaskUpdateTable(super.table);

  _i1.ColumnValue<_i2.DispatcherTaskKind, _i2.DispatcherTaskKind> kind(
    _i2.DispatcherTaskKind value,
  ) => _i1.ColumnValue(
    table.kind,
    value,
  );

  _i1.ColumnValue<String, String> text(String value) => _i1.ColumnValue(
    table.text,
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

  _i1.ColumnValue<int, int> driverId(int? value) => _i1.ColumnValue(
    table.driverId,
    value,
  );

  _i1.ColumnValue<String, String> dedupeKey(String value) => _i1.ColumnValue(
    table.dedupeKey,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> resolvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.resolvedAt,
        value,
      );
}

class DispatcherTaskTable extends _i1.Table<int?> {
  DispatcherTaskTable({super.tableRelation})
    : super(tableName: 'dispatcher_task') {
    updateTable = DispatcherTaskUpdateTable(this);
    kind = _i1.ColumnEnum(
      'kind',
      this,
      _i1.EnumSerialization.byName,
    );
    text = _i1.ColumnString(
      'text',
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
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    dedupeKey = _i1.ColumnString(
      'dedupeKey',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
      this,
    );
  }

  late final DispatcherTaskUpdateTable updateTable;

  late final _i1.ColumnEnum<_i2.DispatcherTaskKind> kind;

  /// Что случилось, человеческим языком — диспетчер читает и звонит.
  late final _i1.ColumnString text;

  late final _i1.ColumnInt rideId;

  late final _i1.ColumnInt familyId;

  late final _i1.ColumnInt driverId;

  /// Ключ идемпотентности: одна и та же проблема не плодит задачи.
  late final _i1.ColumnString dedupeKey;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime resolvedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    kind,
    text,
    rideId,
    familyId,
    driverId,
    dedupeKey,
    createdAt,
    resolvedAt,
  ];
}

class DispatcherTaskInclude extends _i1.IncludeObject {
  DispatcherTaskInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DispatcherTask.t;
}

class DispatcherTaskIncludeList extends _i1.IncludeList {
  DispatcherTaskIncludeList._({
    _i1.WhereExpressionBuilder<DispatcherTaskTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DispatcherTask.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DispatcherTask.t;
}

class DispatcherTaskRepository {
  const DispatcherTaskRepository._();

  /// Returns a list of [DispatcherTask]s matching the given query parameters.
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
  Future<List<DispatcherTask>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DispatcherTaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DispatcherTaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DispatcherTaskTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DispatcherTask>(
      where: where?.call(DispatcherTask.t),
      orderBy: orderBy?.call(DispatcherTask.t),
      orderByList: orderByList?.call(DispatcherTask.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [DispatcherTask] matching the given query parameters.
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
  Future<DispatcherTask?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DispatcherTaskTable>? where,
    int? offset,
    _i1.OrderByBuilder<DispatcherTaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DispatcherTaskTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DispatcherTask>(
      where: where?.call(DispatcherTask.t),
      orderBy: orderBy?.call(DispatcherTask.t),
      orderByList: orderByList?.call(DispatcherTask.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DispatcherTask] by its [id] or null if no such row exists.
  Future<DispatcherTask?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<DispatcherTask>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [DispatcherTask]s in the list and returns the inserted rows.
  ///
  /// The returned [DispatcherTask]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<DispatcherTask>> insert(
    _i1.DatabaseSession session,
    List<DispatcherTask> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<DispatcherTask>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [DispatcherTask] and returns the inserted row.
  ///
  /// The returned [DispatcherTask] will have its `id` field set.
  Future<DispatcherTask> insertRow(
    _i1.DatabaseSession session,
    DispatcherTask row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DispatcherTask>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DispatcherTask]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DispatcherTask>> update(
    _i1.DatabaseSession session,
    List<DispatcherTask> rows, {
    _i1.ColumnSelections<DispatcherTaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DispatcherTask>(
      rows,
      columns: columns?.call(DispatcherTask.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DispatcherTask]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DispatcherTask> updateRow(
    _i1.DatabaseSession session,
    DispatcherTask row, {
    _i1.ColumnSelections<DispatcherTaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DispatcherTask>(
      row,
      columns: columns?.call(DispatcherTask.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DispatcherTask] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DispatcherTask?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<DispatcherTaskUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DispatcherTask>(
      id,
      columnValues: columnValues(DispatcherTask.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DispatcherTask]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DispatcherTask>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DispatcherTaskUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DispatcherTaskTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DispatcherTaskTable>? orderBy,
    _i1.OrderByListBuilder<DispatcherTaskTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DispatcherTask>(
      columnValues: columnValues(DispatcherTask.t.updateTable),
      where: where(DispatcherTask.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DispatcherTask.t),
      orderByList: orderByList?.call(DispatcherTask.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DispatcherTask]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DispatcherTask>> delete(
    _i1.DatabaseSession session,
    List<DispatcherTask> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DispatcherTask>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DispatcherTask].
  Future<DispatcherTask> deleteRow(
    _i1.DatabaseSession session,
    DispatcherTask row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DispatcherTask>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DispatcherTask>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DispatcherTaskTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DispatcherTask>(
      where: where(DispatcherTask.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DispatcherTaskTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DispatcherTask>(
      where: where?.call(DispatcherTask.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DispatcherTask] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DispatcherTaskTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DispatcherTask>(
      where: where(DispatcherTask.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
