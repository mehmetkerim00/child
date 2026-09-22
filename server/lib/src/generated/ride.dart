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
import 'ride_status.dart' as _i2;

/// Конкретная поездка на дату. Генерируется из шаблонов (S2).
abstract class Ride implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Ride._({
    this.id,
    this.templateId,
    required this.childId,
    this.driverId,
    required this.date,
    required this.plannedTime,
    _i2.RideStatus? status,
    this.confirmedAt,
    DateTime? createdAt,
  }) : status = status ?? _i2.RideStatus.scheduled,
       createdAt = createdAt ?? DateTime.now();

  factory Ride({
    int? id,
    int? templateId,
    required int childId,
    int? driverId,
    required DateTime date,
    required String plannedTime,
    _i2.RideStatus? status,
    DateTime? confirmedAt,
    DateTime? createdAt,
  }) = _RideImpl;

  factory Ride.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ride(
      id: jsonSerialization['id'] as int?,
      templateId: jsonSerialization['templateId'] as int?,
      childId: jsonSerialization['childId'] as int,
      driverId: jsonSerialization['driverId'] as int?,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      plannedTime: jsonSerialization['plannedTime'] as String,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.RideStatus.fromJson((jsonSerialization['status'] as String)),
      confirmedAt: jsonSerialization['confirmedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = RideTable();

  static const db = RideRepository._();

  @override
  int? id;

  int? templateId;

  int childId;

  int? driverId;

  DateTime date;

  String plannedTime;

  _i2.RideStatus status;

  DateTime? confirmedAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Ride]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ride copyWith({
    int? id,
    int? templateId,
    int? childId,
    int? driverId,
    DateTime? date,
    String? plannedTime,
    _i2.RideStatus? status,
    DateTime? confirmedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Ride',
      if (id != null) 'id': id,
      if (templateId != null) 'templateId': templateId,
      'childId': childId,
      if (driverId != null) 'driverId': driverId,
      'date': date.toJson(),
      'plannedTime': plannedTime,
      'status': status.toJson(),
      if (confirmedAt != null) 'confirmedAt': confirmedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Ride',
      if (id != null) 'id': id,
      if (templateId != null) 'templateId': templateId,
      'childId': childId,
      if (driverId != null) 'driverId': driverId,
      'date': date.toJson(),
      'plannedTime': plannedTime,
      'status': status.toJson(),
      if (confirmedAt != null) 'confirmedAt': confirmedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static RideInclude include() {
    return RideInclude._();
  }

  static RideIncludeList includeList({
    _i1.WhereExpressionBuilder<RideTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideTable>? orderByList,
    RideInclude? include,
  }) {
    return RideIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Ride.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Ride.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideImpl extends Ride {
  _RideImpl({
    int? id,
    int? templateId,
    required int childId,
    int? driverId,
    required DateTime date,
    required String plannedTime,
    _i2.RideStatus? status,
    DateTime? confirmedAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         templateId: templateId,
         childId: childId,
         driverId: driverId,
         date: date,
         plannedTime: plannedTime,
         status: status,
         confirmedAt: confirmedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Ride]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Ride copyWith({
    Object? id = _Undefined,
    Object? templateId = _Undefined,
    int? childId,
    Object? driverId = _Undefined,
    DateTime? date,
    String? plannedTime,
    _i2.RideStatus? status,
    Object? confirmedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return Ride(
      id: id is int? ? id : this.id,
      templateId: templateId is int? ? templateId : this.templateId,
      childId: childId ?? this.childId,
      driverId: driverId is int? ? driverId : this.driverId,
      date: date ?? this.date,
      plannedTime: plannedTime ?? this.plannedTime,
      status: status ?? this.status,
      confirmedAt: confirmedAt is DateTime? ? confirmedAt : this.confirmedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RideUpdateTable extends _i1.UpdateTable<RideTable> {
  RideUpdateTable(super.table);

  _i1.ColumnValue<int, int> templateId(int? value) => _i1.ColumnValue(
    table.templateId,
    value,
  );

  _i1.ColumnValue<int, int> childId(int value) => _i1.ColumnValue(
    table.childId,
    value,
  );

  _i1.ColumnValue<int, int> driverId(int? value) => _i1.ColumnValue(
    table.driverId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<String, String> plannedTime(String value) => _i1.ColumnValue(
    table.plannedTime,
    value,
  );

  _i1.ColumnValue<_i2.RideStatus, _i2.RideStatus> status(
    _i2.RideStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> confirmedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.confirmedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class RideTable extends _i1.Table<int?> {
  RideTable({super.tableRelation}) : super(tableName: 'ride') {
    updateTable = RideUpdateTable(this);
    templateId = _i1.ColumnInt(
      'templateId',
      this,
    );
    childId = _i1.ColumnInt(
      'childId',
      this,
    );
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    plannedTime = _i1.ColumnString(
      'plannedTime',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    confirmedAt = _i1.ColumnDateTime(
      'confirmedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final RideUpdateTable updateTable;

  late final _i1.ColumnInt templateId;

  late final _i1.ColumnInt childId;

  late final _i1.ColumnInt driverId;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString plannedTime;

  late final _i1.ColumnEnum<_i2.RideStatus> status;

  late final _i1.ColumnDateTime confirmedAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    templateId,
    childId,
    driverId,
    date,
    plannedTime,
    status,
    confirmedAt,
    createdAt,
  ];
}

class RideInclude extends _i1.IncludeObject {
  RideInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Ride.t;
}

class RideIncludeList extends _i1.IncludeList {
  RideIncludeList._({
    _i1.WhereExpressionBuilder<RideTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Ride.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Ride.t;
}

class RideRepository {
  const RideRepository._();

  /// Returns a list of [Ride]s matching the given query parameters.
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
  Future<List<Ride>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Ride>(
      where: where?.call(Ride.t),
      orderBy: orderBy?.call(Ride.t),
      orderByList: orderByList?.call(Ride.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Ride] matching the given query parameters.
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
  Future<Ride?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideTable>? where,
    int? offset,
    _i1.OrderByBuilder<RideTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Ride>(
      where: where?.call(Ride.t),
      orderBy: orderBy?.call(Ride.t),
      orderByList: orderByList?.call(Ride.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Ride] by its [id] or null if no such row exists.
  Future<Ride?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Ride>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Ride]s in the list and returns the inserted rows.
  ///
  /// The returned [Ride]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Ride>> insert(
    _i1.DatabaseSession session,
    List<Ride> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Ride>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Ride] and returns the inserted row.
  ///
  /// The returned [Ride] will have its `id` field set.
  Future<Ride> insertRow(
    _i1.DatabaseSession session,
    Ride row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Ride>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Ride]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Ride>> update(
    _i1.DatabaseSession session,
    List<Ride> rows, {
    _i1.ColumnSelections<RideTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Ride>(
      rows,
      columns: columns?.call(Ride.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Ride]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Ride> updateRow(
    _i1.DatabaseSession session,
    Ride row, {
    _i1.ColumnSelections<RideTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Ride>(
      row,
      columns: columns?.call(Ride.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Ride] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Ride?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<RideUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Ride>(
      id,
      columnValues: columnValues(Ride.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Ride]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Ride>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RideUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RideTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideTable>? orderBy,
    _i1.OrderByListBuilder<RideTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Ride>(
      columnValues: columnValues(Ride.t.updateTable),
      where: where(Ride.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Ride.t),
      orderByList: orderByList?.call(Ride.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Ride]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Ride>> delete(
    _i1.DatabaseSession session,
    List<Ride> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Ride>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Ride].
  Future<Ride> deleteRow(
    _i1.DatabaseSession session,
    Ride row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Ride>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Ride>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Ride>(
      where: where(Ride.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Ride>(
      where: where?.call(Ride.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Ride] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Ride>(
      where: where(Ride.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
