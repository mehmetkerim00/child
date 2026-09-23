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

/// Место ребёнка в поездке.
///
/// В машине может ехать несколько детей из разных семей (пулинг).
/// Каждого забирают и передают отдельно: своё кодовое слово, свой адрес,
/// своё списание. Поэтому статус этапов — на месте, а не на поездке.
abstract class RideSeat
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RideSeat._({
    this.id,
    required this.rideId,
    required this.childId,
    this.templateId,
    int? pickupOrder,
    this.pickedUpAt,
    this.handedOverAt,
    this.cancelledAt,
    this.absenceReason,
    this.confirmedByInstitutionAt,
    this.confirmedByInstitutionName,
    int? seatPriceTenge,
  }) : pickupOrder = pickupOrder ?? 1,
       seatPriceTenge = seatPriceTenge ?? 0;

  factory RideSeat({
    int? id,
    required int rideId,
    required int childId,
    int? templateId,
    int? pickupOrder,
    DateTime? pickedUpAt,
    DateTime? handedOverAt,
    DateTime? cancelledAt,
    String? absenceReason,
    DateTime? confirmedByInstitutionAt,
    String? confirmedByInstitutionName,
    int? seatPriceTenge,
  }) = _RideSeatImpl;

  factory RideSeat.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideSeat(
      id: jsonSerialization['id'] as int?,
      rideId: jsonSerialization['rideId'] as int,
      childId: jsonSerialization['childId'] as int,
      templateId: jsonSerialization['templateId'] as int?,
      pickupOrder: jsonSerialization['pickupOrder'] as int?,
      pickedUpAt: jsonSerialization['pickedUpAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['pickedUpAt']),
      handedOverAt: jsonSerialization['handedOverAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['handedOverAt'],
            ),
      cancelledAt: jsonSerialization['cancelledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancelledAt'],
            ),
      absenceReason: jsonSerialization['absenceReason'] as String?,
      confirmedByInstitutionAt:
          jsonSerialization['confirmedByInstitutionAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedByInstitutionAt'],
            ),
      confirmedByInstitutionName:
          jsonSerialization['confirmedByInstitutionName'] as String?,
      seatPriceTenge: jsonSerialization['seatPriceTenge'] as int?,
    );
  }

  static final t = RideSeatTable();

  static const db = RideSeatRepository._();

  @override
  int? id;

  int rideId;

  int childId;

  /// Шаблон маршрута этого ребёнка: из него берутся адрес и цена места.
  int? templateId;

  /// Порядок посадки: 1 — забираем первым.
  int pickupOrder;

  /// Этот ребёнок уже в машине.
  DateTime? pickedUpAt;

  /// Этот ребёнок передан принимающему.
  DateTime? handedOverAt;

  /// Семья отменила поездку этого ребёнка на сегодня.
  DateTime? cancelledAt;

  /// Причина отсутствия, если семья предупредила заранее.
  String? absenceReason;

  /// Учреждение подтвердило приём ребёнка — независимое от водителя
  /// подтверждение передачи.
  DateTime? confirmedByInstitutionAt;

  /// Кто подтвердил со стороны учреждения (имя воспитателя).
  String? confirmedByInstitutionName;

  /// Цена места в тенге: в пуле каждая семья платит за своё место.
  int seatPriceTenge;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RideSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideSeat copyWith({
    int? id,
    int? rideId,
    int? childId,
    int? templateId,
    int? pickupOrder,
    DateTime? pickedUpAt,
    DateTime? handedOverAt,
    DateTime? cancelledAt,
    String? absenceReason,
    DateTime? confirmedByInstitutionAt,
    String? confirmedByInstitutionName,
    int? seatPriceTenge,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideSeat',
      if (id != null) 'id': id,
      'rideId': rideId,
      'childId': childId,
      if (templateId != null) 'templateId': templateId,
      'pickupOrder': pickupOrder,
      if (pickedUpAt != null) 'pickedUpAt': pickedUpAt?.toJson(),
      if (handedOverAt != null) 'handedOverAt': handedOverAt?.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
      if (absenceReason != null) 'absenceReason': absenceReason,
      if (confirmedByInstitutionAt != null)
        'confirmedByInstitutionAt': confirmedByInstitutionAt?.toJson(),
      if (confirmedByInstitutionName != null)
        'confirmedByInstitutionName': confirmedByInstitutionName,
      'seatPriceTenge': seatPriceTenge,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RideSeat',
      if (id != null) 'id': id,
      'rideId': rideId,
      'childId': childId,
      if (templateId != null) 'templateId': templateId,
      'pickupOrder': pickupOrder,
      if (pickedUpAt != null) 'pickedUpAt': pickedUpAt?.toJson(),
      if (handedOverAt != null) 'handedOverAt': handedOverAt?.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
      if (absenceReason != null) 'absenceReason': absenceReason,
      if (confirmedByInstitutionAt != null)
        'confirmedByInstitutionAt': confirmedByInstitutionAt?.toJson(),
      if (confirmedByInstitutionName != null)
        'confirmedByInstitutionName': confirmedByInstitutionName,
      'seatPriceTenge': seatPriceTenge,
    };
  }

  static RideSeatInclude include() {
    return RideSeatInclude._();
  }

  static RideSeatIncludeList includeList({
    _i1.WhereExpressionBuilder<RideSeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideSeatTable>? orderByList,
    RideSeatInclude? include,
  }) {
    return RideSeatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RideSeat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RideSeat.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideSeatImpl extends RideSeat {
  _RideSeatImpl({
    int? id,
    required int rideId,
    required int childId,
    int? templateId,
    int? pickupOrder,
    DateTime? pickedUpAt,
    DateTime? handedOverAt,
    DateTime? cancelledAt,
    String? absenceReason,
    DateTime? confirmedByInstitutionAt,
    String? confirmedByInstitutionName,
    int? seatPriceTenge,
  }) : super._(
         id: id,
         rideId: rideId,
         childId: childId,
         templateId: templateId,
         pickupOrder: pickupOrder,
         pickedUpAt: pickedUpAt,
         handedOverAt: handedOverAt,
         cancelledAt: cancelledAt,
         absenceReason: absenceReason,
         confirmedByInstitutionAt: confirmedByInstitutionAt,
         confirmedByInstitutionName: confirmedByInstitutionName,
         seatPriceTenge: seatPriceTenge,
       );

  /// Returns a shallow copy of this [RideSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideSeat copyWith({
    Object? id = _Undefined,
    int? rideId,
    int? childId,
    Object? templateId = _Undefined,
    int? pickupOrder,
    Object? pickedUpAt = _Undefined,
    Object? handedOverAt = _Undefined,
    Object? cancelledAt = _Undefined,
    Object? absenceReason = _Undefined,
    Object? confirmedByInstitutionAt = _Undefined,
    Object? confirmedByInstitutionName = _Undefined,
    int? seatPriceTenge,
  }) {
    return RideSeat(
      id: id is int? ? id : this.id,
      rideId: rideId ?? this.rideId,
      childId: childId ?? this.childId,
      templateId: templateId is int? ? templateId : this.templateId,
      pickupOrder: pickupOrder ?? this.pickupOrder,
      pickedUpAt: pickedUpAt is DateTime? ? pickedUpAt : this.pickedUpAt,
      handedOverAt: handedOverAt is DateTime?
          ? handedOverAt
          : this.handedOverAt,
      cancelledAt: cancelledAt is DateTime? ? cancelledAt : this.cancelledAt,
      absenceReason: absenceReason is String?
          ? absenceReason
          : this.absenceReason,
      confirmedByInstitutionAt: confirmedByInstitutionAt is DateTime?
          ? confirmedByInstitutionAt
          : this.confirmedByInstitutionAt,
      confirmedByInstitutionName: confirmedByInstitutionName is String?
          ? confirmedByInstitutionName
          : this.confirmedByInstitutionName,
      seatPriceTenge: seatPriceTenge ?? this.seatPriceTenge,
    );
  }
}

class RideSeatUpdateTable extends _i1.UpdateTable<RideSeatTable> {
  RideSeatUpdateTable(super.table);

  _i1.ColumnValue<int, int> rideId(int value) => _i1.ColumnValue(
    table.rideId,
    value,
  );

  _i1.ColumnValue<int, int> childId(int value) => _i1.ColumnValue(
    table.childId,
    value,
  );

  _i1.ColumnValue<int, int> templateId(int? value) => _i1.ColumnValue(
    table.templateId,
    value,
  );

  _i1.ColumnValue<int, int> pickupOrder(int value) => _i1.ColumnValue(
    table.pickupOrder,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> pickedUpAt(DateTime? value) =>
      _i1.ColumnValue(
        table.pickedUpAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> handedOverAt(DateTime? value) =>
      _i1.ColumnValue(
        table.handedOverAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> cancelledAt(DateTime? value) =>
      _i1.ColumnValue(
        table.cancelledAt,
        value,
      );

  _i1.ColumnValue<String, String> absenceReason(String? value) =>
      _i1.ColumnValue(
        table.absenceReason,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> confirmedByInstitutionAt(
    DateTime? value,
  ) => _i1.ColumnValue(
    table.confirmedByInstitutionAt,
    value,
  );

  _i1.ColumnValue<String, String> confirmedByInstitutionName(String? value) =>
      _i1.ColumnValue(
        table.confirmedByInstitutionName,
        value,
      );

  _i1.ColumnValue<int, int> seatPriceTenge(int value) => _i1.ColumnValue(
    table.seatPriceTenge,
    value,
  );
}

class RideSeatTable extends _i1.Table<int?> {
  RideSeatTable({super.tableRelation}) : super(tableName: 'ride_seat') {
    updateTable = RideSeatUpdateTable(this);
    rideId = _i1.ColumnInt(
      'rideId',
      this,
    );
    childId = _i1.ColumnInt(
      'childId',
      this,
    );
    templateId = _i1.ColumnInt(
      'templateId',
      this,
    );
    pickupOrder = _i1.ColumnInt(
      'pickupOrder',
      this,
      hasDefault: true,
    );
    pickedUpAt = _i1.ColumnDateTime(
      'pickedUpAt',
      this,
    );
    handedOverAt = _i1.ColumnDateTime(
      'handedOverAt',
      this,
    );
    cancelledAt = _i1.ColumnDateTime(
      'cancelledAt',
      this,
    );
    absenceReason = _i1.ColumnString(
      'absenceReason',
      this,
    );
    confirmedByInstitutionAt = _i1.ColumnDateTime(
      'confirmedByInstitutionAt',
      this,
    );
    confirmedByInstitutionName = _i1.ColumnString(
      'confirmedByInstitutionName',
      this,
    );
    seatPriceTenge = _i1.ColumnInt(
      'seatPriceTenge',
      this,
      hasDefault: true,
    );
  }

  late final RideSeatUpdateTable updateTable;

  late final _i1.ColumnInt rideId;

  late final _i1.ColumnInt childId;

  /// Шаблон маршрута этого ребёнка: из него берутся адрес и цена места.
  late final _i1.ColumnInt templateId;

  /// Порядок посадки: 1 — забираем первым.
  late final _i1.ColumnInt pickupOrder;

  /// Этот ребёнок уже в машине.
  late final _i1.ColumnDateTime pickedUpAt;

  /// Этот ребёнок передан принимающему.
  late final _i1.ColumnDateTime handedOverAt;

  /// Семья отменила поездку этого ребёнка на сегодня.
  late final _i1.ColumnDateTime cancelledAt;

  /// Причина отсутствия, если семья предупредила заранее.
  late final _i1.ColumnString absenceReason;

  /// Учреждение подтвердило приём ребёнка — независимое от водителя
  /// подтверждение передачи.
  late final _i1.ColumnDateTime confirmedByInstitutionAt;

  /// Кто подтвердил со стороны учреждения (имя воспитателя).
  late final _i1.ColumnString confirmedByInstitutionName;

  /// Цена места в тенге: в пуле каждая семья платит за своё место.
  late final _i1.ColumnInt seatPriceTenge;

  @override
  List<_i1.Column> get columns => [
    id,
    rideId,
    childId,
    templateId,
    pickupOrder,
    pickedUpAt,
    handedOverAt,
    cancelledAt,
    absenceReason,
    confirmedByInstitutionAt,
    confirmedByInstitutionName,
    seatPriceTenge,
  ];
}

class RideSeatInclude extends _i1.IncludeObject {
  RideSeatInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RideSeat.t;
}

class RideSeatIncludeList extends _i1.IncludeList {
  RideSeatIncludeList._({
    _i1.WhereExpressionBuilder<RideSeatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RideSeat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RideSeat.t;
}

class RideSeatRepository {
  const RideSeatRepository._();

  /// Returns a list of [RideSeat]s matching the given query parameters.
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
  Future<List<RideSeat>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideSeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideSeatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RideSeat>(
      where: where?.call(RideSeat.t),
      orderBy: orderBy?.call(RideSeat.t),
      orderByList: orderByList?.call(RideSeat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RideSeat] matching the given query parameters.
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
  Future<RideSeat?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideSeatTable>? where,
    int? offset,
    _i1.OrderByBuilder<RideSeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RideSeatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RideSeat>(
      where: where?.call(RideSeat.t),
      orderBy: orderBy?.call(RideSeat.t),
      orderByList: orderByList?.call(RideSeat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RideSeat] by its [id] or null if no such row exists.
  Future<RideSeat?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RideSeat>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RideSeat]s in the list and returns the inserted rows.
  ///
  /// The returned [RideSeat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<RideSeat>> insert(
    _i1.DatabaseSession session,
    List<RideSeat> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<RideSeat>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [RideSeat] and returns the inserted row.
  ///
  /// The returned [RideSeat] will have its `id` field set.
  Future<RideSeat> insertRow(
    _i1.DatabaseSession session,
    RideSeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RideSeat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RideSeat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RideSeat>> update(
    _i1.DatabaseSession session,
    List<RideSeat> rows, {
    _i1.ColumnSelections<RideSeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RideSeat>(
      rows,
      columns: columns?.call(RideSeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RideSeat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RideSeat> updateRow(
    _i1.DatabaseSession session,
    RideSeat row, {
    _i1.ColumnSelections<RideSeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RideSeat>(
      row,
      columns: columns?.call(RideSeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RideSeat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RideSeat?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<RideSeatUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RideSeat>(
      id,
      columnValues: columnValues(RideSeat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RideSeat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RideSeat>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<RideSeatUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RideSeatTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RideSeatTable>? orderBy,
    _i1.OrderByListBuilder<RideSeatTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RideSeat>(
      columnValues: columnValues(RideSeat.t.updateTable),
      where: where(RideSeat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RideSeat.t),
      orderByList: orderByList?.call(RideSeat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RideSeat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RideSeat>> delete(
    _i1.DatabaseSession session,
    List<RideSeat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RideSeat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RideSeat].
  Future<RideSeat> deleteRow(
    _i1.DatabaseSession session,
    RideSeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RideSeat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RideSeat>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideSeatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RideSeat>(
      where: where(RideSeat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<RideSeatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RideSeat>(
      where: where?.call(RideSeat.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RideSeat] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<RideSeatTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RideSeat>(
      where: where(RideSeat.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
