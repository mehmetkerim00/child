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

/// Одноразовая ссылка на выгрузку отчёта.
///
/// Файл с выручкой и балансами семей открывается в браузере без входа,
/// поэтому ссылка живёт минуты и сгорает после первого скачивания.
abstract class ReportExport
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ReportExport._({
    this.id,
    required this.tokenHash,
    required this.ownerId,
    required this.fromDate,
    required this.toDate,
    required this.smsPriceTenge,
    required this.blockPayTenge,
    required this.perRideTenge,
    required this.createdAt,
    required this.expiresAt,
    this.usedAt,
  });

  factory ReportExport({
    int? id,
    required String tokenHash,
    required int ownerId,
    required DateTime fromDate,
    required DateTime toDate,
    required int smsPriceTenge,
    required int blockPayTenge,
    required int perRideTenge,
    required DateTime createdAt,
    required DateTime expiresAt,
    DateTime? usedAt,
  }) = _ReportExportImpl;

  factory ReportExport.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReportExport(
      id: jsonSerialization['id'] as int?,
      tokenHash: jsonSerialization['tokenHash'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      fromDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['fromDate'],
      ),
      toDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['toDate']),
      smsPriceTenge: jsonSerialization['smsPriceTenge'] as int,
      blockPayTenge: jsonSerialization['blockPayTenge'] as int,
      perRideTenge: jsonSerialization['perRideTenge'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      usedAt: jsonSerialization['usedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['usedAt']),
    );
  }

  static final t = ReportExportTable();

  static const db = ReportExportRepository._();

  @override
  int? id;

  String tokenHash;

  int ownerId;

  DateTime fromDate;

  DateTime toDate;

  /// Ставки, по которым считать: они же были на экране у владельца.
  int smsPriceTenge;

  int blockPayTenge;

  int perRideTenge;

  DateTime createdAt;

  DateTime expiresAt;

  DateTime? usedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ReportExport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReportExport copyWith({
    int? id,
    String? tokenHash,
    int? ownerId,
    DateTime? fromDate,
    DateTime? toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
    DateTime? createdAt,
    DateTime? expiresAt,
    DateTime? usedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReportExport',
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'ownerId': ownerId,
      'fromDate': fromDate.toJson(),
      'toDate': toDate.toJson(),
      'smsPriceTenge': smsPriceTenge,
      'blockPayTenge': blockPayTenge,
      'perRideTenge': perRideTenge,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      if (usedAt != null) 'usedAt': usedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReportExport',
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'ownerId': ownerId,
      'fromDate': fromDate.toJson(),
      'toDate': toDate.toJson(),
      'smsPriceTenge': smsPriceTenge,
      'blockPayTenge': blockPayTenge,
      'perRideTenge': perRideTenge,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      if (usedAt != null) 'usedAt': usedAt?.toJson(),
    };
  }

  static ReportExportInclude include() {
    return ReportExportInclude._();
  }

  static ReportExportIncludeList includeList({
    _i1.WhereExpressionBuilder<ReportExportTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReportExportTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReportExportTable>? orderByList,
    ReportExportInclude? include,
  }) {
    return ReportExportIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReportExport.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ReportExport.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReportExportImpl extends ReportExport {
  _ReportExportImpl({
    int? id,
    required String tokenHash,
    required int ownerId,
    required DateTime fromDate,
    required DateTime toDate,
    required int smsPriceTenge,
    required int blockPayTenge,
    required int perRideTenge,
    required DateTime createdAt,
    required DateTime expiresAt,
    DateTime? usedAt,
  }) : super._(
         id: id,
         tokenHash: tokenHash,
         ownerId: ownerId,
         fromDate: fromDate,
         toDate: toDate,
         smsPriceTenge: smsPriceTenge,
         blockPayTenge: blockPayTenge,
         perRideTenge: perRideTenge,
         createdAt: createdAt,
         expiresAt: expiresAt,
         usedAt: usedAt,
       );

  /// Returns a shallow copy of this [ReportExport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReportExport copyWith({
    Object? id = _Undefined,
    String? tokenHash,
    int? ownerId,
    DateTime? fromDate,
    DateTime? toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
    DateTime? createdAt,
    DateTime? expiresAt,
    Object? usedAt = _Undefined,
  }) {
    return ReportExport(
      id: id is int? ? id : this.id,
      tokenHash: tokenHash ?? this.tokenHash,
      ownerId: ownerId ?? this.ownerId,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      smsPriceTenge: smsPriceTenge ?? this.smsPriceTenge,
      blockPayTenge: blockPayTenge ?? this.blockPayTenge,
      perRideTenge: perRideTenge ?? this.perRideTenge,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      usedAt: usedAt is DateTime? ? usedAt : this.usedAt,
    );
  }
}

class ReportExportUpdateTable extends _i1.UpdateTable<ReportExportTable> {
  ReportExportUpdateTable(super.table);

  _i1.ColumnValue<String, String> tokenHash(String value) => _i1.ColumnValue(
    table.tokenHash,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> fromDate(DateTime value) =>
      _i1.ColumnValue(
        table.fromDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> toDate(DateTime value) => _i1.ColumnValue(
    table.toDate,
    value,
  );

  _i1.ColumnValue<int, int> smsPriceTenge(int value) => _i1.ColumnValue(
    table.smsPriceTenge,
    value,
  );

  _i1.ColumnValue<int, int> blockPayTenge(int value) => _i1.ColumnValue(
    table.blockPayTenge,
    value,
  );

  _i1.ColumnValue<int, int> perRideTenge(int value) => _i1.ColumnValue(
    table.perRideTenge,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> usedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.usedAt,
        value,
      );
}

class ReportExportTable extends _i1.Table<int?> {
  ReportExportTable({super.tableRelation}) : super(tableName: 'report_export') {
    updateTable = ReportExportUpdateTable(this);
    tokenHash = _i1.ColumnString(
      'tokenHash',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    fromDate = _i1.ColumnDateTime(
      'fromDate',
      this,
    );
    toDate = _i1.ColumnDateTime(
      'toDate',
      this,
    );
    smsPriceTenge = _i1.ColumnInt(
      'smsPriceTenge',
      this,
    );
    blockPayTenge = _i1.ColumnInt(
      'blockPayTenge',
      this,
    );
    perRideTenge = _i1.ColumnInt(
      'perRideTenge',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    usedAt = _i1.ColumnDateTime(
      'usedAt',
      this,
    );
  }

  late final ReportExportUpdateTable updateTable;

  late final _i1.ColumnString tokenHash;

  late final _i1.ColumnInt ownerId;

  late final _i1.ColumnDateTime fromDate;

  late final _i1.ColumnDateTime toDate;

  /// Ставки, по которым считать: они же были на экране у владельца.
  late final _i1.ColumnInt smsPriceTenge;

  late final _i1.ColumnInt blockPayTenge;

  late final _i1.ColumnInt perRideTenge;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime usedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    tokenHash,
    ownerId,
    fromDate,
    toDate,
    smsPriceTenge,
    blockPayTenge,
    perRideTenge,
    createdAt,
    expiresAt,
    usedAt,
  ];
}

class ReportExportInclude extends _i1.IncludeObject {
  ReportExportInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ReportExport.t;
}

class ReportExportIncludeList extends _i1.IncludeList {
  ReportExportIncludeList._({
    _i1.WhereExpressionBuilder<ReportExportTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ReportExport.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ReportExport.t;
}

class ReportExportRepository {
  const ReportExportRepository._();

  /// Returns a list of [ReportExport]s matching the given query parameters.
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
  Future<List<ReportExport>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReportExportTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReportExportTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReportExportTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ReportExport>(
      where: where?.call(ReportExport.t),
      orderBy: orderBy?.call(ReportExport.t),
      orderByList: orderByList?.call(ReportExport.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ReportExport] matching the given query parameters.
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
  Future<ReportExport?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReportExportTable>? where,
    int? offset,
    _i1.OrderByBuilder<ReportExportTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReportExportTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ReportExport>(
      where: where?.call(ReportExport.t),
      orderBy: orderBy?.call(ReportExport.t),
      orderByList: orderByList?.call(ReportExport.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ReportExport] by its [id] or null if no such row exists.
  Future<ReportExport?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ReportExport>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ReportExport]s in the list and returns the inserted rows.
  ///
  /// The returned [ReportExport]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<ReportExport>> insert(
    _i1.DatabaseSession session,
    List<ReportExport> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<ReportExport>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [ReportExport] and returns the inserted row.
  ///
  /// The returned [ReportExport] will have its `id` field set.
  Future<ReportExport> insertRow(
    _i1.DatabaseSession session,
    ReportExport row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ReportExport>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ReportExport]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ReportExport>> update(
    _i1.DatabaseSession session,
    List<ReportExport> rows, {
    _i1.ColumnSelections<ReportExportTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ReportExport>(
      rows,
      columns: columns?.call(ReportExport.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ReportExport]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ReportExport> updateRow(
    _i1.DatabaseSession session,
    ReportExport row, {
    _i1.ColumnSelections<ReportExportTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ReportExport>(
      row,
      columns: columns?.call(ReportExport.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ReportExport] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ReportExport?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ReportExportUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ReportExport>(
      id,
      columnValues: columnValues(ReportExport.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ReportExport]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ReportExport>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ReportExportUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ReportExportTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReportExportTable>? orderBy,
    _i1.OrderByListBuilder<ReportExportTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ReportExport>(
      columnValues: columnValues(ReportExport.t.updateTable),
      where: where(ReportExport.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReportExport.t),
      orderByList: orderByList?.call(ReportExport.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ReportExport]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ReportExport>> delete(
    _i1.DatabaseSession session,
    List<ReportExport> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ReportExport>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ReportExport].
  Future<ReportExport> deleteRow(
    _i1.DatabaseSession session,
    ReportExport row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ReportExport>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ReportExport>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ReportExportTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ReportExport>(
      where: where(ReportExport.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReportExportTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ReportExport>(
      where: where?.call(ReportExport.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ReportExport] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ReportExportTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ReportExport>(
      where: where(ReportExport.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
