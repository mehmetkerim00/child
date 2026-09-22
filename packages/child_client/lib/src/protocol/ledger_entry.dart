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
import 'ledger_entry_type.dart' as _i2;

/// Запись в книге операций семьи. Баланс = сумма всех записей.
///
/// Книга только дописывается: записи никогда не меняются и не удаляются.
/// Ошибку исправляют новой корректирующей записью с причиной — так
/// видно и саму ошибку, и то, кто её исправил.
abstract class LedgerEntry implements _i1.SerializableModel {
  LedgerEntry._({
    this.id,
    required this.familyId,
    required this.type,
    required this.amountTenge,
    this.rideId,
    this.driverId,
    this.note,
    required this.dedupeKey,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory LedgerEntry({
    int? id,
    required int familyId,
    required _i2.LedgerEntryType type,
    required int amountTenge,
    int? rideId,
    int? driverId,
    String? note,
    required String dedupeKey,
    DateTime? createdAt,
  }) = _LedgerEntryImpl;

  factory LedgerEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return LedgerEntry(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      type: _i2.LedgerEntryType.fromJson((jsonSerialization['type'] as String)),
      amountTenge: jsonSerialization['amountTenge'] as int,
      rideId: jsonSerialization['rideId'] as int?,
      driverId: jsonSerialization['driverId'] as int?,
      note: jsonSerialization['note'] as String?,
      dedupeKey: jsonSerialization['dedupeKey'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int familyId;

  _i2.LedgerEntryType type;

  /// Сумма в тенге (минорных единицах маната, 1 манат = 100 тенге).
  /// Только целые числа: дробная арифметика в деньгах недопустима.
  /// Пополнение со знаком плюс, списание — минус.
  int amountTenge;

  int? rideId;

  int? driverId;

  /// Для корректировок причина обязательна.
  String? note;

  /// Ключ идемпотентности: одна поездка списывается ровно один раз,
  /// одно пополнение зачисляется ровно один раз.
  String dedupeKey;

  DateTime createdAt;

  /// Returns a shallow copy of this [LedgerEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LedgerEntry copyWith({
    int? id,
    int? familyId,
    _i2.LedgerEntryType? type,
    int? amountTenge,
    int? rideId,
    int? driverId,
    String? note,
    String? dedupeKey,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LedgerEntry',
      if (id != null) 'id': id,
      'familyId': familyId,
      'type': type.toJson(),
      'amountTenge': amountTenge,
      if (rideId != null) 'rideId': rideId,
      if (driverId != null) 'driverId': driverId,
      if (note != null) 'note': note,
      'dedupeKey': dedupeKey,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LedgerEntryImpl extends LedgerEntry {
  _LedgerEntryImpl({
    int? id,
    required int familyId,
    required _i2.LedgerEntryType type,
    required int amountTenge,
    int? rideId,
    int? driverId,
    String? note,
    required String dedupeKey,
    DateTime? createdAt,
  }) : super._(
         id: id,
         familyId: familyId,
         type: type,
         amountTenge: amountTenge,
         rideId: rideId,
         driverId: driverId,
         note: note,
         dedupeKey: dedupeKey,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [LedgerEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LedgerEntry copyWith({
    Object? id = _Undefined,
    int? familyId,
    _i2.LedgerEntryType? type,
    int? amountTenge,
    Object? rideId = _Undefined,
    Object? driverId = _Undefined,
    Object? note = _Undefined,
    String? dedupeKey,
    DateTime? createdAt,
  }) {
    return LedgerEntry(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      type: type ?? this.type,
      amountTenge: amountTenge ?? this.amountTenge,
      rideId: rideId is int? ? rideId : this.rideId,
      driverId: driverId is int? ? driverId : this.driverId,
      note: note is String? ? note : this.note,
      dedupeKey: dedupeKey ?? this.dedupeKey,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
