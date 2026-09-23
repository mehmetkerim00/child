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

/// Одноразовая ссылка на выгрузку отчёта.
///
/// Файл с выручкой и балансами семей открывается в браузере без входа,
/// поэтому ссылка живёт минуты и сгорает после первого скачивания.
abstract class ReportExport implements _i1.SerializableModel {
  ReportExport._({
    this.id,
    required this.tokenHash,
    required this.ownerId,
    required this.fromDate,
    required this.toDate,
    required this.smsPriceTenge,
    required this.blockPayTenge,
    required this.perRideTenge,
    required this.createdAt,
    required this.expiresAt,
    this.usedAt,
  });

  factory ReportExport({
    int? id,
    required String tokenHash,
    required int ownerId,
    required DateTime fromDate,
    required DateTime toDate,
    required int smsPriceTenge,
    required int blockPayTenge,
    required int perRideTenge,
    required DateTime createdAt,
    required DateTime expiresAt,
    DateTime? usedAt,
  }) = _ReportExportImpl;

  factory ReportExport.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReportExport(
      id: jsonSerialization['id'] as int?,
      tokenHash: jsonSerialization['tokenHash'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      fromDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['fromDate'],
      ),
      toDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['toDate']),
      smsPriceTenge: jsonSerialization['smsPriceTenge'] as int,
      blockPayTenge: jsonSerialization['blockPayTenge'] as int,
      perRideTenge: jsonSerialization['perRideTenge'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      usedAt: jsonSerialization['usedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['usedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String tokenHash;

  int ownerId;

  DateTime fromDate;

  DateTime toDate;

  /// Ставки, по которым считать: они же были на экране у владельца.
  int smsPriceTenge;

  int blockPayTenge;

  int perRideTenge;

  DateTime createdAt;

  DateTime expiresAt;

  DateTime? usedAt;

  /// Returns a shallow copy of this [ReportExport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReportExport copyWith({
    int? id,
    String? tokenHash,
    int? ownerId,
    DateTime? fromDate,
    DateTime? toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
    DateTime? createdAt,
    DateTime? expiresAt,
    DateTime? usedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReportExport',
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'ownerId': ownerId,
      'fromDate': fromDate.toJson(),
      'toDate': toDate.toJson(),
      'smsPriceTenge': smsPriceTenge,
      'blockPayTenge': blockPayTenge,
      'perRideTenge': perRideTenge,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      if (usedAt != null) 'usedAt': usedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReportExportImpl extends ReportExport {
  _ReportExportImpl({
    int? id,
    required String tokenHash,
    required int ownerId,
    required DateTime fromDate,
    required DateTime toDate,
    required int smsPriceTenge,
    required int blockPayTenge,
    required int perRideTenge,
    required DateTime createdAt,
    required DateTime expiresAt,
    DateTime? usedAt,
  }) : super._(
         id: id,
         tokenHash: tokenHash,
         ownerId: ownerId,
         fromDate: fromDate,
         toDate: toDate,
         smsPriceTenge: smsPriceTenge,
         blockPayTenge: blockPayTenge,
         perRideTenge: perRideTenge,
         createdAt: createdAt,
         expiresAt: expiresAt,
         usedAt: usedAt,
       );

  /// Returns a shallow copy of this [ReportExport]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReportExport copyWith({
    Object? id = _Undefined,
    String? tokenHash,
    int? ownerId,
    DateTime? fromDate,
    DateTime? toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
    DateTime? createdAt,
    DateTime? expiresAt,
    Object? usedAt = _Undefined,
  }) {
    return ReportExport(
      id: id is int? ? id : this.id,
      tokenHash: tokenHash ?? this.tokenHash,
      ownerId: ownerId ?? this.ownerId,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      smsPriceTenge: smsPriceTenge ?? this.smsPriceTenge,
      blockPayTenge: blockPayTenge ?? this.blockPayTenge,
      perRideTenge: perRideTenge ?? this.perRideTenge,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      usedAt: usedAt is DateTime? ? usedAt : this.usedAt,
    );
  }
}
