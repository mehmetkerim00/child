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

/// Доступ учреждения к своему списку детей.
///
/// Воспитателю не нужно ставить приложение и заводить аккаунт: он
/// открывает ссылку с токеном. Ссылку выдаёт диспетчер, при утечке —
/// отзывает и выдаёт новую.
abstract class InstitutionAccess
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  InstitutionAccess._({
    this.id,
    required this.institutionId,
    required this.tokenHash,
    required this.issuedTo,
    DateTime? createdAt,
    this.lastUsedAt,
    this.revokedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory InstitutionAccess({
    int? id,
    required int institutionId,
    required String tokenHash,
    required String issuedTo,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? revokedAt,
  }) = _InstitutionAccessImpl;

  factory InstitutionAccess.fromJson(Map<String, dynamic> jsonSerialization) {
    return InstitutionAccess(
      id: jsonSerialization['id'] as int?,
      institutionId: jsonSerialization['institutionId'] as int,
      tokenHash: jsonSerialization['tokenHash'] as String,
      issuedTo: jsonSerialization['issuedTo'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      revokedAt: jsonSerialization['revokedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['revokedAt']),
    );
  }

  static final t = InstitutionAccessTable();

  static const db = InstitutionAccessRepository._();

  @override
  int? id;

  int institutionId;

  /// Хэш токена: сама ссылка хранится только у учреждения.
  String tokenHash;

  /// Кому выдана ссылка — чтобы знать, кого просить не пересылать её.
  String issuedTo;

  DateTime createdAt;

  DateTime? lastUsedAt;

  DateTime? revokedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [InstitutionAccess]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InstitutionAccess copyWith({
    int? id,
    int? institutionId,
    String? tokenHash,
    String? issuedTo,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? revokedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InstitutionAccess',
      if (id != null) 'id': id,
      'institutionId': institutionId,
      'tokenHash': tokenHash,
      'issuedTo': issuedTo,
      'createdAt': createdAt.toJson(),
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'InstitutionAccess',
      if (id != null) 'id': id,
      'institutionId': institutionId,
      'tokenHash': tokenHash,
      'issuedTo': issuedTo,
      'createdAt': createdAt.toJson(),
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  static InstitutionAccessInclude include() {
    return InstitutionAccessInclude._();
  }

  static InstitutionAccessIncludeList includeList({
    _i1.WhereExpressionBuilder<InstitutionAccessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InstitutionAccessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InstitutionAccessTable>? orderByList,
    InstitutionAccessInclude? include,
  }) {
    return InstitutionAccessIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InstitutionAccess.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(InstitutionAccess.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InstitutionAccessImpl extends InstitutionAccess {
  _InstitutionAccessImpl({
    int? id,
    required int institutionId,
    required String tokenHash,
    required String issuedTo,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? revokedAt,
  }) : super._(
         id: id,
         institutionId: institutionId,
         tokenHash: tokenHash,
         issuedTo: issuedTo,
         createdAt: createdAt,
         lastUsedAt: lastUsedAt,
         revokedAt: revokedAt,
       );

  /// Returns a shallow copy of this [InstitutionAccess]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InstitutionAccess copyWith({
    Object? id = _Undefined,
    int? institutionId,
    String? tokenHash,
    String? issuedTo,
    DateTime? createdAt,
    Object? lastUsedAt = _Undefined,
    Object? revokedAt = _Undefined,
  }) {
    return InstitutionAccess(
      id: id is int? ? id : this.id,
      institutionId: institutionId ?? this.institutionId,
      tokenHash: tokenHash ?? this.tokenHash,
      issuedTo: issuedTo ?? this.issuedTo,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      revokedAt: revokedAt is DateTime? ? revokedAt : this.revokedAt,
    );
  }
}

class InstitutionAccessUpdateTable
    extends _i1.UpdateTable<InstitutionAccessTable> {
  InstitutionAccessUpdateTable(super.table);

  _i1.ColumnValue<int, int> institutionId(int value) => _i1.ColumnValue(
    table.institutionId,
    value,
  );

  _i1.ColumnValue<String, String> tokenHash(String value) => _i1.ColumnValue(
    table.tokenHash,
    value,
  );

  _i1.ColumnValue<String, String> issuedTo(String value) => _i1.ColumnValue(
    table.issuedTo,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastUsedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastUsedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> revokedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.revokedAt,
        value,
      );
}

class InstitutionAccessTable extends _i1.Table<int?> {
  InstitutionAccessTable({super.tableRelation})
    : super(tableName: 'institution_access') {
    updateTable = InstitutionAccessUpdateTable(this);
    institutionId = _i1.ColumnInt(
      'institutionId',
      this,
    );
    tokenHash = _i1.ColumnString(
      'tokenHash',
      this,
    );
    issuedTo = _i1.ColumnString(
      'issuedTo',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    lastUsedAt = _i1.ColumnDateTime(
      'lastUsedAt',
      this,
    );
    revokedAt = _i1.ColumnDateTime(
      'revokedAt',
      this,
    );
  }

  late final InstitutionAccessUpdateTable updateTable;

  late final _i1.ColumnInt institutionId;

  /// Хэш токена: сама ссылка хранится только у учреждения.
  late final _i1.ColumnString tokenHash;

  /// Кому выдана ссылка — чтобы знать, кого просить не пересылать её.
  late final _i1.ColumnString issuedTo;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastUsedAt;

  late final _i1.ColumnDateTime revokedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    institutionId,
    tokenHash,
    issuedTo,
    createdAt,
    lastUsedAt,
    revokedAt,
  ];
}

class InstitutionAccessInclude extends _i1.IncludeObject {
  InstitutionAccessInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => InstitutionAccess.t;
}

class InstitutionAccessIncludeList extends _i1.IncludeList {
  InstitutionAccessIncludeList._({
    _i1.WhereExpressionBuilder<InstitutionAccessTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(InstitutionAccess.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => InstitutionAccess.t;
}

class InstitutionAccessRepository {
  const InstitutionAccessRepository._();

  /// Returns a list of [InstitutionAccess]s matching the given query parameters.
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
  Future<List<InstitutionAccess>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<InstitutionAccessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InstitutionAccessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InstitutionAccessTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<InstitutionAccess>(
      where: where?.call(InstitutionAccess.t),
      orderBy: orderBy?.call(InstitutionAccess.t),
      orderByList: orderByList?.call(InstitutionAccess.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [InstitutionAccess] matching the given query parameters.
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
  Future<InstitutionAccess?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<InstitutionAccessTable>? where,
    int? offset,
    _i1.OrderByBuilder<InstitutionAccessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InstitutionAccessTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<InstitutionAccess>(
      where: where?.call(InstitutionAccess.t),
      orderBy: orderBy?.call(InstitutionAccess.t),
      orderByList: orderByList?.call(InstitutionAccess.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [InstitutionAccess] by its [id] or null if no such row exists.
  Future<InstitutionAccess?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<InstitutionAccess>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [InstitutionAccess]s in the list and returns the inserted rows.
  ///
  /// The returned [InstitutionAccess]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<InstitutionAccess>> insert(
    _i1.DatabaseSession session,
    List<InstitutionAccess> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<InstitutionAccess>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [InstitutionAccess] and returns the inserted row.
  ///
  /// The returned [InstitutionAccess] will have its `id` field set.
  Future<InstitutionAccess> insertRow(
    _i1.DatabaseSession session,
    InstitutionAccess row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<InstitutionAccess>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [InstitutionAccess]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<InstitutionAccess>> update(
    _i1.DatabaseSession session,
    List<InstitutionAccess> rows, {
    _i1.ColumnSelections<InstitutionAccessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<InstitutionAccess>(
      rows,
      columns: columns?.call(InstitutionAccess.t),
      transaction: transaction,
    );
  }

  /// Updates a single [InstitutionAccess]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<InstitutionAccess> updateRow(
    _i1.DatabaseSession session,
    InstitutionAccess row, {
    _i1.ColumnSelections<InstitutionAccessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<InstitutionAccess>(
      row,
      columns: columns?.call(InstitutionAccess.t),
      transaction: transaction,
    );
  }

  /// Updates a single [InstitutionAccess] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<InstitutionAccess?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<InstitutionAccessUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<InstitutionAccess>(
      id,
      columnValues: columnValues(InstitutionAccess.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [InstitutionAccess]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<InstitutionAccess>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<InstitutionAccessUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<InstitutionAccessTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InstitutionAccessTable>? orderBy,
    _i1.OrderByListBuilder<InstitutionAccessTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<InstitutionAccess>(
      columnValues: columnValues(InstitutionAccess.t.updateTable),
      where: where(InstitutionAccess.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InstitutionAccess.t),
      orderByList: orderByList?.call(InstitutionAccess.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [InstitutionAccess]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<InstitutionAccess>> delete(
    _i1.DatabaseSession session,
    List<InstitutionAccess> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<InstitutionAccess>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [InstitutionAccess].
  Future<InstitutionAccess> deleteRow(
    _i1.DatabaseSession session,
    InstitutionAccess row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<InstitutionAccess>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<InstitutionAccess>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<InstitutionAccessTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<InstitutionAccess>(
      where: where(InstitutionAccess.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<InstitutionAccessTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<InstitutionAccess>(
      where: where?.call(InstitutionAccess.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [InstitutionAccess] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<InstitutionAccessTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<InstitutionAccess>(
      where: where(InstitutionAccess.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
