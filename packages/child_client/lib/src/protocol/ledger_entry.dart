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

/// Операция по балансу семьи. Баланс = сумма операций.
abstract class LedgerEntry implements _i1.SerializableModel {
  LedgerEntry._({
    this.id,
    required this.familyId,
    required this.type,
    required this.amount,
    this.rideId,
    this.driverId,
    this.note,
    bool? confirmed,
    DateTime? createdAt,
  }) : confirmed = confirmed ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory LedgerEntry({
    int? id,
    required int familyId,
    required _i2.LedgerEntryType type,
    required int amount,
    int? rideId,
    int? driverId,
    String? note,
    bool? confirmed,
    DateTime? createdAt,
  }) = _LedgerEntryImpl;

  factory LedgerEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return LedgerEntry(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      type: _i2.LedgerEntryType.fromJson((jsonSerialization['type'] as String)),
      amount: jsonSerialization['amount'] as int,
      rideId: jsonSerialization['rideId'] as int?,
      driverId: jsonSerialization['driverId'] as int?,
      note: jsonSerialization['note'] as String?,
      confirmed: jsonSerialization['confirmed'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['confirmed']),
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

  /// Сумма в манатах: пополнение — со знаком плюс, списание — минус.
  int amount;

  int? rideId;

  int? driverId;

  String? note;

  /// Наличные подтверждает диспетчер.
  bool confirmed;

  DateTime createdAt;

  /// Returns a shallow copy of this [LedgerEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LedgerEntry copyWith({
    int? id,
    int? familyId,
    _i2.LedgerEntryType? type,
    int? amount,
    int? rideId,
    int? driverId,
    String? note,
    bool? confirmed,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LedgerEntry',
      if (id != null) 'id': id,
      'familyId': familyId,
      'type': type.toJson(),
      'amount': amount,
      if (rideId != null) 'rideId': rideId,
      if (driverId != null) 'driverId': driverId,
      if (note != null) 'note': note,
      'confirmed': confirmed,
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
    required int amount,
    int? rideId,
    int? driverId,
    String? note,
    bool? confirmed,
    DateTime? createdAt,
  }) : super._(
         id: id,
         familyId: familyId,
         type: type,
         amount: amount,
         rideId: rideId,
         driverId: driverId,
         note: note,
         confirmed: confirmed,
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
    int? amount,
    Object? rideId = _Undefined,
    Object? driverId = _Undefined,
    Object? note = _Undefined,
    bool? confirmed,
    DateTime? createdAt,
  }) {
    return LedgerEntry(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      rideId: rideId is int? ? rideId : this.rideId,
      driverId: driverId is int? ? driverId : this.driverId,
      note: note is String? ? note : this.note,
      confirmed: confirmed ?? this.confirmed,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
