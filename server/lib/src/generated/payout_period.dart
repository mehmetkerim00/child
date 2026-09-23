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

/// Расчёт водителю за период.
///
/// Оплата по блокам: утренний и дневной блок оплачиваются гарантированно,
/// даже если поездок в блоке оказалось меньше — иначе водителя не удержать.
abstract class PayoutPeriod
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PayoutPeriod._({
    this.id,
    required this.driverId,
    required this.fromDate,
    required this.toDate,
    required this.blocks,
    required this.blockPayTenge,
    required this.ridePayTenge,
    required this.totalTenge,
    this.paidAt,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory PayoutPeriod({
    int? id,
    required int driverId,
    required DateTime fromDate,
    required DateTime toDate,
    required int blocks,
    required int blockPayTenge,
    required int ridePayTenge,
    required int totalTenge,
    DateTime? paidAt,
    DateTime? createdAt,
  }) = _PayoutPeriodImpl;

  factory PayoutPeriod.fromJson(Map<String, dynamic> jsonSerialization) {
    return PayoutPeriod(
      id: jsonSerialization['id'] as int?,
      driverId: jsonSerialization['driverId'] as int,
      fromDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['fromDate'],
      ),
      toDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['toDate']),
      blocks: jsonSerialization['blocks'] as int,
      blockPayTenge: jsonSerialization['blockPayTenge'] as int,
      ridePayTenge: jsonSerialization['ridePayTenge'] as int,
      totalTenge: jsonSerialization['totalTenge'] as int,
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = PayoutPeriodTable();

  static const db = PayoutPeriodRepository._();

  @override
  int? id;

  int driverId;

  DateTime fromDate;

  DateTime toDate;

  /// Сколько блоков отработано.
  int blocks;

  /// Гарантированная оплата за блоки, тенге.
  int blockPayTenge;

  /// Доплата за поездки сверх блоков, тенге.
  int ridePayTenge;

  /// Итого к выплате, тенге.
  int totalTenge;

  DateTime? paidAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PayoutPeriod]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PayoutPeriod copyWith({
    int? id,
    int? driverId,
    DateTime? fromDate,
    DateTime? toDate,
    int? blocks,
    int? blockPayTenge,
    int? ridePayTenge,
    int? totalTenge,
    DateTime? paidAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PayoutPeriod',
      if (id != null) 'id': id,
      'driverId': driverId,
      'fromDate': fromDate.toJson(),
      'toDate': toDate.toJson(),
      'blocks': blocks,
      'blockPayTenge': blockPayTenge,
      'ridePayTenge': ridePayTenge,
      'totalTenge': totalTenge,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PayoutPeriod',
      if (id != null) 'id': id,
      'driverId': driverId,
      'fromDate': fromDate.toJson(),
      'toDate': toDate.toJson(),
      'blocks': blocks,
      'blockPayTenge': blockPayTenge,
      'ridePayTenge': ridePayTenge,
      'totalTenge': totalTenge,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static PayoutPeriodInclude include() {
    return PayoutPeriodInclude._();
  }

  static PayoutPeriodIncludeList includeList({
    _i1.WhereExpressionBuilder<PayoutPeriodTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PayoutPeriodTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PayoutPeriodTable>? orderByList,
    PayoutPeriodInclude? include,
  }) {
    return PayoutPeriodIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PayoutPeriod.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PayoutPeriod.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PayoutPeriodImpl extends PayoutPeriod {
  _PayoutPeriodImpl({
    int? id,
    required int driverId,
    required DateTime fromDate,
    required DateTime toDate,
    required int blocks,
    required int blockPayTenge,
    required int ridePayTenge,
    required int totalTenge,
    DateTime? paidAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         driverId: driverId,
         fromDate: fromDate,
         toDate: toDate,
         blocks: blocks,
         blockPayTenge: blockPayTenge,
         ridePayTenge: ridePayTenge,
         totalTenge: totalTenge,
         paidAt: paidAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PayoutPeriod]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PayoutPeriod copyWith({
    Object? id = _Undefined,
    int? driverId,
    DateTime? fromDate,
    DateTime? toDate,
    int? blocks,
    int? blockPayTenge,
    int? ridePayTenge,
    int? totalTenge,
    Object? paidAt = _Undefined,
    DateTime? createdAt,
  }) {
    return PayoutPeriod(
      id: id is int? ? id : this.id,
      driverId: driverId ?? this.driverId,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      blocks: blocks ?? this.blocks,
      blockPayTenge: blockPayTenge ?? this.blockPayTenge,
      ridePayTenge: ridePayTenge ?? this.ridePayTenge,
      totalTenge: totalTenge ?? this.totalTenge,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class PayoutPeriodUpdateTable extends _i1.UpdateTable<PayoutPeriodTable> {
  PayoutPeriodUpdateTable(super.table);

  _i1.ColumnValue<int, int> driverId(int value) => _i1.ColumnValue(
    table.driverId,
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

  _i1.ColumnValue<int, int> blocks(int value) => _i1.ColumnValue(
    table.blocks,
    value,
  );

  _i1.ColumnValue<int, int> blockPayTenge(int value) => _i1.ColumnValue(
    table.blockPayTenge,
    value,
  );

  _i1.ColumnValue<int, int> ridePayTenge(int value) => _i1.ColumnValue(
    table.ridePayTenge,
    value,
  );

  _i1.ColumnValue<int, int> totalTenge(int value) => _i1.ColumnValue(
    table.totalTenge,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> paidAt(DateTime? value) =>
      _i1.ColumnValue(
        table.paidAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class PayoutPeriodTable extends _i1.Table<int?> {
  PayoutPeriodTable({super.tableRelation}) : super(tableName: 'payout_period') {
    updateTable = PayoutPeriodUpdateTable(this);
    driverId = _i1.ColumnInt(
      'driverId',
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
    blocks = _i1.ColumnInt(
      'blocks',
      this,
    );
    blockPayTenge = _i1.ColumnInt(
      'blockPayTenge',
      this,
    );
    ridePayTenge = _i1.ColumnInt(
      'ridePayTenge',
      this,
    );
    totalTenge = _i1.ColumnInt(
      'totalTenge',
      this,
    );
    paidAt = _i1.ColumnDateTime(
      'paidAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final PayoutPeriodUpdateTable updateTable;

  late final _i1.ColumnInt driverId;

  late final _i1.ColumnDateTime fromDate;

  late final _i1.ColumnDateTime toDate;

  /// Сколько блоков отработано.
  late final _i1.ColumnInt blocks;

  /// Гарантированная оплата за блоки, тенге.
  late final _i1.ColumnInt blockPayTenge;

  /// Доплата за поездки сверх блоков, тенге.
  late final _i1.ColumnInt ridePayTenge;

  /// Итого к выплате, тенге.
  late final _i1.ColumnInt totalTenge;

  late final _i1.ColumnDateTime paidAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    driverId,
    fromDate,
    toDate,
    blocks,
    blockPayTenge,
    ridePayTenge,
    totalTenge,
    paidAt,
    createdAt,
  ];
}

class PayoutPeriodInclude extends _i1.IncludeObject {
  PayoutPeriodInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PayoutPeriod.t;
}

class PayoutPeriodIncludeList extends _i1.IncludeList {
  PayoutPeriodIncludeList._({
    _i1.WhereExpressionBuilder<PayoutPeriodTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PayoutPeriod.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PayoutPeriod.t;
}

class PayoutPeriodRepository {
  const PayoutPeriodRepository._();

  /// Returns a list of [PayoutPeriod]s matching the given query parameters.
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
  Future<List<PayoutPeriod>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PayoutPeriodTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PayoutPeriodTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PayoutPeriodTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PayoutPeriod>(
      where: where?.call(PayoutPeriod.t),
      orderBy: orderBy?.call(PayoutPeriod.t),
      orderByList: orderByList?.call(PayoutPeriod.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PayoutPeriod] matching the given query parameters.
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
  Future<PayoutPeriod?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PayoutPeriodTable>? where,
    int? offset,
    _i1.OrderByBuilder<PayoutPeriodTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PayoutPeriodTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PayoutPeriod>(
      where: where?.call(PayoutPeriod.t),
      orderBy: orderBy?.call(PayoutPeriod.t),
      orderByList: orderByList?.call(PayoutPeriod.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PayoutPeriod] by its [id] or null if no such row exists.
  Future<PayoutPeriod?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PayoutPeriod>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PayoutPeriod]s in the list and returns the inserted rows.
  ///
  /// The returned [PayoutPeriod]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<PayoutPeriod>> insert(
    _i1.DatabaseSession session,
    List<PayoutPeriod> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<PayoutPeriod>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [PayoutPeriod] and returns the inserted row.
  ///
  /// The returned [PayoutPeriod] will have its `id` field set.
  Future<PayoutPeriod> insertRow(
    _i1.DatabaseSession session,
    PayoutPeriod row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PayoutPeriod>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PayoutPeriod]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PayoutPeriod>> update(
    _i1.DatabaseSession session,
    List<PayoutPeriod> rows, {
    _i1.ColumnSelections<PayoutPeriodTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PayoutPeriod>(
      rows,
      columns: columns?.call(PayoutPeriod.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PayoutPeriod]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PayoutPeriod> updateRow(
    _i1.DatabaseSession session,
    PayoutPeriod row, {
    _i1.ColumnSelections<PayoutPeriodTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PayoutPeriod>(
      row,
      columns: columns?.call(PayoutPeriod.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PayoutPeriod] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PayoutPeriod?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<PayoutPeriodUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PayoutPeriod>(
      id,
      columnValues: columnValues(PayoutPeriod.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PayoutPeriod]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PayoutPeriod>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PayoutPeriodUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PayoutPeriodTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PayoutPeriodTable>? orderBy,
    _i1.OrderByListBuilder<PayoutPeriodTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PayoutPeriod>(
      columnValues: columnValues(PayoutPeriod.t.updateTable),
      where: where(PayoutPeriod.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PayoutPeriod.t),
      orderByList: orderByList?.call(PayoutPeriod.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PayoutPeriod]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PayoutPeriod>> delete(
    _i1.DatabaseSession session,
    List<PayoutPeriod> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PayoutPeriod>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PayoutPeriod].
  Future<PayoutPeriod> deleteRow(
    _i1.DatabaseSession session,
    PayoutPeriod row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PayoutPeriod>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PayoutPeriod>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PayoutPeriodTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PayoutPeriod>(
      where: where(PayoutPeriod.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PayoutPeriodTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PayoutPeriod>(
      where: where?.call(PayoutPeriod.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PayoutPeriod] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PayoutPeriodTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PayoutPeriod>(
      where: where(PayoutPeriod.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
