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

/// Ребёнок. Персональных данных — минимум (MVP_PLAN §5).
abstract class Child implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Child._({
    this.id,
    required this.familyId,
    required this.name,
    this.birthYear,
    required this.codeWord,
    bool? needsChildSeat,
    this.photoUrl,
    DateTime? createdAt,
  }) : needsChildSeat = needsChildSeat ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory Child({
    int? id,
    required int familyId,
    required String name,
    int? birthYear,
    required String codeWord,
    bool? needsChildSeat,
    String? photoUrl,
    DateTime? createdAt,
  }) = _ChildImpl;

  factory Child.fromJson(Map<String, dynamic> jsonSerialization) {
    return Child(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      name: jsonSerialization['name'] as String,
      birthYear: jsonSerialization['birthYear'] as int?,
      codeWord: jsonSerialization['codeWord'] as String,
      needsChildSeat: jsonSerialization['needsChildSeat'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['needsChildSeat']),
      photoUrl: jsonSerialization['photoUrl'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ChildTable();

  static const db = ChildRepository._();

  @override
  int? id;

  int familyId;

  String name;

  int? birthYear;

  /// Кодовое слово семьи: водитель называет его при посадке.
  String codeWord;

  bool needsChildSeat;

  String? photoUrl;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Child]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Child copyWith({
    int? id,
    int? familyId,
    String? name,
    int? birthYear,
    String? codeWord,
    bool? needsChildSeat,
    String? photoUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Child',
      if (id != null) 'id': id,
      'familyId': familyId,
      'name': name,
      if (birthYear != null) 'birthYear': birthYear,
      'codeWord': codeWord,
      'needsChildSeat': needsChildSeat,
      if (photoUrl != null) 'photoUrl': photoUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Child',
      if (id != null) 'id': id,
      'familyId': familyId,
      'name': name,
      if (birthYear != null) 'birthYear': birthYear,
      'codeWord': codeWord,
      'needsChildSeat': needsChildSeat,
      if (photoUrl != null) 'photoUrl': photoUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  static ChildInclude include() {
    return ChildInclude._();
  }

  static ChildIncludeList includeList({
    _i1.WhereExpressionBuilder<ChildTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildTable>? orderByList,
    ChildInclude? include,
  }) {
    return ChildIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Child.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Child.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChildImpl extends Child {
  _ChildImpl({
    int? id,
    required int familyId,
    required String name,
    int? birthYear,
    required String codeWord,
    bool? needsChildSeat,
    String? photoUrl,
    DateTime? createdAt,
  }) : super._(
         id: id,
         familyId: familyId,
         name: name,
         birthYear: birthYear,
         codeWord: codeWord,
         needsChildSeat: needsChildSeat,
         photoUrl: photoUrl,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Child]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Child copyWith({
    Object? id = _Undefined,
    int? familyId,
    String? name,
    Object? birthYear = _Undefined,
    String? codeWord,
    bool? needsChildSeat,
    Object? photoUrl = _Undefined,
    DateTime? createdAt,
  }) {
    return Child(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      name: name ?? this.name,
      birthYear: birthYear is int? ? birthYear : this.birthYear,
      codeWord: codeWord ?? this.codeWord,
      needsChildSeat: needsChildSeat ?? this.needsChildSeat,
      photoUrl: photoUrl is String? ? photoUrl : this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ChildUpdateTable extends _i1.UpdateTable<ChildTable> {
  ChildUpdateTable(super.table);

  _i1.ColumnValue<int, int> familyId(int value) => _i1.ColumnValue(
    table.familyId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<int, int> birthYear(int? value) => _i1.ColumnValue(
    table.birthYear,
    value,
  );

  _i1.ColumnValue<String, String> codeWord(String value) => _i1.ColumnValue(
    table.codeWord,
    value,
  );

  _i1.ColumnValue<bool, bool> needsChildSeat(bool value) => _i1.ColumnValue(
    table.needsChildSeat,
    value,
  );

  _i1.ColumnValue<String, String> photoUrl(String? value) => _i1.ColumnValue(
    table.photoUrl,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ChildTable extends _i1.Table<int?> {
  ChildTable({super.tableRelation}) : super(tableName: 'child') {
    updateTable = ChildUpdateTable(this);
    familyId = _i1.ColumnInt(
      'familyId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    birthYear = _i1.ColumnInt(
      'birthYear',
      this,
    );
    codeWord = _i1.ColumnString(
      'codeWord',
      this,
    );
    needsChildSeat = _i1.ColumnBool(
      'needsChildSeat',
      this,
      hasDefault: true,
    );
    photoUrl = _i1.ColumnString(
      'photoUrl',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ChildUpdateTable updateTable;

  late final _i1.ColumnInt familyId;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt birthYear;

  /// Кодовое слово семьи: водитель называет его при посадке.
  late final _i1.ColumnString codeWord;

  late final _i1.ColumnBool needsChildSeat;

  late final _i1.ColumnString photoUrl;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    familyId,
    name,
    birthYear,
    codeWord,
    needsChildSeat,
    photoUrl,
    createdAt,
  ];
}

class ChildInclude extends _i1.IncludeObject {
  ChildInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Child.t;
}

class ChildIncludeList extends _i1.IncludeList {
  ChildIncludeList._({
    _i1.WhereExpressionBuilder<ChildTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Child.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Child.t;
}

class ChildRepository {
  const ChildRepository._();

  /// Returns a list of [Child]s matching the given query parameters.
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
  Future<List<Child>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChildTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Child>(
      where: where?.call(Child.t),
      orderBy: orderBy?.call(Child.t),
      orderByList: orderByList?.call(Child.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Child] matching the given query parameters.
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
  Future<Child?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChildTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChildTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Child>(
      where: where?.call(Child.t),
      orderBy: orderBy?.call(Child.t),
      orderByList: orderByList?.call(Child.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Child] by its [id] or null if no such row exists.
  Future<Child?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Child>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Child]s in the list and returns the inserted rows.
  ///
  /// The returned [Child]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Child>> insert(
    _i1.DatabaseSession session,
    List<Child> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Child>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Child] and returns the inserted row.
  ///
  /// The returned [Child] will have its `id` field set.
  Future<Child> insertRow(
    _i1.DatabaseSession session,
    Child row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Child>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Child]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Child>> update(
    _i1.DatabaseSession session,
    List<Child> rows, {
    _i1.ColumnSelections<ChildTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Child>(
      rows,
      columns: columns?.call(Child.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Child]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Child> updateRow(
    _i1.DatabaseSession session,
    Child row, {
    _i1.ColumnSelections<ChildTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Child>(
      row,
      columns: columns?.call(Child.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Child] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Child?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ChildUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Child>(
      id,
      columnValues: columnValues(Child.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Child]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Child>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ChildUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ChildTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildTable>? orderBy,
    _i1.OrderByListBuilder<ChildTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Child>(
      columnValues: columnValues(Child.t.updateTable),
      where: where(Child.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Child.t),
      orderByList: orderByList?.call(Child.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Child]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Child>> delete(
    _i1.DatabaseSession session,
    List<Child> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Child>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Child].
  Future<Child> deleteRow(
    _i1.DatabaseSession session,
    Child row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Child>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Child>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChildTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Child>(
      where: where(Child.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChildTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Child>(
      where: where?.call(Child.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Child] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChildTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Child>(
      where: where(Child.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
