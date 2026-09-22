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
import 'ride_event_type.dart' as _i2;
import 'account_role.dart' as _i3;

/// Иммутабельный лог событий поездки.
abstract class RideEvent
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RideEvent._({
    this.id,
    required this.rideId,
    required this.clientEventId,
    required this.type,
    required this.at,
    required this.byRole,
    this.lat,
    this.lng,
    this.photoUrl,
    this.note,
  });

  factory RideEvent({
    int? id,
    required int rideId,
    required String clientEventId,
    required _i2.RideEventType type,
    required DateTime at,
    required _i3.AccountRole byRole,
    double? lat,
    double? lng,
    String? photoUrl,
    String? note,
  }) = _RideEventImpl;

  factory RideEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideEvent(
      id: jsonSerialization['id'] as int?,
      rideId: jsonSerialization['rideId'] as int,
      clientEventId: jsonSerialization['clientEventId'] as String,
      type: _i2.RideEventType.fromJson((jsonSerialization['type'] as String)),
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
      byRole: _i3.AccountRole.fromJson((jsonSerialization['byRole'] as String)),
      lat: (jsonSerialization['lat'] as num?)?.toDouble(),
      lng: (jsonSerialization['lng'] as num?)?.toDouble(),
      photoUrl: jsonSerialization['photoUrl'] as String?,
      note: jsonSerialization['note'] as String?,
    );
  }

  static final t = RideEventTable();

  static const db = RideEventRepository._();

  @override
  int? id;

  int rideId;

  /// Идентификатор, присвоенный приложением водителя. Нужен, чтобы
  /// событие из офлайн-очереди не записалось дважды при повторной отправке.
  String clientEventId;

  _i2.RideEventType type;

  DateTime at;

  /// Кто отметил событие: driver или dispatcher.
  _i3.AccountRole byRole;

  double? lat;

  double? lng;

  String? photoUrl;

  /// Причина задержки, код учреждения и прочее — короткой строкой.
  String? note;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RideEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideEvent copyWith({
    int? id,
    int? rideId,
    String? clientEventId,
    _i2.RideEventType? type,
    DateTime? at,
    _i3.AccountRole? byRole,
    double? lat,
    double? lng,
    String? photoUrl,
    String? note,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideEvent',
      if (id != null) 'id': id,
      'rideId': rideId,
      'clientEventId': clientEventId,
      'type': type.toJson(),
      'at': at.toJson(),
      'byRole': byRole.toJson(),
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (photoUrl != null) 'photoUrl': photoUrl,
      if (note != null) 'note': note,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RideEvent',
      if (id != null) 'id': id,
      'rideId': rideId,
      'clientEventId': clientEventId,
      'type': type.toJson(),
      'at': at.toJson(),
      'byRole': byRole.toJson(),
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (photoUrl != null) 'photoUrl': photoUrl,
      if (note != null) 'note': note,
    };
  }

  static RideEventInclude include() {
    return RideEventInclude._();
  }

  static RideEventIncludeList includeList({
    _i1.WhereExpressionBuilder<RideEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideEventTable>? orderByList,
    RideEventInclude? include,
  }) {
    return RideEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RideEvent.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RideEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideEventImpl extends RideEvent {
  _RideEventImpl({
    int? id,
    required int rideId,
    required String clientEventId,
    required _i2.RideEventType type,
    required DateTime at,
    required _i3.AccountRole byRole,
    double? lat,
    double? lng,
    String? photoUrl,
    String? note,
  }) : super._(
         id: id,
         rideId: rideId,
         clientEventId: clientEventId,
         type: type,
         at: at,
         byRole: byRole,
         lat: lat,
         lng: lng,
         photoUrl: photoUrl,
         note: note,
       );

  /// Returns a shallow copy of this [RideEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideEvent copyWith({
    Object? id = _Undefined,
    int? rideId,
    String? clientEventId,
    _i2.RideEventType? type,
    DateTime? at,
    _i3.AccountRole? byRole,
    Object? lat = _Undefined,
    Object? lng = _Undefined,
    Object? photoUrl = _Undefined,
    Object? note = _Undefined,
  }) {
    return RideEvent(
      id: id is int? ? id : this.id,
      rideId: rideId ?? this.rideId,
      clientEventId: clientEventId ?? this.clientEventId,
      type: type ?? this.type,
      at: at ?? this.at,
      byRole: byRole ?? this.byRole,
      lat: lat is double? ? lat : this.lat,
      lng: lng is double? ? lng : this.lng,
      photoUrl: photoUrl is String? ? photoUrl : this.photoUrl,
      note: note is String? ? note : this.note,
    );
  }
}

class RideEventUpdateTable extends _i1.UpdateTable<RideEventTable> {
  RideEventUpdateTable(super.table);

  _i1.ColumnValue<int, int> rideId(int value) => _i1.ColumnValue(
    table.rideId,
    value,
  );

  _i1.ColumnValue<String, String> clientEventId(String value) =>
      _i1.ColumnValue(
        table.clientEventId,
        value,
      );

  _i1.ColumnValue<_i2.RideEventType, _i2.RideEventType> type(
    _i2.RideEventType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> at(DateTime value) => _i1.ColumnValue(
    table.at,
    value,
  );

  _i1.ColumnValue<_i3.AccountRole, _i3.AccountRole> byRole(
    _i3.AccountRole value,
  ) => _i1.ColumnValue(
    table.byRole,
    value,
  );

  _i1.ColumnValue<double, double> lat(double? value) => _i1.ColumnValue(
    table.lat,
    value,
  );

  _i1.ColumnValue<double, double> lng(double? value) => _i1.ColumnValue(
    table.lng,
    value,
  );

  _i1.ColumnValue<String, String> photoUrl(String? value) => _i1.ColumnValue(
    table.photoUrl,
    value,
  );

  _i1.ColumnValue<String, String> note(String? value) => _i1.ColumnValue(
    table.note,
    value,
  );
}

class RideEventTable extends _i1.Table<int?> {
  RideEventTable({super.tableRelation}) : super(tableName: 'ride_event') {
    updateTable = RideEventUpdateTable(this);
    rideId = _i1.ColumnInt(
      'rideId',
      this,
    );
    clientEventId = _i1.ColumnString(
      'clientEventId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    at = _i1.ColumnDateTime(
      'at',
      this,
    );
    byRole = _i1.ColumnEnum(
      'byRole',
      this,
      _i1.EnumSerialization.byName,
    );
    lat = _i1.ColumnDouble(
      'lat',
      this,
    );
    lng = _i1.ColumnDouble(
      'lng',
      this,
    );
    photoUrl = _i1.ColumnString(
      'photoUrl',
      this,
    );
    note = _i1.ColumnString(
      'note',
      this,
    );
  }

  late final RideEventUpdateTable updateTable;

  late final _i1.ColumnInt rideId;

  /// Идентификатор, присвоенный приложением водителя. Нужен, чтобы
  /// событие из офлайн-очереди не записалось дважды при повторной отправке.
  late final _i1.ColumnString clientEventId;

  late final _i1.ColumnEnum<_i2.RideEventType> type;

  late final _i1.ColumnDateTime at;

  /// Кто отметил событие: driver или dispatcher.
  late final _i1.ColumnEnum<_i3.AccountRole> byRole;

  late final _i1.ColumnDouble lat;

  late final _i1.ColumnDouble lng;

  late final _i1.ColumnString photoUrl;

  /// Причина задержки, код учреждения и прочее — короткой строкой.
  late final _i1.ColumnString note;

  @override
  List<_i1.Column> get columns => [
    id,
    rideId,
    clientEventId,
    type,
    at,
    byRole,
    lat,
    lng,
    photoUrl,
    note,
  ];
}

class RideEventInclude extends _i1.IncludeObject {
  RideEventInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RideEvent.t;
}

class RideEventIncludeList extends _i1.IncludeList {
  RideEventIncludeList._({
    _i1.WhereExpressionBuilder<RideEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RideEvent.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RideEvent.t;
}

class RideEventRepository {
  const RideEventRepository._();

  /// Returns a list of [RideEvent]s matching the given query parameters.
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
  Future<List<RideEvent>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideEventTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RideEvent>(
      where: where?.call(RideEvent.t),
      orderBy: orderBy?.call(RideEvent.t),
      orderByList: orderByList?.call(RideEvent.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RideEvent] matching the given query parameters.
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
  Future<RideEvent?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideEventTable>? where,
    int? offset,
    _i1.OrderByBuilder<RideEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideEventTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RideEvent>(
      where: where?.call(RideEvent.t),
      orderBy: orderBy?.call(RideEvent.t),
      orderByList: orderByList?.call(RideEvent.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RideEvent] by its [id] or null if no such row exists.
  Future<RideEvent?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RideEvent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RideEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [RideEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<RideEvent>> insert(
    _i1.DatabaseSession session,
    List<RideEvent> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<RideEvent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [RideEvent] and returns the inserted row.
  ///
  /// The returned [RideEvent] will have its `id` field set.
  Future<RideEvent> insertRow(
    _i1.DatabaseSession session,
    RideEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RideEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RideEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RideEvent>> update(
    _i1.DatabaseSession session,
    List<RideEvent> rows, {
    _i1.ColumnSelections<RideEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RideEvent>(
      rows,
      columns: columns?.call(RideEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RideEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RideEvent> updateRow(
    _i1.DatabaseSession session,
    RideEvent row, {
    _i1.ColumnSelections<RideEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RideEvent>(
      row,
      columns: columns?.call(RideEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RideEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RideEvent?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<RideEventUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RideEvent>(
      id,
      columnValues: columnValues(RideEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RideEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RideEvent>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RideEventUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RideEventTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideEventTable>? orderBy,
    _i1.OrderByListBuilder<RideEventTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RideEvent>(
      columnValues: columnValues(RideEvent.t.updateTable),
      where: where(RideEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RideEvent.t),
      orderByList: orderByList?.call(RideEvent.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RideEvent]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RideEvent>> delete(
    _i1.DatabaseSession session,
    List<RideEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RideEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RideEvent].
  Future<RideEvent> deleteRow(
    _i1.DatabaseSession session,
    RideEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RideEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RideEvent>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideEventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RideEvent>(
      where: where(RideEvent.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideEventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RideEvent>(
      where: where?.call(RideEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RideEvent] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideEventTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RideEvent>(
      where: where(RideEvent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
