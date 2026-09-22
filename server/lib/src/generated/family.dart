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
import 'sms_level.dart' as _i2;

/// Семья — владелец баланса и подписки на маршруты.
abstract class Family implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Family._({
    this.id,
    required this.name,
    required this.ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) : locale = locale ?? 'ru',
       smsLevel = smsLevel ?? _i2.SmsLevel.all,
       createdAt = createdAt ?? DateTime.now();

  factory Family({
    int? id,
    required String name,
    required String ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) = _FamilyImpl;

  factory Family.fromJson(Map<String, dynamic> jsonSerialization) {
    return Family(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      ownerPhone: jsonSerialization['ownerPhone'] as String,
      locale: jsonSerialization['locale'] as String?,
      smsLevel: jsonSerialization['smsLevel'] == null
          ? null
          : _i2.SmsLevel.fromJson((jsonSerialization['smsLevel'] as String)),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = FamilyTable();

  static const db = FamilyRepository._();

  @override
  int? id;

  /// Фамилия/название семьи для списков диспетчера.
  String name;

  /// Телефон родителя-владельца в формате +993XXXXXXXX.
  String ownerPhone;

  /// Язык интерфейса и SMS: ru или tk.
  String locale;

  _i2.SmsLevel smsLevel;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Family]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Family copyWith({
    int? id,
    String? name,
    String? ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Family',
      if (id != null) 'id': id,
      'name': name,
      'ownerPhone': ownerPhone,
      'locale': locale,
      'smsLevel': smsLevel.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Family',
      if (id != null) 'id': id,
      'name': name,
      'ownerPhone': ownerPhone,
      'locale': locale,
      'smsLevel': smsLevel.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static FamilyInclude include() {
    return FamilyInclude._();
  }

  static FamilyIncludeList includeList({
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyTable>? orderByList,
    FamilyInclude? include,
  }) {
    return FamilyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Family.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Family.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FamilyImpl extends Family {
  _FamilyImpl({
    int? id,
    required String name,
    required String ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) : super._(
         id: id,
         name: name,
         ownerPhone: ownerPhone,
         locale: locale,
         smsLevel: smsLevel,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Family]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Family copyWith({
    Object? id = _Undefined,
    String? name,
    String? ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) {
    return Family(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      locale: locale ?? this.locale,
      smsLevel: smsLevel ?? this.smsLevel,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class FamilyUpdateTable extends _i1.UpdateTable<FamilyTable> {
  FamilyUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> ownerPhone(String value) => _i1.ColumnValue(
    table.ownerPhone,
    value,
  );

  _i1.ColumnValue<String, String> locale(String value) => _i1.ColumnValue(
    table.locale,
    value,
  );

  _i1.ColumnValue<_i2.SmsLevel, _i2.SmsLevel> smsLevel(_i2.SmsLevel value) =>
      _i1.ColumnValue(
        table.smsLevel,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class FamilyTable extends _i1.Table<int?> {
  FamilyTable({super.tableRelation}) : super(tableName: 'family') {
    updateTable = FamilyUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    ownerPhone = _i1.ColumnString(
      'ownerPhone',
      this,
    );
    locale = _i1.ColumnString(
      'locale',
      this,
      hasDefault: true,
    );
    smsLevel = _i1.ColumnEnum(
      'smsLevel',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final FamilyUpdateTable updateTable;

  /// Фамилия/название семьи для списков диспетчера.
  late final _i1.ColumnString name;

  /// Телефон родителя-владельца в формате +993XXXXXXXX.
  late final _i1.ColumnString ownerPhone;

  /// Язык интерфейса и SMS: ru или tk.
  late final _i1.ColumnString locale;

  late final _i1.ColumnEnum<_i2.SmsLevel> smsLevel;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    ownerPhone,
    locale,
    smsLevel,
    createdAt,
  ];
}

class FamilyInclude extends _i1.IncludeObject {
  FamilyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Family.t;
}

class FamilyIncludeList extends _i1.IncludeList {
  FamilyIncludeList._({
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Family.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Family.t;
}

class FamilyRepository {
  const FamilyRepository._();

  /// Returns a list of [Family]s matching the given query parameters.
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
  Future<List<Family>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Family>(
      where: where?.call(Family.t),
      orderBy: orderBy?.call(Family.t),
      orderByList: orderByList?.call(Family.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Family] matching the given query parameters.
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
  Future<Family?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? offset,
    _i1.OrderByBuilder<FamilyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Family>(
      where: where?.call(Family.t),
      orderBy: orderBy?.call(Family.t),
      orderByList: orderByList?.call(Family.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Family] by its [id] or null if no such row exists.
  Future<Family?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Family>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Family]s in the list and returns the inserted rows.
  ///
  /// The returned [Family]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Family>> insert(
    _i1.DatabaseSession session,
    List<Family> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Family>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Family] and returns the inserted row.
  ///
  /// The returned [Family] will have its `id` field set.
  Future<Family> insertRow(
    _i1.DatabaseSession session,
    Family row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Family>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Family]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Family>> update(
    _i1.DatabaseSession session,
    List<Family> rows, {
    _i1.ColumnSelections<FamilyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Family>(
      rows,
      columns: columns?.call(Family.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Family]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Family> updateRow(
    _i1.DatabaseSession session,
    Family row, {
    _i1.ColumnSelections<FamilyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Family>(
      row,
      columns: columns?.call(Family.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Family] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Family?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<FamilyUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Family>(
      id,
      columnValues: columnValues(Family.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Family]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Family>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<FamilyUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<FamilyTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyTable>? orderBy,
    _i1.OrderByListBuilder<FamilyTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Family>(
      columnValues: columnValues(Family.t.updateTable),
      where: where(Family.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Family.t),
      orderByList: orderByList?.call(Family.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Family]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Family>> delete(
    _i1.DatabaseSession session,
    List<Family> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Family>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Family].
  Future<Family> deleteRow(
    _i1.DatabaseSession session,
    Family row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Family>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Family>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<FamilyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Family>(
      where: where(Family.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Family>(
      where: where?.call(Family.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Family] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<FamilyTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Family>(
      where: where(Family.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
