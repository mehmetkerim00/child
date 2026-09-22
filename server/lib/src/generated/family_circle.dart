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
import 'circle_rank.dart' as _i2;

/// «Круг семьи»: постоянный водитель и 1–2 резервных.
abstract class FamilyCircle
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  FamilyCircle._({
    this.id,
    required this.familyId,
    required this.driverId,
    required this.rank,
  });

  factory FamilyCircle({
    int? id,
    required int familyId,
    required int driverId,
    required _i2.CircleRank rank,
  }) = _FamilyCircleImpl;

  factory FamilyCircle.fromJson(Map<String, dynamic> jsonSerialization) {
    return FamilyCircle(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      driverId: jsonSerialization['driverId'] as int,
      rank: _i2.CircleRank.fromJson((jsonSerialization['rank'] as String)),
    );
  }

  static final t = FamilyCircleTable();

  static const db = FamilyCircleRepository._();

  @override
  int? id;

  int familyId;

  int driverId;

  _i2.CircleRank rank;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [FamilyCircle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FamilyCircle copyWith({
    int? id,
    int? familyId,
    int? driverId,
    _i2.CircleRank? rank,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FamilyCircle',
      if (id != null) 'id': id,
      'familyId': familyId,
      'driverId': driverId,
      'rank': rank.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FamilyCircle',
      if (id != null) 'id': id,
      'familyId': familyId,
      'driverId': driverId,
      'rank': rank.toJson(),
    };
  }

  static FamilyCircleInclude include() {
    return FamilyCircleInclude._();
  }

  static FamilyCircleIncludeList includeList({
    _i1.WhereExpressionBuilder<FamilyCircleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyCircleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyCircleTable>? orderByList,
    FamilyCircleInclude? include,
  }) {
    return FamilyCircleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FamilyCircle.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FamilyCircle.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FamilyCircleImpl extends FamilyCircle {
  _FamilyCircleImpl({
    int? id,
    required int familyId,
    required int driverId,
    required _i2.CircleRank rank,
  }) : super._(
         id: id,
         familyId: familyId,
         driverId: driverId,
         rank: rank,
       );

  /// Returns a shallow copy of this [FamilyCircle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FamilyCircle copyWith({
    Object? id = _Undefined,
    int? familyId,
    int? driverId,
    _i2.CircleRank? rank,
  }) {
    return FamilyCircle(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      driverId: driverId ?? this.driverId,
      rank: rank ?? this.rank,
    );
  }
}

class FamilyCircleUpdateTable extends _i1.UpdateTable<FamilyCircleTable> {
  FamilyCircleUpdateTable(super.table);

  _i1.ColumnValue<int, int> familyId(int value) => _i1.ColumnValue(
    table.familyId,
    value,
  );

  _i1.ColumnValue<int, int> driverId(int value) => _i1.ColumnValue(
    table.driverId,
    value,
  );

  _i1.ColumnValue<_i2.CircleRank, _i2.CircleRank> rank(_i2.CircleRank value) =>
      _i1.ColumnValue(
        table.rank,
        value,
      );
}

class FamilyCircleTable extends _i1.Table<int?> {
  FamilyCircleTable({super.tableRelation}) : super(tableName: 'family_circle') {
    updateTable = FamilyCircleUpdateTable(this);
    familyId = _i1.ColumnInt(
      'familyId',
      this,
    );
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    rank = _i1.ColumnEnum(
      'rank',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final FamilyCircleUpdateTable updateTable;

  late final _i1.ColumnInt familyId;

  late final _i1.ColumnInt driverId;

  late final _i1.ColumnEnum<_i2.CircleRank> rank;

  @override
  List<_i1.Column> get columns => [
    id,
    familyId,
    driverId,
    rank,
  ];
}

class FamilyCircleInclude extends _i1.IncludeObject {
  FamilyCircleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => FamilyCircle.t;
}

class FamilyCircleIncludeList extends _i1.IncludeList {
  FamilyCircleIncludeList._({
    _i1.WhereExpressionBuilder<FamilyCircleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FamilyCircle.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => FamilyCircle.t;
}

class FamilyCircleRepository {
  const FamilyCircleRepository._();

  /// Returns a list of [FamilyCircle]s matching the given query parameters.
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
  Future<List<FamilyCircle>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FamilyCircleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyCircleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyCircleTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<FamilyCircle>(
      where: where?.call(FamilyCircle.t),
      orderBy: orderBy?.call(FamilyCircle.t),
      orderByList: orderByList?.call(FamilyCircle.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [FamilyCircle] matching the given query parameters.
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
  Future<FamilyCircle?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FamilyCircleTable>? where,
    int? offset,
    _i1.OrderByBuilder<FamilyCircleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyCircleTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<FamilyCircle>(
      where: where?.call(FamilyCircle.t),
      orderBy: orderBy?.call(FamilyCircle.t),
      orderByList: orderByList?.call(FamilyCircle.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [FamilyCircle] by its [id] or null if no such row exists.
  Future<FamilyCircle?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<FamilyCircle>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [FamilyCircle]s in the list and returns the inserted rows.
  ///
  /// The returned [FamilyCircle]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<FamilyCircle>> insert(
    _i1.DatabaseSession session,
    List<FamilyCircle> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<FamilyCircle>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [FamilyCircle] and returns the inserted row.
  ///
  /// The returned [FamilyCircle] will have its `id` field set.
  Future<FamilyCircle> insertRow(
    _i1.DatabaseSession session,
    FamilyCircle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FamilyCircle>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [FamilyCircle]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<FamilyCircle>> update(
    _i1.DatabaseSession session,
    List<FamilyCircle> rows, {
    _i1.ColumnSelections<FamilyCircleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FamilyCircle>(
      rows,
      columns: columns?.call(FamilyCircle.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FamilyCircle]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FamilyCircle> updateRow(
    _i1.DatabaseSession session,
    FamilyCircle row, {
    _i1.ColumnSelections<FamilyCircleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FamilyCircle>(
      row,
      columns: columns?.call(FamilyCircle.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FamilyCircle] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<FamilyCircle?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<FamilyCircleUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<FamilyCircle>(
      id,
      columnValues: columnValues(FamilyCircle.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [FamilyCircle]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<FamilyCircle>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<FamilyCircleUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<FamilyCircleTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyCircleTable>? orderBy,
    _i1.OrderByListBuilder<FamilyCircleTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<FamilyCircle>(
      columnValues: columnValues(FamilyCircle.t.updateTable),
      where: where(FamilyCircle.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FamilyCircle.t),
      orderByList: orderByList?.call(FamilyCircle.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [FamilyCircle]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<FamilyCircle>> delete(
    _i1.DatabaseSession session,
    List<FamilyCircle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FamilyCircle>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [FamilyCircle].
  Future<FamilyCircle> deleteRow(
    _i1.DatabaseSession session,
    FamilyCircle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FamilyCircle>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<FamilyCircle>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<FamilyCircleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FamilyCircle>(
      where: where(FamilyCircle.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FamilyCircleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FamilyCircle>(
      where: where?.call(FamilyCircle.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [FamilyCircle] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<FamilyCircleTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<FamilyCircle>(
      where: where(FamilyCircle.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
