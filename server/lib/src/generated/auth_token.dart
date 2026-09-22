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
import 'account_role.dart' as _i2;

/// Токен сессии: выдаётся после подтверждения кода.
abstract class AuthToken
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AuthToken._({
    this.id,
    required this.tokenHash,
    required this.role,
    required this.subjectId,
    required this.phone,
    DateTime? createdAt,
    required this.expiresAt,
    this.revokedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory AuthToken({
    int? id,
    required String tokenHash,
    required _i2.AccountRole role,
    required int subjectId,
    required String phone,
    DateTime? createdAt,
    required DateTime expiresAt,
    DateTime? revokedAt,
  }) = _AuthTokenImpl;

  factory AuthToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthToken(
      id: jsonSerialization['id'] as int?,
      tokenHash: jsonSerialization['tokenHash'] as String,
      role: _i2.AccountRole.fromJson((jsonSerialization['role'] as String)),
      subjectId: jsonSerialization['subjectId'] as int,
      phone: jsonSerialization['phone'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      revokedAt: jsonSerialization['revokedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['revokedAt']),
    );
  }

  static final t = AuthTokenTable();

  static const db = AuthTokenRepository._();

  @override
  int? id;

  /// Хэш токена; сам токен хранится только на устройстве.
  String tokenHash;

  _i2.AccountRole role;

  /// id записи Parent, Driver или DispatcherAccount — в зависимости от роли.
  int subjectId;

  String phone;

  DateTime createdAt;

  DateTime expiresAt;

  DateTime? revokedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AuthToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthToken copyWith({
    int? id,
    String? tokenHash,
    _i2.AccountRole? role,
    int? subjectId,
    String? phone,
    DateTime? createdAt,
    DateTime? expiresAt,
    DateTime? revokedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthToken',
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'role': role.toJson(),
      'subjectId': subjectId,
      'phone': phone,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AuthToken',
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'role': role.toJson(),
      'subjectId': subjectId,
      'phone': phone,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  static AuthTokenInclude include() {
    return AuthTokenInclude._();
  }

  static AuthTokenIncludeList includeList({
    _i1.WhereExpressionBuilder<AuthTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthTokenTable>? orderByList,
    AuthTokenInclude? include,
  }) {
    return AuthTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AuthToken.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AuthToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthTokenImpl extends AuthToken {
  _AuthTokenImpl({
    int? id,
    required String tokenHash,
    required _i2.AccountRole role,
    required int subjectId,
    required String phone,
    DateTime? createdAt,
    required DateTime expiresAt,
    DateTime? revokedAt,
  }) : super._(
         id: id,
         tokenHash: tokenHash,
         role: role,
         subjectId: subjectId,
         phone: phone,
         createdAt: createdAt,
         expiresAt: expiresAt,
         revokedAt: revokedAt,
       );

  /// Returns a shallow copy of this [AuthToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthToken copyWith({
    Object? id = _Undefined,
    String? tokenHash,
    _i2.AccountRole? role,
    int? subjectId,
    String? phone,
    DateTime? createdAt,
    DateTime? expiresAt,
    Object? revokedAt = _Undefined,
  }) {
    return AuthToken(
      id: id is int? ? id : this.id,
      tokenHash: tokenHash ?? this.tokenHash,
      role: role ?? this.role,
      subjectId: subjectId ?? this.subjectId,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      revokedAt: revokedAt is DateTime? ? revokedAt : this.revokedAt,
    );
  }
}

class AuthTokenUpdateTable extends _i1.UpdateTable<AuthTokenTable> {
  AuthTokenUpdateTable(super.table);

  _i1.ColumnValue<String, String> tokenHash(String value) => _i1.ColumnValue(
    table.tokenHash,
    value,
  );

  _i1.ColumnValue<_i2.AccountRole, _i2.AccountRole> role(
    _i2.AccountRole value,
  ) => _i1.ColumnValue(
    table.role,
    value,
  );

  _i1.ColumnValue<int, int> subjectId(int value) => _i1.ColumnValue(
    table.subjectId,
    value,
  );

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> revokedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.revokedAt,
        value,
      );
}

class AuthTokenTable extends _i1.Table<int?> {
  AuthTokenTable({super.tableRelation}) : super(tableName: 'auth_token') {
    updateTable = AuthTokenUpdateTable(this);
    tokenHash = _i1.ColumnString(
      'tokenHash',
      this,
    );
    role = _i1.ColumnEnum(
      'role',
      this,
      _i1.EnumSerialization.byName,
    );
    subjectId = _i1.ColumnInt(
      'subjectId',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    revokedAt = _i1.ColumnDateTime(
      'revokedAt',
      this,
    );
  }

  late final AuthTokenUpdateTable updateTable;

  /// Хэш токена; сам токен хранится только на устройстве.
  late final _i1.ColumnString tokenHash;

  late final _i1.ColumnEnum<_i2.AccountRole> role;

  /// id записи Parent, Driver или DispatcherAccount — в зависимости от роли.
  late final _i1.ColumnInt subjectId;

  late final _i1.ColumnString phone;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime revokedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    tokenHash,
    role,
    subjectId,
    phone,
    createdAt,
    expiresAt,
    revokedAt,
  ];
}

class AuthTokenInclude extends _i1.IncludeObject {
  AuthTokenInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AuthToken.t;
}

class AuthTokenIncludeList extends _i1.IncludeList {
  AuthTokenIncludeList._({
    _i1.WhereExpressionBuilder<AuthTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AuthToken.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AuthToken.t;
}

class AuthTokenRepository {
  const AuthTokenRepository._();

  /// Returns a list of [AuthToken]s matching the given query parameters.
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
  Future<List<AuthToken>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AuthTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthTokenTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AuthToken>(
      where: where?.call(AuthToken.t),
      orderBy: orderBy?.call(AuthToken.t),
      orderByList: orderByList?.call(AuthToken.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AuthToken] matching the given query parameters.
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
  Future<AuthToken?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AuthTokenTable>? where,
    int? offset,
    _i1.OrderByBuilder<AuthTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthTokenTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AuthToken>(
      where: where?.call(AuthToken.t),
      orderBy: orderBy?.call(AuthToken.t),
      orderByList: orderByList?.call(AuthToken.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AuthToken] by its [id] or null if no such row exists.
  Future<AuthToken?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AuthToken>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AuthToken]s in the list and returns the inserted rows.
  ///
  /// The returned [AuthToken]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<AuthToken>> insert(
    _i1.DatabaseSession session,
    List<AuthToken> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<AuthToken>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [AuthToken] and returns the inserted row.
  ///
  /// The returned [AuthToken] will have its `id` field set.
  Future<AuthToken> insertRow(
    _i1.DatabaseSession session,
    AuthToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AuthToken>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AuthToken]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AuthToken>> update(
    _i1.DatabaseSession session,
    List<AuthToken> rows, {
    _i1.ColumnSelections<AuthTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AuthToken>(
      rows,
      columns: columns?.call(AuthToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AuthToken]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AuthToken> updateRow(
    _i1.DatabaseSession session,
    AuthToken row, {
    _i1.ColumnSelections<AuthTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AuthToken>(
      row,
      columns: columns?.call(AuthToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AuthToken] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AuthToken?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<AuthTokenUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AuthToken>(
      id,
      columnValues: columnValues(AuthToken.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AuthToken]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AuthToken>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<AuthTokenUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AuthTokenTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthTokenTable>? orderBy,
    _i1.OrderByListBuilder<AuthTokenTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AuthToken>(
      columnValues: columnValues(AuthToken.t.updateTable),
      where: where(AuthToken.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AuthToken.t),
      orderByList: orderByList?.call(AuthToken.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AuthToken]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AuthToken>> delete(
    _i1.DatabaseSession session,
    List<AuthToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AuthToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AuthToken].
  Future<AuthToken> deleteRow(
    _i1.DatabaseSession session,
    AuthToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AuthToken>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AuthToken>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AuthTokenTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AuthToken>(
      where: where(AuthToken.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AuthTokenTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AuthToken>(
      where: where?.call(AuthToken.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AuthToken] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AuthTokenTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AuthToken>(
      where: where(AuthToken.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
