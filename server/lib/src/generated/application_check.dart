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
import 'check_kind.dart' as _i2;

/// Пункт чек-листа проверки кандидата.
///
/// Каждый шаг отмечает конкретный диспетчер: в найме водителей для детей
/// анонимных решений быть не должно.
abstract class ApplicationCheck
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ApplicationCheck._({
    this.id,
    required this.applicationId,
    required this.kind,
    bool? passed,
    this.note,
    this.checkedAt,
    this.checkedBy,
  }) : passed = passed ?? false;

  factory ApplicationCheck({
    int? id,
    required int applicationId,
    required _i2.CheckKind kind,
    bool? passed,
    String? note,
    DateTime? checkedAt,
    int? checkedBy,
  }) = _ApplicationCheckImpl;

  factory ApplicationCheck.fromJson(Map<String, dynamic> jsonSerialization) {
    return ApplicationCheck(
      id: jsonSerialization['id'] as int?,
      applicationId: jsonSerialization['applicationId'] as int,
      kind: _i2.CheckKind.fromJson((jsonSerialization['kind'] as String)),
      passed: jsonSerialization['passed'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['passed']),
      note: jsonSerialization['note'] as String?,
      checkedAt: jsonSerialization['checkedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['checkedAt']),
      checkedBy: jsonSerialization['checkedBy'] as int?,
    );
  }

  static final t = ApplicationCheckTable();

  static const db = ApplicationCheckRepository._();

  @override
  int? id;

  int applicationId;

  _i2.CheckKind kind;

  bool passed;

  String? note;

  DateTime? checkedAt;

  int? checkedBy;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ApplicationCheck]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ApplicationCheck copyWith({
    int? id,
    int? applicationId,
    _i2.CheckKind? kind,
    bool? passed,
    String? note,
    DateTime? checkedAt,
    int? checkedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ApplicationCheck',
      if (id != null) 'id': id,
      'applicationId': applicationId,
      'kind': kind.toJson(),
      'passed': passed,
      if (note != null) 'note': note,
      if (checkedAt != null) 'checkedAt': checkedAt?.toJson(),
      if (checkedBy != null) 'checkedBy': checkedBy,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ApplicationCheck',
      if (id != null) 'id': id,
      'applicationId': applicationId,
      'kind': kind.toJson(),
      'passed': passed,
      if (note != null) 'note': note,
      if (checkedAt != null) 'checkedAt': checkedAt?.toJson(),
      if (checkedBy != null) 'checkedBy': checkedBy,
    };
  }

  static ApplicationCheckInclude include() {
    return ApplicationCheckInclude._();
  }

  static ApplicationCheckIncludeList includeList({
    _i1.WhereExpressionBuilder<ApplicationCheckTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApplicationCheckTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApplicationCheckTable>? orderByList,
    ApplicationCheckInclude? include,
  }) {
    return ApplicationCheckIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ApplicationCheck.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ApplicationCheck.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ApplicationCheckImpl extends ApplicationCheck {
  _ApplicationCheckImpl({
    int? id,
    required int applicationId,
    required _i2.CheckKind kind,
    bool? passed,
    String? note,
    DateTime? checkedAt,
    int? checkedBy,
  }) : super._(
         id: id,
         applicationId: applicationId,
         kind: kind,
         passed: passed,
         note: note,
         checkedAt: checkedAt,
         checkedBy: checkedBy,
       );

  /// Returns a shallow copy of this [ApplicationCheck]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ApplicationCheck copyWith({
    Object? id = _Undefined,
    int? applicationId,
    _i2.CheckKind? kind,
    bool? passed,
    Object? note = _Undefined,
    Object? checkedAt = _Undefined,
    Object? checkedBy = _Undefined,
  }) {
    return ApplicationCheck(
      id: id is int? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      kind: kind ?? this.kind,
      passed: passed ?? this.passed,
      note: note is String? ? note : this.note,
      checkedAt: checkedAt is DateTime? ? checkedAt : this.checkedAt,
      checkedBy: checkedBy is int? ? checkedBy : this.checkedBy,
    );
  }
}

class ApplicationCheckUpdateTable
    extends _i1.UpdateTable<ApplicationCheckTable> {
  ApplicationCheckUpdateTable(super.table);

  _i1.ColumnValue<int, int> applicationId(int value) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<_i2.CheckKind, _i2.CheckKind> kind(_i2.CheckKind value) =>
      _i1.ColumnValue(
        table.kind,
        value,
      );

  _i1.ColumnValue<bool, bool> passed(bool value) => _i1.ColumnValue(
    table.passed,
    value,
  );

  _i1.ColumnValue<String, String> note(String? value) => _i1.ColumnValue(
    table.note,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> checkedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.checkedAt,
        value,
      );

  _i1.ColumnValue<int, int> checkedBy(int? value) => _i1.ColumnValue(
    table.checkedBy,
    value,
  );
}

class ApplicationCheckTable extends _i1.Table<int?> {
  ApplicationCheckTable({super.tableRelation})
    : super(tableName: 'application_check') {
    updateTable = ApplicationCheckUpdateTable(this);
    applicationId = _i1.ColumnInt(
      'applicationId',
      this,
    );
    kind = _i1.ColumnEnum(
      'kind',
      this,
      _i1.EnumSerialization.byName,
    );
    passed = _i1.ColumnBool(
      'passed',
      this,
      hasDefault: true,
    );
    note = _i1.ColumnString(
      'note',
      this,
    );
    checkedAt = _i1.ColumnDateTime(
      'checkedAt',
      this,
    );
    checkedBy = _i1.ColumnInt(
      'checkedBy',
      this,
    );
  }

  late final ApplicationCheckUpdateTable updateTable;

  late final _i1.ColumnInt applicationId;

  late final _i1.ColumnEnum<_i2.CheckKind> kind;

  late final _i1.ColumnBool passed;

  late final _i1.ColumnString note;

  late final _i1.ColumnDateTime checkedAt;

  late final _i1.ColumnInt checkedBy;

  @override
  List<_i1.Column> get columns => [
    id,
    applicationId,
    kind,
    passed,
    note,
    checkedAt,
    checkedBy,
  ];
}

class ApplicationCheckInclude extends _i1.IncludeObject {
  ApplicationCheckInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ApplicationCheck.t;
}

class ApplicationCheckIncludeList extends _i1.IncludeList {
  ApplicationCheckIncludeList._({
    _i1.WhereExpressionBuilder<ApplicationCheckTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ApplicationCheck.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ApplicationCheck.t;
}

class ApplicationCheckRepository {
  const ApplicationCheckRepository._();

  /// Returns a list of [ApplicationCheck]s matching the given query parameters.
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
  Future<List<ApplicationCheck>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ApplicationCheckTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApplicationCheckTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApplicationCheckTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ApplicationCheck>(
      where: where?.call(ApplicationCheck.t),
      orderBy: orderBy?.call(ApplicationCheck.t),
      orderByList: orderByList?.call(ApplicationCheck.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ApplicationCheck] matching the given query parameters.
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
  Future<ApplicationCheck?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ApplicationCheckTable>? where,
    int? offset,
    _i1.OrderByBuilder<ApplicationCheckTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApplicationCheckTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ApplicationCheck>(
      where: where?.call(ApplicationCheck.t),
      orderBy: orderBy?.call(ApplicationCheck.t),
      orderByList: orderByList?.call(ApplicationCheck.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ApplicationCheck] by its [id] or null if no such row exists.
  Future<ApplicationCheck?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ApplicationCheck>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ApplicationCheck]s in the list and returns the inserted rows.
  ///
  /// The returned [ApplicationCheck]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<ApplicationCheck>> insert(
    _i1.DatabaseSession session,
    List<ApplicationCheck> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<ApplicationCheck>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [ApplicationCheck] and returns the inserted row.
  ///
  /// The returned [ApplicationCheck] will have its `id` field set.
  Future<ApplicationCheck> insertRow(
    _i1.DatabaseSession session,
    ApplicationCheck row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ApplicationCheck>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ApplicationCheck]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ApplicationCheck>> update(
    _i1.DatabaseSession session,
    List<ApplicationCheck> rows, {
    _i1.ColumnSelections<ApplicationCheckTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ApplicationCheck>(
      rows,
      columns: columns?.call(ApplicationCheck.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ApplicationCheck]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ApplicationCheck> updateRow(
    _i1.DatabaseSession session,
    ApplicationCheck row, {
    _i1.ColumnSelections<ApplicationCheckTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ApplicationCheck>(
      row,
      columns: columns?.call(ApplicationCheck.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ApplicationCheck] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ApplicationCheck?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ApplicationCheckUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ApplicationCheck>(
      id,
      columnValues: columnValues(ApplicationCheck.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ApplicationCheck]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ApplicationCheck>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ApplicationCheckUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ApplicationCheckTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApplicationCheckTable>? orderBy,
    _i1.OrderByListBuilder<ApplicationCheckTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ApplicationCheck>(
      columnValues: columnValues(ApplicationCheck.t.updateTable),
      where: where(ApplicationCheck.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ApplicationCheck.t),
      orderByList: orderByList?.call(ApplicationCheck.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ApplicationCheck]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ApplicationCheck>> delete(
    _i1.DatabaseSession session,
    List<ApplicationCheck> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ApplicationCheck>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ApplicationCheck].
  Future<ApplicationCheck> deleteRow(
    _i1.DatabaseSession session,
    ApplicationCheck row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ApplicationCheck>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ApplicationCheck>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ApplicationCheckTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ApplicationCheck>(
      where: where(ApplicationCheck.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ApplicationCheckTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ApplicationCheck>(
      where: where?.call(ApplicationCheck.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ApplicationCheck] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ApplicationCheckTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ApplicationCheck>(
      where: where(ApplicationCheck.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
