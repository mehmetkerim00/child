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
import 'route_direction.dart' as _i2;
import 'package:child_server/src/generated/protocol.dart' as _i3;

/// Шаблон регулярного маршрута: заявку создаёт родитель, активирует диспетчер.
abstract class RouteTemplate
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RouteTemplate._({
    this.id,
    required this.childId,
    required this.weekdays,
    required this.pickupTime,
    required this.fromAddress,
    this.fromLat,
    this.fromLng,
    this.toInstitutionId,
    this.toAddress,
    required this.direction,
    this.driverId,
    int? pricePerRideTenge,
    bool? active,
    DateTime? createdAt,
  }) : pricePerRideTenge = pricePerRideTenge ?? 0,
       active = active ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory RouteTemplate({
    int? id,
    required int childId,
    required List<int> weekdays,
    required String pickupTime,
    required String fromAddress,
    double? fromLat,
    double? fromLng,
    int? toInstitutionId,
    String? toAddress,
    required _i2.RouteDirection direction,
    int? driverId,
    int? pricePerRideTenge,
    bool? active,
    DateTime? createdAt,
  }) = _RouteTemplateImpl;

  factory RouteTemplate.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteTemplate(
      id: jsonSerialization['id'] as int?,
      childId: jsonSerialization['childId'] as int,
      weekdays: _i3.Protocol().deserialize<List<int>>(
        jsonSerialization['weekdays'],
      ),
      pickupTime: jsonSerialization['pickupTime'] as String,
      fromAddress: jsonSerialization['fromAddress'] as String,
      fromLat: (jsonSerialization['fromLat'] as num?)?.toDouble(),
      fromLng: (jsonSerialization['fromLng'] as num?)?.toDouble(),
      toInstitutionId: jsonSerialization['toInstitutionId'] as int?,
      toAddress: jsonSerialization['toAddress'] as String?,
      direction: _i2.RouteDirection.fromJson(
        (jsonSerialization['direction'] as String),
      ),
      driverId: jsonSerialization['driverId'] as int?,
      pricePerRideTenge: jsonSerialization['pricePerRideTenge'] as int?,
      active: jsonSerialization['active'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['active']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = RouteTemplateTable();

  static const db = RouteTemplateRepository._();

  @override
  int? id;

  int childId;

  /// Дни недели: 1 — понедельник … 7 — воскресенье.
  List<int> weekdays;

  /// Время подачи в формате HH:mm (местное время Ашхабада).
  String pickupTime;

  String fromAddress;

  double? fromLat;

  double? fromLng;

  int? toInstitutionId;

  String? toAddress;

  _i2.RouteDirection direction;

  int? driverId;

  /// Цена поездки в тенге (целое число).
  int pricePerRideTenge;

  /// false — заявка ждёт активации диспетчером.
  bool active;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RouteTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteTemplate copyWith({
    int? id,
    int? childId,
    List<int>? weekdays,
    String? pickupTime,
    String? fromAddress,
    double? fromLat,
    double? fromLng,
    int? toInstitutionId,
    String? toAddress,
    _i2.RouteDirection? direction,
    int? driverId,
    int? pricePerRideTenge,
    bool? active,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RouteTemplate',
      if (id != null) 'id': id,
      'childId': childId,
      'weekdays': weekdays.toJson(),
      'pickupTime': pickupTime,
      'fromAddress': fromAddress,
      if (fromLat != null) 'fromLat': fromLat,
      if (fromLng != null) 'fromLng': fromLng,
      if (toInstitutionId != null) 'toInstitutionId': toInstitutionId,
      if (toAddress != null) 'toAddress': toAddress,
      'direction': direction.toJson(),
      if (driverId != null) 'driverId': driverId,
      'pricePerRideTenge': pricePerRideTenge,
      'active': active,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RouteTemplate',
      if (id != null) 'id': id,
      'childId': childId,
      'weekdays': weekdays.toJson(),
      'pickupTime': pickupTime,
      'fromAddress': fromAddress,
      if (fromLat != null) 'fromLat': fromLat,
      if (fromLng != null) 'fromLng': fromLng,
      if (toInstitutionId != null) 'toInstitutionId': toInstitutionId,
      if (toAddress != null) 'toAddress': toAddress,
      'direction': direction.toJson(),
      if (driverId != null) 'driverId': driverId,
      'pricePerRideTenge': pricePerRideTenge,
      'active': active,
      'createdAt': createdAt.toJson(),
    };
  }

  static RouteTemplateInclude include() {
    return RouteTemplateInclude._();
  }

  static RouteTemplateIncludeList includeList({
    _i1.WhereExpressionBuilder<RouteTemplateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteTemplateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteTemplateTable>? orderByList,
    RouteTemplateInclude? include,
  }) {
    return RouteTemplateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RouteTemplate.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RouteTemplate.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteTemplateImpl extends RouteTemplate {
  _RouteTemplateImpl({
    int? id,
    required int childId,
    required List<int> weekdays,
    required String pickupTime,
    required String fromAddress,
    double? fromLat,
    double? fromLng,
    int? toInstitutionId,
    String? toAddress,
    required _i2.RouteDirection direction,
    int? driverId,
    int? pricePerRideTenge,
    bool? active,
    DateTime? createdAt,
  }) : super._(
         id: id,
         childId: childId,
         weekdays: weekdays,
         pickupTime: pickupTime,
         fromAddress: fromAddress,
         fromLat: fromLat,
         fromLng: fromLng,
         toInstitutionId: toInstitutionId,
         toAddress: toAddress,
         direction: direction,
         driverId: driverId,
         pricePerRideTenge: pricePerRideTenge,
         active: active,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RouteTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteTemplate copyWith({
    Object? id = _Undefined,
    int? childId,
    List<int>? weekdays,
    String? pickupTime,
    String? fromAddress,
    Object? fromLat = _Undefined,
    Object? fromLng = _Undefined,
    Object? toInstitutionId = _Undefined,
    Object? toAddress = _Undefined,
    _i2.RouteDirection? direction,
    Object? driverId = _Undefined,
    int? pricePerRideTenge,
    bool? active,
    DateTime? createdAt,
  }) {
    return RouteTemplate(
      id: id is int? ? id : this.id,
      childId: childId ?? this.childId,
      weekdays: weekdays ?? this.weekdays.map((e0) => e0).toList(),
      pickupTime: pickupTime ?? this.pickupTime,
      fromAddress: fromAddress ?? this.fromAddress,
      fromLat: fromLat is double? ? fromLat : this.fromLat,
      fromLng: fromLng is double? ? fromLng : this.fromLng,
      toInstitutionId: toInstitutionId is int?
          ? toInstitutionId
          : this.toInstitutionId,
      toAddress: toAddress is String? ? toAddress : this.toAddress,
      direction: direction ?? this.direction,
      driverId: driverId is int? ? driverId : this.driverId,
      pricePerRideTenge: pricePerRideTenge ?? this.pricePerRideTenge,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RouteTemplateUpdateTable extends _i1.UpdateTable<RouteTemplateTable> {
  RouteTemplateUpdateTable(super.table);

  _i1.ColumnValue<int, int> childId(int value) => _i1.ColumnValue(
    table.childId,
    value,
  );

  _i1.ColumnValue<List<int>, List<int>> weekdays(List<int> value) =>
      _i1.ColumnValue(
        table.weekdays,
        value,
      );

  _i1.ColumnValue<String, String> pickupTime(String value) => _i1.ColumnValue(
    table.pickupTime,
    value,
  );

  _i1.ColumnValue<String, String> fromAddress(String value) => _i1.ColumnValue(
    table.fromAddress,
    value,
  );

  _i1.ColumnValue<double, double> fromLat(double? value) => _i1.ColumnValue(
    table.fromLat,
    value,
  );

  _i1.ColumnValue<double, double> fromLng(double? value) => _i1.ColumnValue(
    table.fromLng,
    value,
  );

  _i1.ColumnValue<int, int> toInstitutionId(int? value) => _i1.ColumnValue(
    table.toInstitutionId,
    value,
  );

  _i1.ColumnValue<String, String> toAddress(String? value) => _i1.ColumnValue(
    table.toAddress,
    value,
  );

  _i1.ColumnValue<_i2.RouteDirection, _i2.RouteDirection> direction(
    _i2.RouteDirection value,
  ) => _i1.ColumnValue(
    table.direction,
    value,
  );

  _i1.ColumnValue<int, int> driverId(int? value) => _i1.ColumnValue(
    table.driverId,
    value,
  );

  _i1.ColumnValue<int, int> pricePerRideTenge(int value) => _i1.ColumnValue(
    table.pricePerRideTenge,
    value,
  );

  _i1.ColumnValue<bool, bool> active(bool value) => _i1.ColumnValue(
    table.active,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class RouteTemplateTable extends _i1.Table<int?> {
  RouteTemplateTable({super.tableRelation})
    : super(tableName: 'route_template') {
    updateTable = RouteTemplateUpdateTable(this);
    childId = _i1.ColumnInt(
      'childId',
      this,
    );
    weekdays = _i1.ColumnSerializable<List<int>>(
      'weekdays',
      this,
    );
    pickupTime = _i1.ColumnString(
      'pickupTime',
      this,
    );
    fromAddress = _i1.ColumnString(
      'fromAddress',
      this,
    );
    fromLat = _i1.ColumnDouble(
      'fromLat',
      this,
    );
    fromLng = _i1.ColumnDouble(
      'fromLng',
      this,
    );
    toInstitutionId = _i1.ColumnInt(
      'toInstitutionId',
      this,
    );
    toAddress = _i1.ColumnString(
      'toAddress',
      this,
    );
    direction = _i1.ColumnEnum(
      'direction',
      this,
      _i1.EnumSerialization.byName,
    );
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    pricePerRideTenge = _i1.ColumnInt(
      'pricePerRideTenge',
      this,
      hasDefault: true,
    );
    active = _i1.ColumnBool(
      'active',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final RouteTemplateUpdateTable updateTable;

  late final _i1.ColumnInt childId;

  /// Дни недели: 1 — понедельник … 7 — воскресенье.
  late final _i1.ColumnSerializable<List<int>> weekdays;

  /// Время подачи в формате HH:mm (местное время Ашхабада).
  late final _i1.ColumnString pickupTime;

  late final _i1.ColumnString fromAddress;

  late final _i1.ColumnDouble fromLat;

  late final _i1.ColumnDouble fromLng;

  late final _i1.ColumnInt toInstitutionId;

  late final _i1.ColumnString toAddress;

  late final _i1.ColumnEnum<_i2.RouteDirection> direction;

  late final _i1.ColumnInt driverId;

  /// Цена поездки в тенге (целое число).
  late final _i1.ColumnInt pricePerRideTenge;

  /// false — заявка ждёт активации диспетчером.
  late final _i1.ColumnBool active;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    childId,
    weekdays,
    pickupTime,
    fromAddress,
    fromLat,
    fromLng,
    toInstitutionId,
    toAddress,
    direction,
    driverId,
    pricePerRideTenge,
    active,
    createdAt,
  ];
}

class RouteTemplateInclude extends _i1.IncludeObject {
  RouteTemplateInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RouteTemplate.t;
}

class RouteTemplateIncludeList extends _i1.IncludeList {
  RouteTemplateIncludeList._({
    _i1.WhereExpressionBuilder<RouteTemplateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RouteTemplate.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RouteTemplate.t;
}

class RouteTemplateRepository {
  const RouteTemplateRepository._();

  /// Returns a list of [RouteTemplate]s matching the given query parameters.
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
  Future<List<RouteTemplate>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RouteTemplateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteTemplateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RouteTemplate>(
      where: where?.call(RouteTemplate.t),
      orderBy: orderBy?.call(RouteTemplate.t),
      orderByList: orderByList?.call(RouteTemplate.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RouteTemplate] matching the given query parameters.
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
  Future<RouteTemplate?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RouteTemplateTable>? where,
    int? offset,
    _i1.OrderByBuilder<RouteTemplateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RouteTemplate>(
      where: where?.call(RouteTemplate.t),
      orderBy: orderBy?.call(RouteTemplate.t),
      orderByList: orderByList?.call(RouteTemplate.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RouteTemplate] by its [id] or null if no such row exists.
  Future<RouteTemplate?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RouteTemplate>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RouteTemplate]s in the list and returns the inserted rows.
  ///
  /// The returned [RouteTemplate]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<RouteTemplate>> insert(
    _i1.DatabaseSession session,
    List<RouteTemplate> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<RouteTemplate>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [RouteTemplate] and returns the inserted row.
  ///
  /// The returned [RouteTemplate] will have its `id` field set.
  Future<RouteTemplate> insertRow(
    _i1.DatabaseSession session,
    RouteTemplate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RouteTemplate>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RouteTemplate]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RouteTemplate>> update(
    _i1.DatabaseSession session,
    List<RouteTemplate> rows, {
    _i1.ColumnSelections<RouteTemplateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RouteTemplate>(
      rows,
      columns: columns?.call(RouteTemplate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RouteTemplate]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RouteTemplate> updateRow(
    _i1.DatabaseSession session,
    RouteTemplate row, {
    _i1.ColumnSelections<RouteTemplateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RouteTemplate>(
      row,
      columns: columns?.call(RouteTemplate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RouteTemplate] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RouteTemplate?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<RouteTemplateUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RouteTemplate>(
      id,
      columnValues: columnValues(RouteTemplate.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RouteTemplate]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RouteTemplate>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RouteTemplateUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RouteTemplateTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteTemplateTable>? orderBy,
    _i1.OrderByListBuilder<RouteTemplateTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RouteTemplate>(
      columnValues: columnValues(RouteTemplate.t.updateTable),
      where: where(RouteTemplate.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RouteTemplate.t),
      orderByList: orderByList?.call(RouteTemplate.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RouteTemplate]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RouteTemplate>> delete(
    _i1.DatabaseSession session,
    List<RouteTemplate> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RouteTemplate>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RouteTemplate].
  Future<RouteTemplate> deleteRow(
    _i1.DatabaseSession session,
    RouteTemplate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RouteTemplate>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RouteTemplate>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RouteTemplateTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RouteTemplate>(
      where: where(RouteTemplate.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RouteTemplateTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RouteTemplate>(
      where: where?.call(RouteTemplate.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RouteTemplate] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RouteTemplateTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RouteTemplate>(
      where: where(RouteTemplate.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
