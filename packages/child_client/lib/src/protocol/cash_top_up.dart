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

import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Приём наличных водителем — заявка, а не деньги.
///
/// Деньги попадают в книгу операций только после подтверждения
/// диспетчером: до этого сумма видна родителю как «ожидает подтверждения».
/// Сама заявка — рабочий документ, её статус меняется; книга операций
/// при этом остаётся неизменяемой.
abstract class CashTopUp implements _i1.SerializableModel {
  CashTopUp._({
    this.id,
    required this.familyId,
    required this.driverId,
    required this.amountTenge,
    bool? hasSignature,
    this.note,
    DateTime? createdAt,
    this.confirmedAt,
    this.confirmedBy,
    this.rejectedAt,
    this.rejectReason,
  }) : hasSignature = hasSignature ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory CashTopUp({
    int? id,
    required int familyId,
    required int driverId,
    required int amountTenge,
    bool? hasSignature,
    String? note,
    DateTime? createdAt,
    DateTime? confirmedAt,
    int? confirmedBy,
    DateTime? rejectedAt,
    String? rejectReason,
  }) = _CashTopUpImpl;

  factory CashTopUp.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashTopUp(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      driverId: jsonSerialization['driverId'] as int,
      amountTenge: jsonSerialization['amountTenge'] as int,
      hasSignature: jsonSerialization['hasSignature'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['hasSignature']),
      note: jsonSerialization['note'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      confirmedAt: jsonSerialization['confirmedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedAt'],
            ),
      confirmedBy: jsonSerialization['confirmedBy'] as int?,
      rejectedAt: jsonSerialization['rejectedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['rejectedAt']),
      rejectReason: jsonSerialization['rejectReason'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int familyId;

  int driverId;

  /// Сумма в тенге (целое число).
  int amountTenge;

  /// Родитель расписался на экране водителя.
  bool hasSignature;

  String? note;

  DateTime createdAt;

  DateTime? confirmedAt;

  /// Кто из диспетчеров подтвердил.
  int? confirmedBy;

  DateTime? rejectedAt;

  String? rejectReason;

  /// Returns a shallow copy of this [CashTopUp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashTopUp copyWith({
    int? id,
    int? familyId,
    int? driverId,
    int? amountTenge,
    bool? hasSignature,
    String? note,
    DateTime? createdAt,
    DateTime? confirmedAt,
    int? confirmedBy,
    DateTime? rejectedAt,
    String? rejectReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashTopUp',
      if (id != null) 'id': id,
      'familyId': familyId,
      'driverId': driverId,
      'amountTenge': amountTenge,
      'hasSignature': hasSignature,
      if (note != null) 'note': note,
      'createdAt': createdAt.toJson(),
      if (confirmedAt != null) 'confirmedAt': confirmedAt?.toJson(),
      if (confirmedBy != null) 'confirmedBy': confirmedBy,
      if (rejectedAt != null) 'rejectedAt': rejectedAt?.toJson(),
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CashTopUpImpl extends CashTopUp {
  _CashTopUpImpl({
    int? id,
    required int familyId,
    required int driverId,
    required int amountTenge,
    bool? hasSignature,
    String? note,
    DateTime? createdAt,
    DateTime? confirmedAt,
    int? confirmedBy,
    DateTime? rejectedAt,
    String? rejectReason,
  }) : super._(
         id: id,
         familyId: familyId,
         driverId: driverId,
         amountTenge: amountTenge,
         hasSignature: hasSignature,
         note: note,
         createdAt: createdAt,
         confirmedAt: confirmedAt,
         confirmedBy: confirmedBy,
         rejectedAt: rejectedAt,
         rejectReason: rejectReason,
       );

  /// Returns a shallow copy of this [CashTopUp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashTopUp copyWith({
    Object? id = _Undefined,
    int? familyId,
    int? driverId,
    int? amountTenge,
    bool? hasSignature,
    Object? note = _Undefined,
    DateTime? createdAt,
    Object? confirmedAt = _Undefined,
    Object? confirmedBy = _Undefined,
    Object? rejectedAt = _Undefined,
    Object? rejectReason = _Undefined,
  }) {
    return CashTopUp(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      driverId: driverId ?? this.driverId,
      amountTenge: amountTenge ?? this.amountTenge,
      hasSignature: hasSignature ?? this.hasSignature,
      note: note is String? ? note : this.note,
      createdAt: createdAt ?? this.createdAt,
      confirmedAt: confirmedAt is DateTime? ? confirmedAt : this.confirmedAt,
      confirmedBy: confirmedBy is int? ? confirmedBy : this.confirmedBy,
      rejectedAt: rejectedAt is DateTime? ? rejectedAt : this.rejectedAt,
      rejectReason: rejectReason is String? ? rejectReason : this.rejectReason,
    );
  }
}
