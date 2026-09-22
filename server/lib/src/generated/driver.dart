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
import 'vetting_status.dart' as _i2;

/// Водитель-няня. Аккаунт создаёт только диспетчер.
abstract class Driver implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Driver._({
    this.id,
    required this.phone,
    required this.name,
    required this.carModel,
    required this.carPlate,
    this.experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    this.photoUrl,
    bool? active,
    DateTime? createdAt,
  }) : vettingStatus = vettingStatus ?? _i2.VettingStatus.pending,
       isFemale = isFemale ?? false,
       active = active ?? true,
       createdAt = createdAt ?? DateTime.now();

  factory Driver({
    int? id,
    required String phone,
    required String name,
    required String carModel,
    required String carPlate,
    String? experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    String? photoUrl,
    bool? active,
    DateTime? createdAt,
  }) = _DriverImpl;

  factory Driver.fromJson(Map<String, dynamic> jsonSerialization) {
    return Driver(
      id: jsonSerialization['id'] as int?,
      phone: jsonSerialization['phone'] as String,
      name: jsonSerialization['name'] as String,
      carModel: jsonSerialization['carModel'] as String,
      carPlate: jsonSerialization['carPlate'] as String,
      experienceNote: jsonSerialization['experienceNote'] as String?,
      vettingStatus: jsonSerialization['vettingStatus'] == null
          ? null
          : _i2.VettingStatus.fromJson(
              (jsonSerialization['vettingStatus'] as String),
            ),
      isFemale: jsonSerialization['isFemale'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isFemale']),
      photoUrl: jsonSerialization['photoUrl'] as String?,
      active: jsonSerialization['active'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['active']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = DriverTable();

  static const db = DriverRepository._();

  @override
  int? id;

  String phone;

  String name;

  String carModel;

  String carPlate;

  String? experienceNote;

  _i2.VettingStatus vettingStatus;

  bool isFemale;

  String? photoUrl;

  bool active;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Driver]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Driver copyWith({
    int? id,
    String? phone,
    String? name,
    String? carModel,
    String? carPlate,
    String? experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    String? photoUrl,
    bool? active,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Driver',
      if (id != null) 'id': id,
      'phone': phone,
      'name': name,
      'carModel': carModel,
      'carPlate': carPlate,
      if (experienceNote != null) 'experienceNote': experienceNote,
      'vettingStatus': vettingStatus.toJson(),
      'isFemale': isFemale,
      if (photoUrl != null) 'photoUrl': photoUrl,
      'active': active,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Driver',
      if (id != null) 'id': id,
      'phone': phone,
      'name': name,
      'carModel': carModel,
      'carPlate': carPlate,
      if (experienceNote != null) 'experienceNote': experienceNote,
      'vettingStatus': vettingStatus.toJson(),
      'isFemale': isFemale,
      if (photoUrl != null) 'photoUrl': photoUrl,
      'active': active,
      'createdAt': createdAt.toJson(),
    };
  }

  static DriverInclude include() {
    return DriverInclude._();
  }

  static DriverIncludeList includeList({
    _i1.WhereExpressionBuilder<DriverTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverTable>? orderByList,
    DriverInclude? include,
  }) {
    return DriverIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Driver.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Driver.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DriverImpl extends Driver {
  _DriverImpl({
    int? id,
    required String phone,
    required String name,
    required String carModel,
    required String carPlate,
    String? experienceNote,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    String? photoUrl,
    bool? active,
    DateTime? createdAt,
  }) : super._(
         id: id,
         phone: phone,
         name: name,
         carModel: carModel,
         carPlate: carPlate,
         experienceNote: experienceNote,
         vettingStatus: vettingStatus,
         isFemale: isFemale,
         photoUrl: photoUrl,
         active: active,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Driver]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Driver copyWith({
    Object? id = _Undefined,
    String? phone,
    String? name,
    String? carModel,
    String? carPlate,
    Object? experienceNote = _Undefined,
    _i2.VettingStatus? vettingStatus,
    bool? isFemale,
    Object? photoUrl = _Undefined,
    bool? active,
    DateTime? createdAt,
  }) {
    return Driver(
      id: id is int? ? id : this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      carModel: carModel ?? this.carModel,
      carPlate: carPlate ?? this.carPlate,
      experienceNote: experienceNote is String?
          ? experienceNote
          : this.experienceNote,
      vettingStatus: vettingStatus ?? this.vettingStatus,
      isFemale: isFemale ?? this.isFemale,
      photoUrl: photoUrl is String? ? photoUrl : this.photoUrl,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class DriverUpdateTable extends _i1.UpdateTable<DriverTable> {
  DriverUpdateTable(super.table);

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> carModel(String value) => _i1.ColumnValue(
    table.carModel,
    value,
  );

  _i1.ColumnValue<String, String> carPlate(String value) => _i1.ColumnValue(
    table.carPlate,
    value,
  );

  _i1.ColumnValue<String, String> experienceNote(String? value) =>
      _i1.ColumnValue(
        table.experienceNote,
        value,
      );

  _i1.ColumnValue<_i2.VettingStatus, _i2.VettingStatus> vettingStatus(
    _i2.VettingStatus value,
  ) => _i1.ColumnValue(
    table.vettingStatus,
    value,
  );

  _i1.ColumnValue<bool, bool> isFemale(bool value) => _i1.ColumnValue(
    table.isFemale,
    value,
  );

  _i1.ColumnValue<String, String> photoUrl(String? value) => _i1.ColumnValue(
    table.photoUrl,
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

class DriverTable extends _i1.Table<int?> {
  DriverTable({super.tableRelation}) : super(tableName: 'driver') {
    updateTable = DriverUpdateTable(this);
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    carModel = _i1.ColumnString(
      'carModel',
      this,
    );
    carPlate = _i1.ColumnString(
      'carPlate',
      this,
    );
    experienceNote = _i1.ColumnString(
      'experienceNote',
      this,
    );
    vettingStatus = _i1.ColumnEnum(
      'vettingStatus',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    isFemale = _i1.ColumnBool(
      'isFemale',
      this,
      hasDefault: true,
    );
    photoUrl = _i1.ColumnString(
      'photoUrl',
      this,
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

  late final DriverUpdateTable updateTable;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString name;

  late final _i1.ColumnString carModel;

  late final _i1.ColumnString carPlate;

  late final _i1.ColumnString experienceNote;

  late final _i1.ColumnEnum<_i2.VettingStatus> vettingStatus;

  late final _i1.ColumnBool isFemale;

  late final _i1.ColumnString photoUrl;

  late final _i1.ColumnBool active;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    phone,
    name,
    carModel,
    carPlate,
    experienceNote,
    vettingStatus,
    isFemale,
    photoUrl,
    active,
    createdAt,
  ];
}

class DriverInclude extends _i1.IncludeObject {
  DriverInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Driver.t;
}

class DriverIncludeList extends _i1.IncludeList {
  DriverIncludeList._({
    _i1.WhereExpressionBuilder<DriverTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Driver.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Driver.t;
}

class DriverRepository {
  const DriverRepository._();

  /// Returns a list of [Driver]s matching the given query parameters.
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
  Future<List<Driver>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DriverTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Driver>(
      where: where?.call(Driver.t),
      orderBy: orderBy?.call(Driver.t),
      orderByList: orderByList?.call(Driver.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Driver] matching the given query parameters.
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
  Future<Driver?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DriverTable>? where,
    int? offset,
    _i1.OrderByBuilder<DriverTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Driver>(
      where: where?.call(Driver.t),
      orderBy: orderBy?.call(Driver.t),
      orderByList: orderByList?.call(Driver.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Driver] by its [id] or null if no such row exists.
  Future<Driver?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Driver>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Driver]s in the list and returns the inserted rows.
  ///
  /// The returned [Driver]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Driver>> insert(
    _i1.DatabaseSession session,
    List<Driver> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Driver>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Driver] and returns the inserted row.
  ///
  /// The returned [Driver] will have its `id` field set.
  Future<Driver> insertRow(
    _i1.DatabaseSession session,
    Driver row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Driver>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Driver]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Driver>> update(
    _i1.DatabaseSession session,
    List<Driver> rows, {
    _i1.ColumnSelections<DriverTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Driver>(
      rows,
      columns: columns?.call(Driver.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Driver]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Driver> updateRow(
    _i1.DatabaseSession session,
    Driver row, {
    _i1.ColumnSelections<DriverTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Driver>(
      row,
      columns: columns?.call(Driver.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Driver] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Driver?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<DriverUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Driver>(
      id,
      columnValues: columnValues(Driver.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Driver]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Driver>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DriverUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DriverTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverTable>? orderBy,
    _i1.OrderByListBuilder<DriverTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Driver>(
      columnValues: columnValues(Driver.t.updateTable),
      where: where(Driver.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Driver.t),
      orderByList: orderByList?.call(Driver.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Driver]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Driver>> delete(
    _i1.DatabaseSession session,
    List<Driver> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Driver>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Driver].
  Future<Driver> deleteRow(
    _i1.DatabaseSession session,
    Driver row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Driver>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Driver>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DriverTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Driver>(
      where: where(Driver.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DriverTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Driver>(
      where: where?.call(Driver.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Driver] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DriverTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Driver>(
      where: where(Driver.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
