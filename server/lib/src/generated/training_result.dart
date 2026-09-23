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

/// Результат обучения водителя.
///
/// Без сданного теста маршруты не назначаются: протокол передачи
/// ребёнка нельзя «выучить по ходу».
abstract class TrainingResult
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TrainingResult._({
    this.id,
    required this.driverId,
    required this.correct,
    required this.total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) : passed = passed ?? false,
       attempt = attempt ?? 1,
       createdAt = createdAt ?? DateTime.now();

  factory TrainingResult({
    int? id,
    required int driverId,
    required int correct,
    required int total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) = _TrainingResultImpl;

  factory TrainingResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrainingResult(
      id: jsonSerialization['id'] as int?,
      driverId: jsonSerialization['driverId'] as int,
      correct: jsonSerialization['correct'] as int,
      total: jsonSerialization['total'] as int,
      passed: jsonSerialization['passed'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['passed']),
      attempt: jsonSerialization['attempt'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = TrainingResultTable();

  static const db = TrainingResultRepository._();

  @override
  int? id;

  int driverId;

  /// Сколько верных ответов из общего числа.
  int correct;

  int total;

  bool passed;

  int attempt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TrainingResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TrainingResult copyWith({
    int? id,
    int? driverId,
    int? correct,
    int? total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrainingResult',
      if (id != null) 'id': id,
      'driverId': driverId,
      'correct': correct,
      'total': total,
      'passed': passed,
      'attempt': attempt,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TrainingResult',
      if (id != null) 'id': id,
      'driverId': driverId,
      'correct': correct,
      'total': total,
      'passed': passed,
      'attempt': attempt,
      'createdAt': createdAt.toJson(),
    };
  }

  static TrainingResultInclude include() {
    return TrainingResultInclude._();
  }

  static TrainingResultIncludeList includeList({
    _i1.WhereExpressionBuilder<TrainingResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrainingResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrainingResultTable>? orderByList,
    TrainingResultInclude? include,
  }) {
    return TrainingResultIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TrainingResult.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TrainingResult.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrainingResultImpl extends TrainingResult {
  _TrainingResultImpl({
    int? id,
    required int driverId,
    required int correct,
    required int total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         driverId: driverId,
         correct: correct,
         total: total,
         passed: passed,
         attempt: attempt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [TrainingResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TrainingResult copyWith({
    Object? id = _Undefined,
    int? driverId,
    int? correct,
    int? total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) {
    return TrainingResult(
      id: id is int? ? id : this.id,
      driverId: driverId ?? this.driverId,
      correct: correct ?? this.correct,
      total: total ?? this.total,
      passed: passed ?? this.passed,
      attempt: attempt ?? this.attempt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class TrainingResultUpdateTable extends _i1.UpdateTable<TrainingResultTable> {
  TrainingResultUpdateTable(super.table);

  _i1.ColumnValue<int, int> driverId(int value) => _i1.ColumnValue(
    table.driverId,
    value,
  );

  _i1.ColumnValue<int, int> correct(int value) => _i1.ColumnValue(
    table.correct,
    value,
  );

  _i1.ColumnValue<int, int> total(int value) => _i1.ColumnValue(
    table.total,
    value,
  );

  _i1.ColumnValue<bool, bool> passed(bool value) => _i1.ColumnValue(
    table.passed,
    value,
  );

  _i1.ColumnValue<int, int> attempt(int value) => _i1.ColumnValue(
    table.attempt,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class TrainingResultTable extends _i1.Table<int?> {
  TrainingResultTable({super.tableRelation})
    : super(tableName: 'training_result') {
    updateTable = TrainingResultUpdateTable(this);
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    correct = _i1.ColumnInt(
      'correct',
      this,
    );
    total = _i1.ColumnInt(
      'total',
      this,
    );
    passed = _i1.ColumnBool(
      'passed',
      this,
      hasDefault: true,
    );
    attempt = _i1.ColumnInt(
      'attempt',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final TrainingResultUpdateTable updateTable;

  late final _i1.ColumnInt driverId;

  /// Сколько верных ответов из общего числа.
  late final _i1.ColumnInt correct;

  late final _i1.ColumnInt total;

  late final _i1.ColumnBool passed;

  late final _i1.ColumnInt attempt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    driverId,
    correct,
    total,
    passed,
    attempt,
    createdAt,
  ];
}

class TrainingResultInclude extends _i1.IncludeObject {
  TrainingResultInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TrainingResult.t;
}

class TrainingResultIncludeList extends _i1.IncludeList {
  TrainingResultIncludeList._({
    _i1.WhereExpressionBuilder<TrainingResultTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TrainingResult.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TrainingResult.t;
}

class TrainingResultRepository {
  const TrainingResultRepository._();

  /// Returns a list of [TrainingResult]s matching the given query parameters.
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
  Future<List<TrainingResult>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TrainingResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrainingResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrainingResultTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TrainingResult>(
      where: where?.call(TrainingResult.t),
      orderBy: orderBy?.call(TrainingResult.t),
      orderByList: orderByList?.call(TrainingResult.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TrainingResult] matching the given query parameters.
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
  Future<TrainingResult?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TrainingResultTable>? where,
    int? offset,
    _i1.OrderByBuilder<TrainingResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrainingResultTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TrainingResult>(
      where: where?.call(TrainingResult.t),
      orderBy: orderBy?.call(TrainingResult.t),
      orderByList: orderByList?.call(TrainingResult.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TrainingResult] by its [id] or null if no such row exists.
  Future<TrainingResult?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TrainingResult>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TrainingResult]s in the list and returns the inserted rows.
  ///
  /// The returned [TrainingResult]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<TrainingResult>> insert(
    _i1.DatabaseSession session,
    List<TrainingResult> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<TrainingResult>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [TrainingResult] and returns the inserted row.
  ///
  /// The returned [TrainingResult] will have its `id` field set.
  Future<TrainingResult> insertRow(
    _i1.DatabaseSession session,
    TrainingResult row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TrainingResult>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TrainingResult]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TrainingResult>> update(
    _i1.DatabaseSession session,
    List<TrainingResult> rows, {
    _i1.ColumnSelections<TrainingResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TrainingResult>(
      rows,
      columns: columns?.call(TrainingResult.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TrainingResult]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TrainingResult> updateRow(
    _i1.DatabaseSession session,
    TrainingResult row, {
    _i1.ColumnSelections<TrainingResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TrainingResult>(
      row,
      columns: columns?.call(TrainingResult.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TrainingResult] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TrainingResult?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<TrainingResultUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TrainingResult>(
      id,
      columnValues: columnValues(TrainingResult.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TrainingResult]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TrainingResult>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<TrainingResultUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TrainingResultTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrainingResultTable>? orderBy,
    _i1.OrderByListBuilder<TrainingResultTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TrainingResult>(
      columnValues: columnValues(TrainingResult.t.updateTable),
      where: where(TrainingResult.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TrainingResult.t),
      orderByList: orderByList?.call(TrainingResult.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TrainingResult]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TrainingResult>> delete(
    _i1.DatabaseSession session,
    List<TrainingResult> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TrainingResult>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TrainingResult].
  Future<TrainingResult> deleteRow(
    _i1.DatabaseSession session,
    TrainingResult row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TrainingResult>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TrainingResult>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<TrainingResultTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TrainingResult>(
      where: where(TrainingResult.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TrainingResultTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TrainingResult>(
      where: where?.call(TrainingResult.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TrainingResult] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<TrainingResultTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TrainingResult>(
      where: where(TrainingResult.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
