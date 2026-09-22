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

/// Приём наличных водителем — заявка, а не деньги.
///
/// Деньги попадают в книгу операций только после подтверждения
/// диспетчером: до этого сумма видна родителю как «ожидает подтверждения».
/// Сама заявка — рабочий документ, её статус меняется; книга операций
/// при этом остаётся неизменяемой.
abstract class CashTopUp
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CashTopUp._({
    this.id,
    required this.familyId,
    required this.driverId,
    required this.amountTenge,
    bool? hasSignature,
    this.note,
    DateTime? createdAt,
    this.confirmedAt,
    this.confirmedBy,
    this.rejectedAt,
    this.rejectReason,
  }) : hasSignature = hasSignature ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory CashTopUp({
    int? id,
    required int familyId,
    required int driverId,
    required int amountTenge,
    bool? hasSignature,
    String? note,
    DateTime? createdAt,
    DateTime? confirmedAt,
    int? confirmedBy,
    DateTime? rejectedAt,
    String? rejectReason,
  }) = _CashTopUpImpl;

  factory CashTopUp.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashTopUp(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      driverId: jsonSerialization['driverId'] as int,
      amountTenge: jsonSerialization['amountTenge'] as int,
      hasSignature: jsonSerialization['hasSignature'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['hasSignature']),
      note: jsonSerialization['note'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      confirmedAt: jsonSerialization['confirmedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedAt'],
            ),
      confirmedBy: jsonSerialization['confirmedBy'] as int?,
      rejectedAt: jsonSerialization['rejectedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['rejectedAt']),
      rejectReason: jsonSerialization['rejectReason'] as String?,
    );
  }

  static final t = CashTopUpTable();

  static const db = CashTopUpRepository._();

  @override
  int? id;

  int familyId;

  int driverId;

  /// Сумма в тенге (целое число).
  int amountTenge;

  /// Родитель расписался на экране водителя.
  bool hasSignature;

  String? note;

  DateTime createdAt;

  DateTime? confirmedAt;

  /// Кто из диспетчеров подтвердил.
  int? confirmedBy;

  DateTime? rejectedAt;

  String? rejectReason;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CashTopUp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashTopUp copyWith({
    int? id,
    int? familyId,
    int? driverId,
    int? amountTenge,
    bool? hasSignature,
    String? note,
    DateTime? createdAt,
    DateTime? confirmedAt,
    int? confirmedBy,
    DateTime? rejectedAt,
    String? rejectReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashTopUp',
      if (id != null) 'id': id,
      'familyId': familyId,
      'driverId': driverId,
      'amountTenge': amountTenge,
      'hasSignature': hasSignature,
      if (note != null) 'note': note,
      'createdAt': createdAt.toJson(),
      if (confirmedAt != null) 'confirmedAt': confirmedAt?.toJson(),
      if (confirmedBy != null) 'confirmedBy': confirmedBy,
      if (rejectedAt != null) 'rejectedAt': rejectedAt?.toJson(),
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CashTopUp',
      if (id != null) 'id': id,
      'familyId': familyId,
      'driverId': driverId,
      'amountTenge': amountTenge,
      'hasSignature': hasSignature,
      if (note != null) 'note': note,
      'createdAt': createdAt.toJson(),
      if (confirmedAt != null) 'confirmedAt': confirmedAt?.toJson(),
      if (confirmedBy != null) 'confirmedBy': confirmedBy,
      if (rejectedAt != null) 'rejectedAt': rejectedAt?.toJson(),
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  static CashTopUpInclude include() {
    return CashTopUpInclude._();
  }

  static CashTopUpIncludeList includeList({
    _i1.WhereExpressionBuilder<CashTopUpTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CashTopUpTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CashTopUpTable>? orderByList,
    CashTopUpInclude? include,
  }) {
    return CashTopUpIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CashTopUp.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CashTopUp.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CashTopUpImpl extends CashTopUp {
  _CashTopUpImpl({
    int? id,
    required int familyId,
    required int driverId,
    required int amountTenge,
    bool? hasSignature,
    String? note,
    DateTime? createdAt,
    DateTime? confirmedAt,
    int? confirmedBy,
    DateTime? rejectedAt,
    String? rejectReason,
  }) : super._(
         id: id,
         familyId: familyId,
         driverId: driverId,
         amountTenge: amountTenge,
         hasSignature: hasSignature,
         note: note,
         createdAt: createdAt,
         confirmedAt: confirmedAt,
         confirmedBy: confirmedBy,
         rejectedAt: rejectedAt,
         rejectReason: rejectReason,
       );

  /// Returns a shallow copy of this [CashTopUp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashTopUp copyWith({
    Object? id = _Undefined,
    int? familyId,
    int? driverId,
    int? amountTenge,
    bool? hasSignature,
    Object? note = _Undefined,
    DateTime? createdAt,
    Object? confirmedAt = _Undefined,
    Object? confirmedBy = _Undefined,
    Object? rejectedAt = _Undefined,
    Object? rejectReason = _Undefined,
  }) {
    return CashTopUp(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      driverId: driverId ?? this.driverId,
      amountTenge: amountTenge ?? this.amountTenge,
      hasSignature: hasSignature ?? this.hasSignature,
      note: note is String? ? note : this.note,
      createdAt: createdAt ?? this.createdAt,
      confirmedAt: confirmedAt is DateTime? ? confirmedAt : this.confirmedAt,
      confirmedBy: confirmedBy is int? ? confirmedBy : this.confirmedBy,
      rejectedAt: rejectedAt is DateTime? ? rejectedAt : this.rejectedAt,
      rejectReason: rejectReason is String? ? rejectReason : this.rejectReason,
    );
  }
}

class CashTopUpUpdateTable extends _i1.UpdateTable<CashTopUpTable> {
  CashTopUpUpdateTable(super.table);

  _i1.ColumnValue<int, int> familyId(int value) => _i1.ColumnValue(
    table.familyId,
    value,
  );

  _i1.ColumnValue<int, int> driverId(int value) => _i1.ColumnValue(
    table.driverId,
    value,
  );

  _i1.ColumnValue<int, int> amountTenge(int value) => _i1.ColumnValue(
    table.amountTenge,
    value,
  );

  _i1.ColumnValue<bool, bool> hasSignature(bool value) => _i1.ColumnValue(
    table.hasSignature,
    value,
  );

  _i1.ColumnValue<String, String> note(String? value) => _i1.ColumnValue(
    table.note,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> confirmedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.confirmedAt,
        value,
      );

  _i1.ColumnValue<int, int> confirmedBy(int? value) => _i1.ColumnValue(
    table.confirmedBy,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> rejectedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.rejectedAt,
        value,
      );

  _i1.ColumnValue<String, String> rejectReason(String? value) =>
      _i1.ColumnValue(
        table.rejectReason,
        value,
      );
}

class CashTopUpTable extends _i1.Table<int?> {
  CashTopUpTable({super.tableRelation}) : super(tableName: 'cash_top_up') {
    updateTable = CashTopUpUpdateTable(this);
    familyId = _i1.ColumnInt(
      'familyId',
      this,
    );
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    amountTenge = _i1.ColumnInt(
      'amountTenge',
      this,
    );
    hasSignature = _i1.ColumnBool(
      'hasSignature',
      this,
      hasDefault: true,
    );
    note = _i1.ColumnString(
      'note',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    confirmedAt = _i1.ColumnDateTime(
      'confirmedAt',
      this,
    );
    confirmedBy = _i1.ColumnInt(
      'confirmedBy',
      this,
    );
    rejectedAt = _i1.ColumnDateTime(
      'rejectedAt',
      this,
    );
    rejectReason = _i1.ColumnString(
      'rejectReason',
      this,
    );
  }

  late final CashTopUpUpdateTable updateTable;

  late final _i1.ColumnInt familyId;

  late final _i1.ColumnInt driverId;

  /// Сумма в тенге (целое число).
  late final _i1.ColumnInt amountTenge;

  /// Родитель расписался на экране водителя.
  late final _i1.ColumnBool hasSignature;

  late final _i1.ColumnString note;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime confirmedAt;

  /// Кто из диспетчеров подтвердил.
  late final _i1.ColumnInt confirmedBy;

  late final _i1.ColumnDateTime rejectedAt;

  late final _i1.ColumnString rejectReason;

  @override
  List<_i1.Column> get columns => [
    id,
    familyId,
    driverId,
    amountTenge,
    hasSignature,
    note,
    createdAt,
    confirmedAt,
    confirmedBy,
    rejectedAt,
    rejectReason,
  ];
}

class CashTopUpInclude extends _i1.IncludeObject {
  CashTopUpInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CashTopUp.t;
}

class CashTopUpIncludeList extends _i1.IncludeList {
  CashTopUpIncludeList._({
    _i1.WhereExpressionBuilder<CashTopUpTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CashTopUp.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CashTopUp.t;
}

class CashTopUpRepository {
  const CashTopUpRepository._();

  /// Returns a list of [CashTopUp]s matching the given query parameters.
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
  Future<List<CashTopUp>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CashTopUpTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CashTopUpTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CashTopUpTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CashTopUp>(
      where: where?.call(CashTopUp.t),
      orderBy: orderBy?.call(CashTopUp.t),
      orderByList: orderByList?.call(CashTopUp.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CashTopUp] matching the given query parameters.
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
  Future<CashTopUp?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CashTopUpTable>? where,
    int? offset,
    _i1.OrderByBuilder<CashTopUpTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CashTopUpTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CashTopUp>(
      where: where?.call(CashTopUp.t),
      orderBy: orderBy?.call(CashTopUp.t),
      orderByList: orderByList?.call(CashTopUp.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CashTopUp] by its [id] or null if no such row exists.
  Future<CashTopUp?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CashTopUp>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CashTopUp]s in the list and returns the inserted rows.
  ///
  /// The returned [CashTopUp]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<CashTopUp>> insert(
    _i1.DatabaseSession session,
    List<CashTopUp> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<CashTopUp>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [CashTopUp] and returns the inserted row.
  ///
  /// The returned [CashTopUp] will have its `id` field set.
  Future<CashTopUp> insertRow(
    _i1.DatabaseSession session,
    CashTopUp row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CashTopUp>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CashTopUp]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CashTopUp>> update(
    _i1.DatabaseSession session,
    List<CashTopUp> rows, {
    _i1.ColumnSelections<CashTopUpTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CashTopUp>(
      rows,
      columns: columns?.call(CashTopUp.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CashTopUp]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CashTopUp> updateRow(
    _i1.DatabaseSession session,
    CashTopUp row, {
    _i1.ColumnSelections<CashTopUpTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CashTopUp>(
      row,
      columns: columns?.call(CashTopUp.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CashTopUp] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CashTopUp?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<CashTopUpUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CashTopUp>(
      id,
      columnValues: columnValues(CashTopUp.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CashTopUp]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CashTopUp>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<CashTopUpUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CashTopUpTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CashTopUpTable>? orderBy,
    _i1.OrderByListBuilder<CashTopUpTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CashTopUp>(
      columnValues: columnValues(CashTopUp.t.updateTable),
      where: where(CashTopUp.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CashTopUp.t),
      orderByList: orderByList?.call(CashTopUp.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CashTopUp]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CashTopUp>> delete(
    _i1.DatabaseSession session,
    List<CashTopUp> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CashTopUp>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CashTopUp].
  Future<CashTopUp> deleteRow(
    _i1.DatabaseSession session,
    CashTopUp row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CashTopUp>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CashTopUp>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CashTopUpTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CashTopUp>(
      where: where(CashTopUp.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CashTopUpTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CashTopUp>(
      where: where?.call(CashTopUp.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CashTopUp] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CashTopUpTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CashTopUp>(
      where: where(CashTopUp.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
