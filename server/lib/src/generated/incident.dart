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
import 'incident_severity.dart' as _i2;

/// Журнал инцидентов.
///
/// Разбор уважительный: удержание водителей критично (RESEARCH.md).
/// Запись фиксирует факт и решение, а не служит наказанием.
abstract class Incident
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Incident._({
    this.id,
    this.driverId,
    this.rideId,
    this.familyId,
    required this.severity,
    required this.description,
    this.resolution,
    DateTime? createdAt,
    this.createdBy,
    this.resolvedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Incident({
    int? id,
    int? driverId,
    int? rideId,
    int? familyId,
    required _i2.IncidentSeverity severity,
    required String description,
    String? resolution,
    DateTime? createdAt,
    int? createdBy,
    DateTime? resolvedAt,
  }) = _IncidentImpl;

  factory Incident.fromJson(Map<String, dynamic> jsonSerialization) {
    return Incident(
      id: jsonSerialization['id'] as int?,
      driverId: jsonSerialization['driverId'] as int?,
      rideId: jsonSerialization['rideId'] as int?,
      familyId: jsonSerialization['familyId'] as int?,
      severity: _i2.IncidentSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      description: jsonSerialization['description'] as String,
      resolution: jsonSerialization['resolution'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdBy: jsonSerialization['createdBy'] as int?,
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
    );
  }

  static final t = IncidentTable();

  static const db = IncidentRepository._();

  @override
  int? id;

  int? driverId;

  int? rideId;

  int? familyId;

  _i2.IncidentSeverity severity;

  /// Что случилось, словами.
  String description;

  /// Что решили и что сделали.
  String? resolution;

  DateTime createdAt;

  int? createdBy;

  DateTime? resolvedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Incident copyWith({
    int? id,
    int? driverId,
    int? rideId,
    int? familyId,
    _i2.IncidentSeverity? severity,
    String? description,
    String? resolution,
    DateTime? createdAt,
    int? createdBy,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Incident',
      if (id != null) 'id': id,
      if (driverId != null) 'driverId': driverId,
      if (rideId != null) 'rideId': rideId,
      if (familyId != null) 'familyId': familyId,
      'severity': severity.toJson(),
      'description': description,
      if (resolution != null) 'resolution': resolution,
      'createdAt': createdAt.toJson(),
      if (createdBy != null) 'createdBy': createdBy,
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Incident',
      if (id != null) 'id': id,
      if (driverId != null) 'driverId': driverId,
      if (rideId != null) 'rideId': rideId,
      if (familyId != null) 'familyId': familyId,
      'severity': severity.toJson(),
      'description': description,
      if (resolution != null) 'resolution': resolution,
      'createdAt': createdAt.toJson(),
      if (createdBy != null) 'createdBy': createdBy,
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  static IncidentInclude include() {
    return IncidentInclude._();
  }

  static IncidentIncludeList includeList({
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    IncidentInclude? include,
  }) {
    return IncidentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Incident.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Incident.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IncidentImpl extends Incident {
  _IncidentImpl({
    int? id,
    int? driverId,
    int? rideId,
    int? familyId,
    required _i2.IncidentSeverity severity,
    required String description,
    String? resolution,
    DateTime? createdAt,
    int? createdBy,
    DateTime? resolvedAt,
  }) : super._(
         id: id,
         driverId: driverId,
         rideId: rideId,
         familyId: familyId,
         severity: severity,
         description: description,
         resolution: resolution,
         createdAt: createdAt,
         createdBy: createdBy,
         resolvedAt: resolvedAt,
       );

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Incident copyWith({
    Object? id = _Undefined,
    Object? driverId = _Undefined,
    Object? rideId = _Undefined,
    Object? familyId = _Undefined,
    _i2.IncidentSeverity? severity,
    String? description,
    Object? resolution = _Undefined,
    DateTime? createdAt,
    Object? createdBy = _Undefined,
    Object? resolvedAt = _Undefined,
  }) {
    return Incident(
      id: id is int? ? id : this.id,
      driverId: driverId is int? ? driverId : this.driverId,
      rideId: rideId is int? ? rideId : this.rideId,
      familyId: familyId is int? ? familyId : this.familyId,
      severity: severity ?? this.severity,
      description: description ?? this.description,
      resolution: resolution is String? ? resolution : this.resolution,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy is int? ? createdBy : this.createdBy,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}

class IncidentUpdateTable extends _i1.UpdateTable<IncidentTable> {
  IncidentUpdateTable(super.table);

  _i1.ColumnValue<int, int> driverId(int? value) => _i1.ColumnValue(
    table.driverId,
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

  _i1.ColumnValue<_i2.IncidentSeverity, _i2.IncidentSeverity> severity(
    _i2.IncidentSeverity value,
  ) => _i1.ColumnValue(
    table.severity,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> resolution(String? value) => _i1.ColumnValue(
    table.resolution,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<int, int> createdBy(int? value) => _i1.ColumnValue(
    table.createdBy,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> resolvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.resolvedAt,
        value,
      );
}

class IncidentTable extends _i1.Table<int?> {
  IncidentTable({super.tableRelation}) : super(tableName: 'incident') {
    updateTable = IncidentUpdateTable(this);
    driverId = _i1.ColumnInt(
      'driverId',
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
    severity = _i1.ColumnEnum(
      'severity',
      this,
      _i1.EnumSerialization.byName,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    resolution = _i1.ColumnString(
      'resolution',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    createdBy = _i1.ColumnInt(
      'createdBy',
      this,
    );
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
      this,
    );
  }

  late final IncidentUpdateTable updateTable;

  late final _i1.ColumnInt driverId;

  late final _i1.ColumnInt rideId;

  late final _i1.ColumnInt familyId;

  late final _i1.ColumnEnum<_i2.IncidentSeverity> severity;

  /// Что случилось, словами.
  late final _i1.ColumnString description;

  /// Что решили и что сделали.
  late final _i1.ColumnString resolution;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt createdBy;

  late final _i1.ColumnDateTime resolvedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    driverId,
    rideId,
    familyId,
    severity,
    description,
    resolution,
    createdAt,
    createdBy,
    resolvedAt,
  ];
}

class IncidentInclude extends _i1.IncludeObject {
  IncidentInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Incident.t;
}

class IncidentIncludeList extends _i1.IncludeList {
  IncidentIncludeList._({
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Incident.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Incident.t;
}

class IncidentRepository {
  const IncidentRepository._();

  /// Returns a list of [Incident]s matching the given query parameters.
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
  Future<List<Incident>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Incident>(
      where: where?.call(Incident.t),
      orderBy: orderBy?.call(Incident.t),
      orderByList: orderByList?.call(Incident.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Incident] matching the given query parameters.
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
  Future<Incident?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Incident>(
      where: where?.call(Incident.t),
      orderBy: orderBy?.call(Incident.t),
      orderByList: orderByList?.call(Incident.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Incident] by its [id] or null if no such row exists.
  Future<Incident?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Incident>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Incident]s in the list and returns the inserted rows.
  ///
  /// The returned [Incident]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Incident>> insert(
    _i1.DatabaseSession session,
    List<Incident> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Incident>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Incident] and returns the inserted row.
  ///
  /// The returned [Incident] will have its `id` field set.
  Future<Incident> insertRow(
    _i1.DatabaseSession session,
    Incident row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Incident>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Incident]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Incident>> update(
    _i1.DatabaseSession session,
    List<Incident> rows, {
    _i1.ColumnSelections<IncidentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Incident>(
      rows,
      columns: columns?.call(Incident.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Incident]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Incident> updateRow(
    _i1.DatabaseSession session,
    Incident row, {
    _i1.ColumnSelections<IncidentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Incident>(
      row,
      columns: columns?.call(Incident.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Incident] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Incident?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<IncidentUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Incident>(
      id,
      columnValues: columnValues(Incident.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Incident]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Incident>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<IncidentUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<IncidentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Incident>(
      columnValues: columnValues(Incident.t.updateTable),
      where: where(Incident.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Incident.t),
      orderByList: orderByList?.call(Incident.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Incident]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Incident>> delete(
    _i1.DatabaseSession session,
    List<Incident> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Incident>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Incident].
  Future<Incident> deleteRow(
    _i1.DatabaseSession session,
    Incident row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Incident>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Incident>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<IncidentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Incident>(
      where: where(Incident.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Incident>(
      where: where?.call(Incident.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Incident] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<IncidentTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Incident>(
      where: where(Incident.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
