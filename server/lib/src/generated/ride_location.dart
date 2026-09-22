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

/// Точка трека поездки.
///
/// Пишется только во время активной поездки (en_route → handed_over)
/// и хранится не дольше 30 дней: это данные о перемещении ребёнка.
abstract class RideLocation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RideLocation._({
    this.id,
    required this.rideId,
    required this.at,
    required this.lat,
    required this.lng,
    this.speedKmh,
    this.accuracyM,
  });

  factory RideLocation({
    int? id,
    required int rideId,
    required DateTime at,
    required double lat,
    required double lng,
    double? speedKmh,
    double? accuracyM,
  }) = _RideLocationImpl;

  factory RideLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideLocation(
      id: jsonSerialization['id'] as int?,
      rideId: jsonSerialization['rideId'] as int,
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
      lat: (jsonSerialization['lat'] as num).toDouble(),
      lng: (jsonSerialization['lng'] as num).toDouble(),
      speedKmh: (jsonSerialization['speedKmh'] as num?)?.toDouble(),
      accuracyM: (jsonSerialization['accuracyM'] as num?)?.toDouble(),
    );
  }

  static final t = RideLocationTable();

  static const db = RideLocationRepository._();

  @override
  int? id;

  int rideId;

  DateTime at;

  double lat;

  double lng;

  /// Скорость в км/ч, если устройство её дало.
  double? speedKmh;

  /// Точность определения в метрах.
  double? accuracyM;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RideLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideLocation copyWith({
    int? id,
    int? rideId,
    DateTime? at,
    double? lat,
    double? lng,
    double? speedKmh,
    double? accuracyM,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideLocation',
      if (id != null) 'id': id,
      'rideId': rideId,
      'at': at.toJson(),
      'lat': lat,
      'lng': lng,
      if (speedKmh != null) 'speedKmh': speedKmh,
      if (accuracyM != null) 'accuracyM': accuracyM,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RideLocation',
      if (id != null) 'id': id,
      'rideId': rideId,
      'at': at.toJson(),
      'lat': lat,
      'lng': lng,
      if (speedKmh != null) 'speedKmh': speedKmh,
      if (accuracyM != null) 'accuracyM': accuracyM,
    };
  }

  static RideLocationInclude include() {
    return RideLocationInclude._();
  }

  static RideLocationIncludeList includeList({
    _i1.WhereExpressionBuilder<RideLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideLocationTable>? orderByList,
    RideLocationInclude? include,
  }) {
    return RideLocationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RideLocation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RideLocation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideLocationImpl extends RideLocation {
  _RideLocationImpl({
    int? id,
    required int rideId,
    required DateTime at,
    required double lat,
    required double lng,
    double? speedKmh,
    double? accuracyM,
  }) : super._(
         id: id,
         rideId: rideId,
         at: at,
         lat: lat,
         lng: lng,
         speedKmh: speedKmh,
         accuracyM: accuracyM,
       );

  /// Returns a shallow copy of this [RideLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideLocation copyWith({
    Object? id = _Undefined,
    int? rideId,
    DateTime? at,
    double? lat,
    double? lng,
    Object? speedKmh = _Undefined,
    Object? accuracyM = _Undefined,
  }) {
    return RideLocation(
      id: id is int? ? id : this.id,
      rideId: rideId ?? this.rideId,
      at: at ?? this.at,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      speedKmh: speedKmh is double? ? speedKmh : this.speedKmh,
      accuracyM: accuracyM is double? ? accuracyM : this.accuracyM,
    );
  }
}

class RideLocationUpdateTable extends _i1.UpdateTable<RideLocationTable> {
  RideLocationUpdateTable(super.table);

  _i1.ColumnValue<int, int> rideId(int value) => _i1.ColumnValue(
    table.rideId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> at(DateTime value) => _i1.ColumnValue(
    table.at,
    value,
  );

  _i1.ColumnValue<double, double> lat(double value) => _i1.ColumnValue(
    table.lat,
    value,
  );

  _i1.ColumnValue<double, double> lng(double value) => _i1.ColumnValue(
    table.lng,
    value,
  );

  _i1.ColumnValue<double, double> speedKmh(double? value) => _i1.ColumnValue(
    table.speedKmh,
    value,
  );

  _i1.ColumnValue<double, double> accuracyM(double? value) => _i1.ColumnValue(
    table.accuracyM,
    value,
  );
}

class RideLocationTable extends _i1.Table<int?> {
  RideLocationTable({super.tableRelation}) : super(tableName: 'ride_location') {
    updateTable = RideLocationUpdateTable(this);
    rideId = _i1.ColumnInt(
      'rideId',
      this,
    );
    at = _i1.ColumnDateTime(
      'at',
      this,
    );
    lat = _i1.ColumnDouble(
      'lat',
      this,
    );
    lng = _i1.ColumnDouble(
      'lng',
      this,
    );
    speedKmh = _i1.ColumnDouble(
      'speedKmh',
      this,
    );
    accuracyM = _i1.ColumnDouble(
      'accuracyM',
      this,
    );
  }

  late final RideLocationUpdateTable updateTable;

  late final _i1.ColumnInt rideId;

  late final _i1.ColumnDateTime at;

  late final _i1.ColumnDouble lat;

  late final _i1.ColumnDouble lng;

  /// Скорость в км/ч, если устройство её дало.
  late final _i1.ColumnDouble speedKmh;

  /// Точность определения в метрах.
  late final _i1.ColumnDouble accuracyM;

  @override
  List<_i1.Column> get columns => [
    id,
    rideId,
    at,
    lat,
    lng,
    speedKmh,
    accuracyM,
  ];
}

class RideLocationInclude extends _i1.IncludeObject {
  RideLocationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RideLocation.t;
}

class RideLocationIncludeList extends _i1.IncludeList {
  RideLocationIncludeList._({
    _i1.WhereExpressionBuilder<RideLocationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RideLocation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RideLocation.t;
}

class RideLocationRepository {
  const RideLocationRepository._();

  /// Returns a list of [RideLocation]s matching the given query parameters.
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
  Future<List<RideLocation>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideLocationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RideLocation>(
      where: where?.call(RideLocation.t),
      orderBy: orderBy?.call(RideLocation.t),
      orderByList: orderByList?.call(RideLocation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RideLocation] matching the given query parameters.
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
  Future<RideLocation?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideLocationTable>? where,
    int? offset,
    _i1.OrderByBuilder<RideLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideLocationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RideLocation>(
      where: where?.call(RideLocation.t),
      orderBy: orderBy?.call(RideLocation.t),
      orderByList: orderByList?.call(RideLocation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RideLocation] by its [id] or null if no such row exists.
  Future<RideLocation?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RideLocation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RideLocation]s in the list and returns the inserted rows.
  ///
  /// The returned [RideLocation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<RideLocation>> insert(
    _i1.DatabaseSession session,
    List<RideLocation> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<RideLocation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [RideLocation] and returns the inserted row.
  ///
  /// The returned [RideLocation] will have its `id` field set.
  Future<RideLocation> insertRow(
    _i1.DatabaseSession session,
    RideLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RideLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RideLocation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RideLocation>> update(
    _i1.DatabaseSession session,
    List<RideLocation> rows, {
    _i1.ColumnSelections<RideLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RideLocation>(
      rows,
      columns: columns?.call(RideLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RideLocation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RideLocation> updateRow(
    _i1.DatabaseSession session,
    RideLocation row, {
    _i1.ColumnSelections<RideLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RideLocation>(
      row,
      columns: columns?.call(RideLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RideLocation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RideLocation?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<RideLocationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RideLocation>(
      id,
      columnValues: columnValues(RideLocation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RideLocation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RideLocation>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RideLocationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RideLocationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideLocationTable>? orderBy,
    _i1.OrderByListBuilder<RideLocationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RideLocation>(
      columnValues: columnValues(RideLocation.t.updateTable),
      where: where(RideLocation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RideLocation.t),
      orderByList: orderByList?.call(RideLocation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RideLocation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RideLocation>> delete(
    _i1.DatabaseSession session,
    List<RideLocation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RideLocation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RideLocation].
  Future<RideLocation> deleteRow(
    _i1.DatabaseSession session,
    RideLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RideLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RideLocation>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideLocationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RideLocation>(
      where: where(RideLocation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideLocationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RideLocation>(
      where: where?.call(RideLocation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RideLocation] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideLocationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RideLocation>(
      where: where(RideLocation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
