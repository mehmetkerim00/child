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

/// Обращение, учитываемое ограничителем частоты.
///
/// Хранится в базе, а не в памяти: после перезапуска сервера окно не
/// должно обнуляться, иначе ограничение обходится перезагрузкой.
abstract class RateLimitHit
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = RateLimitHitTable();

  static const db = RateLimitHitRepository._();

  @override
  int? id;

  /// Что ограничиваем: «auth:+99365…», «chat:7».
  String bucket;

  DateTime at;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RateLimitHit',
      if (id != null) 'id': id,
      'bucket': bucket,
      'at': at.toJson(),
    };
  }

  static RateLimitHitInclude include() {
    return RateLimitHitInclude._();
  }

  static RateLimitHitIncludeList includeList({
    _i1.WhereExpressionBuilder<RateLimitHitTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RateLimitHitTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RateLimitHitTable>? orderByList,
    RateLimitHitInclude? include,
  }) {
    return RateLimitHitIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RateLimitHit.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RateLimitHit.t),
      include: include,
    );
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

class RateLimitHitUpdateTable extends _i1.UpdateTable<RateLimitHitTable> {
  RateLimitHitUpdateTable(super.table);

  _i1.ColumnValue<String, String> bucket(String value) => _i1.ColumnValue(
    table.bucket,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> at(DateTime value) => _i1.ColumnValue(
    table.at,
    value,
  );
}

class RateLimitHitTable extends _i1.Table<int?> {
  RateLimitHitTable({super.tableRelation})
    : super(tableName: 'rate_limit_hit') {
    updateTable = RateLimitHitUpdateTable(this);
    bucket = _i1.ColumnString(
      'bucket',
      this,
    );
    at = _i1.ColumnDateTime(
      'at',
      this,
    );
  }

  late final RateLimitHitUpdateTable updateTable;

  /// Что ограничиваем: «auth:+99365…», «chat:7».
  late final _i1.ColumnString bucket;

  late final _i1.ColumnDateTime at;

  @override
  List<_i1.Column> get columns => [
    id,
    bucket,
    at,
  ];
}

class RateLimitHitInclude extends _i1.IncludeObject {
  RateLimitHitInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RateLimitHit.t;
}

class RateLimitHitIncludeList extends _i1.IncludeList {
  RateLimitHitIncludeList._({
    _i1.WhereExpressionBuilder<RateLimitHitTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RateLimitHit.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RateLimitHit.t;
}

class RateLimitHitRepository {
  const RateLimitHitRepository._();

  /// Returns a list of [RateLimitHit]s matching the given query parameters.
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
  Future<List<RateLimitHit>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RateLimitHitTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RateLimitHitTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RateLimitHitTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RateLimitHit>(
      where: where?.call(RateLimitHit.t),
      orderBy: orderBy?.call(RateLimitHit.t),
      orderByList: orderByList?.call(RateLimitHit.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RateLimitHit] matching the given query parameters.
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
  Future<RateLimitHit?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RateLimitHitTable>? where,
    int? offset,
    _i1.OrderByBuilder<RateLimitHitTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RateLimitHitTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RateLimitHit>(
      where: where?.call(RateLimitHit.t),
      orderBy: orderBy?.call(RateLimitHit.t),
      orderByList: orderByList?.call(RateLimitHit.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RateLimitHit] by its [id] or null if no such row exists.
  Future<RateLimitHit?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RateLimitHit>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RateLimitHit]s in the list and returns the inserted rows.
  ///
  /// The returned [RateLimitHit]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<RateLimitHit>> insert(
    _i1.DatabaseSession session,
    List<RateLimitHit> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<RateLimitHit>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [RateLimitHit] and returns the inserted row.
  ///
  /// The returned [RateLimitHit] will have its `id` field set.
  Future<RateLimitHit> insertRow(
    _i1.DatabaseSession session,
    RateLimitHit row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RateLimitHit>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RateLimitHit]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RateLimitHit>> update(
    _i1.DatabaseSession session,
    List<RateLimitHit> rows, {
    _i1.ColumnSelections<RateLimitHitTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RateLimitHit>(
      rows,
      columns: columns?.call(RateLimitHit.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RateLimitHit]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RateLimitHit> updateRow(
    _i1.DatabaseSession session,
    RateLimitHit row, {
    _i1.ColumnSelections<RateLimitHitTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RateLimitHit>(
      row,
      columns: columns?.call(RateLimitHit.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RateLimitHit] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RateLimitHit?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<RateLimitHitUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RateLimitHit>(
      id,
      columnValues: columnValues(RateLimitHit.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RateLimitHit]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RateLimitHit>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RateLimitHitUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RateLimitHitTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RateLimitHitTable>? orderBy,
    _i1.OrderByListBuilder<RateLimitHitTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RateLimitHit>(
      columnValues: columnValues(RateLimitHit.t.updateTable),
      where: where(RateLimitHit.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RateLimitHit.t),
      orderByList: orderByList?.call(RateLimitHit.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RateLimitHit]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RateLimitHit>> delete(
    _i1.DatabaseSession session,
    List<RateLimitHit> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RateLimitHit>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RateLimitHit].
  Future<RateLimitHit> deleteRow(
    _i1.DatabaseSession session,
    RateLimitHit row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RateLimitHit>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RateLimitHit>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RateLimitHitTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RateLimitHit>(
      where: where(RateLimitHit.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RateLimitHitTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RateLimitHit>(
      where: where?.call(RateLimitHit.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RateLimitHit] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RateLimitHitTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RateLimitHit>(
      where: where(RateLimitHit.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
