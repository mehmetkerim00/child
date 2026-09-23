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
import 'application_status.dart' as _i2;

/// Анкета кандидата в водители.
///
/// Водители-няни — дефицитный ресурс и настоящий продукт (RESEARCH.md):
/// анкета заполняется с телефона, дальше её ведёт диспетчер по чек-листу.
abstract class DriverApplication
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DriverApplication._({
    this.id,
    required this.fullName,
    required this.phone,
    required this.experienceWithChildren,
    required this.drivingYears,
    required this.carModel,
    required this.carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    this.comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    this.driverId,
    this.rejectedReason,
  }) : isFemale = isFemale ?? false,
       hasChildSeat = hasChildSeat ?? false,
       status = status ?? _i2.ApplicationStatus.submitted,
       createdAt = createdAt ?? DateTime.now();

  factory DriverApplication({
    int? id,
    required String fullName,
    required String phone,
    required String experienceWithChildren,
    required int drivingYears,
    required String carModel,
    required String carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    String? comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    int? driverId,
    String? rejectedReason,
  }) = _DriverApplicationImpl;

  factory DriverApplication.fromJson(Map<String, dynamic> jsonSerialization) {
    return DriverApplication(
      id: jsonSerialization['id'] as int?,
      fullName: jsonSerialization['fullName'] as String,
      phone: jsonSerialization['phone'] as String,
      experienceWithChildren:
          jsonSerialization['experienceWithChildren'] as String,
      drivingYears: jsonSerialization['drivingYears'] as int,
      carModel: jsonSerialization['carModel'] as String,
      carPlate: jsonSerialization['carPlate'] as String,
      isFemale: jsonSerialization['isFemale'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isFemale']),
      hasChildSeat: jsonSerialization['hasChildSeat'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['hasChildSeat']),
      comment: jsonSerialization['comment'] as String?,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.ApplicationStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      driverId: jsonSerialization['driverId'] as int?,
      rejectedReason: jsonSerialization['rejectedReason'] as String?,
    );
  }

  static final t = DriverApplicationTable();

  static const db = DriverApplicationRepository._();

  @override
  int? id;

  String fullName;

  String phone;

  /// Опыт работы с детьми: свои дети, садик, школа, секция.
  String experienceWithChildren;

  /// Водительский стаж в годах.
  int drivingYears;

  String carModel;

  String carPlate;

  bool isFemale;

  /// Есть ли детское кресло у кандидата.
  bool hasChildSeat;

  String? comment;

  _i2.ApplicationStatus status;

  DateTime createdAt;

  /// Водитель, созданный из этой анкеты после найма.
  int? driverId;

  String? rejectedReason;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DriverApplication]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DriverApplication copyWith({
    int? id,
    String? fullName,
    String? phone,
    String? experienceWithChildren,
    int? drivingYears,
    String? carModel,
    String? carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    String? comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    int? driverId,
    String? rejectedReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DriverApplication',
      if (id != null) 'id': id,
      'fullName': fullName,
      'phone': phone,
      'experienceWithChildren': experienceWithChildren,
      'drivingYears': drivingYears,
      'carModel': carModel,
      'carPlate': carPlate,
      'isFemale': isFemale,
      'hasChildSeat': hasChildSeat,
      if (comment != null) 'comment': comment,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (driverId != null) 'driverId': driverId,
      if (rejectedReason != null) 'rejectedReason': rejectedReason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DriverApplication',
      if (id != null) 'id': id,
      'fullName': fullName,
      'phone': phone,
      'experienceWithChildren': experienceWithChildren,
      'drivingYears': drivingYears,
      'carModel': carModel,
      'carPlate': carPlate,
      'isFemale': isFemale,
      'hasChildSeat': hasChildSeat,
      if (comment != null) 'comment': comment,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (driverId != null) 'driverId': driverId,
      if (rejectedReason != null) 'rejectedReason': rejectedReason,
    };
  }

  static DriverApplicationInclude include() {
    return DriverApplicationInclude._();
  }

  static DriverApplicationIncludeList includeList({
    _i1.WhereExpressionBuilder<DriverApplicationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverApplicationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverApplicationTable>? orderByList,
    DriverApplicationInclude? include,
  }) {
    return DriverApplicationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DriverApplication.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DriverApplication.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DriverApplicationImpl extends DriverApplication {
  _DriverApplicationImpl({
    int? id,
    required String fullName,
    required String phone,
    required String experienceWithChildren,
    required int drivingYears,
    required String carModel,
    required String carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    String? comment,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    int? driverId,
    String? rejectedReason,
  }) : super._(
         id: id,
         fullName: fullName,
         phone: phone,
         experienceWithChildren: experienceWithChildren,
         drivingYears: drivingYears,
         carModel: carModel,
         carPlate: carPlate,
         isFemale: isFemale,
         hasChildSeat: hasChildSeat,
         comment: comment,
         status: status,
         createdAt: createdAt,
         driverId: driverId,
         rejectedReason: rejectedReason,
       );

  /// Returns a shallow copy of this [DriverApplication]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DriverApplication copyWith({
    Object? id = _Undefined,
    String? fullName,
    String? phone,
    String? experienceWithChildren,
    int? drivingYears,
    String? carModel,
    String? carPlate,
    bool? isFemale,
    bool? hasChildSeat,
    Object? comment = _Undefined,
    _i2.ApplicationStatus? status,
    DateTime? createdAt,
    Object? driverId = _Undefined,
    Object? rejectedReason = _Undefined,
  }) {
    return DriverApplication(
      id: id is int? ? id : this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      experienceWithChildren:
          experienceWithChildren ?? this.experienceWithChildren,
      drivingYears: drivingYears ?? this.drivingYears,
      carModel: carModel ?? this.carModel,
      carPlate: carPlate ?? this.carPlate,
      isFemale: isFemale ?? this.isFemale,
      hasChildSeat: hasChildSeat ?? this.hasChildSeat,
      comment: comment is String? ? comment : this.comment,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      driverId: driverId is int? ? driverId : this.driverId,
      rejectedReason: rejectedReason is String?
          ? rejectedReason
          : this.rejectedReason,
    );
  }
}

class DriverApplicationUpdateTable
    extends _i1.UpdateTable<DriverApplicationTable> {
  DriverApplicationUpdateTable(super.table);

  _i1.ColumnValue<String, String> fullName(String value) => _i1.ColumnValue(
    table.fullName,
    value,
  );

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> experienceWithChildren(String value) =>
      _i1.ColumnValue(
        table.experienceWithChildren,
        value,
      );

  _i1.ColumnValue<int, int> drivingYears(int value) => _i1.ColumnValue(
    table.drivingYears,
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

  _i1.ColumnValue<bool, bool> isFemale(bool value) => _i1.ColumnValue(
    table.isFemale,
    value,
  );

  _i1.ColumnValue<bool, bool> hasChildSeat(bool value) => _i1.ColumnValue(
    table.hasChildSeat,
    value,
  );

  _i1.ColumnValue<String, String> comment(String? value) => _i1.ColumnValue(
    table.comment,
    value,
  );

  _i1.ColumnValue<_i2.ApplicationStatus, _i2.ApplicationStatus> status(
    _i2.ApplicationStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<int, int> driverId(int? value) => _i1.ColumnValue(
    table.driverId,
    value,
  );

  _i1.ColumnValue<String, String> rejectedReason(String? value) =>
      _i1.ColumnValue(
        table.rejectedReason,
        value,
      );
}

class DriverApplicationTable extends _i1.Table<int?> {
  DriverApplicationTable({super.tableRelation})
    : super(tableName: 'driver_application') {
    updateTable = DriverApplicationUpdateTable(this);
    fullName = _i1.ColumnString(
      'fullName',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    experienceWithChildren = _i1.ColumnString(
      'experienceWithChildren',
      this,
    );
    drivingYears = _i1.ColumnInt(
      'drivingYears',
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
    isFemale = _i1.ColumnBool(
      'isFemale',
      this,
      hasDefault: true,
    );
    hasChildSeat = _i1.ColumnBool(
      'hasChildSeat',
      this,
      hasDefault: true,
    );
    comment = _i1.ColumnString(
      'comment',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    rejectedReason = _i1.ColumnString(
      'rejectedReason',
      this,
    );
  }

  late final DriverApplicationUpdateTable updateTable;

  late final _i1.ColumnString fullName;

  late final _i1.ColumnString phone;

  /// Опыт работы с детьми: свои дети, садик, школа, секция.
  late final _i1.ColumnString experienceWithChildren;

  /// Водительский стаж в годах.
  late final _i1.ColumnInt drivingYears;

  late final _i1.ColumnString carModel;

  late final _i1.ColumnString carPlate;

  late final _i1.ColumnBool isFemale;

  /// Есть ли детское кресло у кандидата.
  late final _i1.ColumnBool hasChildSeat;

  late final _i1.ColumnString comment;

  late final _i1.ColumnEnum<_i2.ApplicationStatus> status;

  late final _i1.ColumnDateTime createdAt;

  /// Водитель, созданный из этой анкеты после найма.
  late final _i1.ColumnInt driverId;

  late final _i1.ColumnString rejectedReason;

  @override
  List<_i1.Column> get columns => [
    id,
    fullName,
    phone,
    experienceWithChildren,
    drivingYears,
    carModel,
    carPlate,
    isFemale,
    hasChildSeat,
    comment,
    status,
    createdAt,
    driverId,
    rejectedReason,
  ];
}

class DriverApplicationInclude extends _i1.IncludeObject {
  DriverApplicationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DriverApplication.t;
}

class DriverApplicationIncludeList extends _i1.IncludeList {
  DriverApplicationIncludeList._({
    _i1.WhereExpressionBuilder<DriverApplicationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DriverApplication.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DriverApplication.t;
}

class DriverApplicationRepository {
  const DriverApplicationRepository._();

  /// Returns a list of [DriverApplication]s matching the given query parameters.
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
  Future<List<DriverApplication>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DriverApplicationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverApplicationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverApplicationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DriverApplication>(
      where: where?.call(DriverApplication.t),
      orderBy: orderBy?.call(DriverApplication.t),
      orderByList: orderByList?.call(DriverApplication.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [DriverApplication] matching the given query parameters.
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
  Future<DriverApplication?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DriverApplicationTable>? where,
    int? offset,
    _i1.OrderByBuilder<DriverApplicationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverApplicationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DriverApplication>(
      where: where?.call(DriverApplication.t),
      orderBy: orderBy?.call(DriverApplication.t),
      orderByList: orderByList?.call(DriverApplication.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DriverApplication] by its [id] or null if no such row exists.
  Future<DriverApplication?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<DriverApplication>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [DriverApplication]s in the list and returns the inserted rows.
  ///
  /// The returned [DriverApplication]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<DriverApplication>> insert(
    _i1.DatabaseSession session,
    List<DriverApplication> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<DriverApplication>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [DriverApplication] and returns the inserted row.
  ///
  /// The returned [DriverApplication] will have its `id` field set.
  Future<DriverApplication> insertRow(
    _i1.DatabaseSession session,
    DriverApplication row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DriverApplication>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DriverApplication]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DriverApplication>> update(
    _i1.DatabaseSession session,
    List<DriverApplication> rows, {
    _i1.ColumnSelections<DriverApplicationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DriverApplication>(
      rows,
      columns: columns?.call(DriverApplication.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DriverApplication]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DriverApplication> updateRow(
    _i1.DatabaseSession session,
    DriverApplication row, {
    _i1.ColumnSelections<DriverApplicationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DriverApplication>(
      row,
      columns: columns?.call(DriverApplication.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DriverApplication] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DriverApplication?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<DriverApplicationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DriverApplication>(
      id,
      columnValues: columnValues(DriverApplication.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DriverApplication]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DriverApplication>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DriverApplicationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<DriverApplicationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverApplicationTable>? orderBy,
    _i1.OrderByListBuilder<DriverApplicationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DriverApplication>(
      columnValues: columnValues(DriverApplication.t.updateTable),
      where: where(DriverApplication.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DriverApplication.t),
      orderByList: orderByList?.call(DriverApplication.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DriverApplication]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DriverApplication>> delete(
    _i1.DatabaseSession session,
    List<DriverApplication> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DriverApplication>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DriverApplication].
  Future<DriverApplication> deleteRow(
    _i1.DatabaseSession session,
    DriverApplication row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DriverApplication>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DriverApplication>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DriverApplicationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DriverApplication>(
      where: where(DriverApplication.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DriverApplicationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DriverApplication>(
      where: where?.call(DriverApplication.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DriverApplication] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DriverApplicationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DriverApplication>(
      where: where(DriverApplication.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
