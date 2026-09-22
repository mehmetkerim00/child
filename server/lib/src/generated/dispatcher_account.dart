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

/// Сотрудник диспетчерской. Создаётся сидами/вручную в БД.
abstract class DispatcherAccount
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DispatcherAccount._({
    this.id,
    required this.phone,
    required this.name,
    bool? active,
    DateTime? createdAt,
  }) : active = active ?? true,
       createdAt = createdAt ?? DateTime.now();

  factory DispatcherAccount({
    int? id,
    required String phone,
    required String name,
    bool? active,
    DateTime? createdAt,
  }) = _DispatcherAccountImpl;

  factory DispatcherAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return DispatcherAccount(
      id: jsonSerialization['id'] as int?,
      phone: jsonSerialization['phone'] as String,
      name: jsonSerialization['name'] as String,
      active: jsonSerialization['active'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['active']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = DispatcherAccountTable();

  static const db = DispatcherAccountRepository._();

  @override
  int? id;

  String phone;

  String name;

  bool active;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DispatcherAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DispatcherAccount copyWith({
    int? id,
    String? phone,
    String? name,
    bool? active,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DispatcherAccount',
      if (id != null) 'id': id,
      'phone': phone,
      'name': name,
      'active': active,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DispatcherAccount',
      if (id != null) 'id': id,
      'phone': phone,
      'name': name,
      'active': active,
      'createdAt': createdAt.toJson(),
    };
  }

  static DispatcherAccountInclude include() {
    return DispatcherAccountInclude._();
  }

  static DispatcherAccountIncludeList includeList({
    _i1.WhereExpressionBuilder<DispatcherAccountTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DispatcherAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DispatcherAccountTable>? orderByList,
    DispatcherAccountInclude? include,
  }) {
    return DispatcherAccountIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DispatcherAccount.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DispatcherAccount.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DispatcherAccountImpl extends DispatcherAccount {
  _DispatcherAccountImpl({
    int? id,
    required String phone,
    required String name,
    bool? active,
    DateTime? createdAt,
  }) : super._(
         id: id,
         phone: phone,
         name: name,
         active: active,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [DispatcherAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DispatcherAccount copyWith({
    Object? id = _Undefined,
    String? phone,
    String? name,
    bool? active,
    DateTime? createdAt,
  }) {
    return DispatcherAccount(
      id: id is int? ? id : this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class DispatcherAccountUpdateTable
    extends _i1.UpdateTable<DispatcherAccountTable> {
  DispatcherAccountUpdateTable(super.table);

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
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

class DispatcherAccountTable extends _i1.Table<int?> {
  DispatcherAccountTable({super.tableRelation})
    : super(tableName: 'dispatcher_account') {
    updateTable = DispatcherAccountUpdateTable(this);
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    name = _i1.ColumnString(
      'name',
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

  late final DispatcherAccountUpdateTable updateTable;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString name;

  late final _i1.ColumnBool active;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    phone,
    name,
    active,
    createdAt,
  ];
}

class DispatcherAccountInclude extends _i1.IncludeObject {
  DispatcherAccountInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DispatcherAccount.t;
}

class DispatcherAccountIncludeList extends _i1.IncludeList {
  DispatcherAccountIncludeList._({
    _i1.WhereExpressionBuilder<DispatcherAccountTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DispatcherAccount.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DispatcherAccount.t;
}

class DispatcherAccountRepository {
  const DispatcherAccountRepository._();

  /// Returns a list of [DispatcherAccount]s matching the given query parameters.
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
  Future<List<DispatcherAccount>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DispatcherAccountTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DispatcherAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DispatcherAccountTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DispatcherAccount>(
      where: where?.call(DispatcherAccount.t),
      orderBy: orderBy?.call(DispatcherAccount.t),
      orderByList: orderByList?.call(DispatcherAccount.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [DispatcherAccount] matching the given query parameters.
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
  Future<DispatcherAccount?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DispatcherAccountTable>? where,
    int? offset,
    _i1.OrderByBuilder<DispatcherAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DispatcherAccountTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DispatcherAccount>(
      where: where?.call(DispatcherAccount.t),
      orderBy: orderBy?.call(DispatcherAccount.t),
      orderByList: orderByList?.call(DispatcherAccount.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DispatcherAccount] by its [id] or null if no such row exists.
  Future<DispatcherAccount?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<DispatcherAccount>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [DispatcherAccount]s in the list and returns the inserted rows.
  ///
  /// The returned [DispatcherAccount]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<DispatcherAccount>> insert(
    _i1.DatabaseSession session,
    List<DispatcherAccount> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<DispatcherAccount>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [DispatcherAccount] and returns the inserted row.
  ///
  /// The returned [DispatcherAccount] will have its `id` field set.
  Future<DispatcherAccount> insertRow(
    _i1.DatabaseSession session,
    DispatcherAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DispatcherAccount>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DispatcherAccount]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DispatcherAccount>> update(
    _i1.DatabaseSession session,
    List<DispatcherAccount> rows, {
    _i1.ColumnSelections<DispatcherAccountTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DispatcherAccount>(
      rows,
      columns: columns?.call(DispatcherAccount.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DispatcherAccount]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DispatcherAccount> updateRow(
    _i1.DatabaseSession session,
    DispatcherAccount row, {
    _i1.ColumnSelections<DispatcherAccountTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DispatcherAccount>(
      row,
      columns: columns?.call(DispatcherAccount.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DispatcherAccount] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DispatcherAccount?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<DispatcherAccountUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DispatcherAccount>(
      id,
      columnValues: columnValues(DispatcherAccount.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DispatcherAccount]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DispatcherAccount>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DispatcherAccountUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<DispatcherAccountTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DispatcherAccountTable>? orderBy,
    _i1.OrderByListBuilder<DispatcherAccountTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DispatcherAccount>(
      columnValues: columnValues(DispatcherAccount.t.updateTable),
      where: where(DispatcherAccount.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DispatcherAccount.t),
      orderByList: orderByList?.call(DispatcherAccount.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DispatcherAccount]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DispatcherAccount>> delete(
    _i1.DatabaseSession session,
    List<DispatcherAccount> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DispatcherAccount>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DispatcherAccount].
  Future<DispatcherAccount> deleteRow(
    _i1.DatabaseSession session,
    DispatcherAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DispatcherAccount>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DispatcherAccount>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DispatcherAccountTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DispatcherAccount>(
      where: where(DispatcherAccount.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DispatcherAccountTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DispatcherAccount>(
      where: where?.call(DispatcherAccount.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DispatcherAccount] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DispatcherAccountTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DispatcherAccount>(
      where: where(DispatcherAccount.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
