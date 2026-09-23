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
import 'check_kind.dart' as _i2;

/// Пункт чек-листа проверки кандидата.
///
/// Каждый шаг отмечает конкретный диспетчер: в найме водителей для детей
/// анонимных решений быть не должно.
abstract class ApplicationCheck implements _i1.SerializableModel {
  ApplicationCheck._({
    this.id,
    required this.applicationId,
    required this.kind,
    bool? passed,
    this.note,
    this.checkedAt,
    this.checkedBy,
  }) : passed = passed ?? false;

  factory ApplicationCheck({
    int? id,
    required int applicationId,
    required _i2.CheckKind kind,
    bool? passed,
    String? note,
    DateTime? checkedAt,
    int? checkedBy,
  }) = _ApplicationCheckImpl;

  factory ApplicationCheck.fromJson(Map<String, dynamic> jsonSerialization) {
    return ApplicationCheck(
      id: jsonSerialization['id'] as int?,
      applicationId: jsonSerialization['applicationId'] as int,
      kind: _i2.CheckKind.fromJson((jsonSerialization['kind'] as String)),
      passed: jsonSerialization['passed'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['passed']),
      note: jsonSerialization['note'] as String?,
      checkedAt: jsonSerialization['checkedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['checkedAt']),
      checkedBy: jsonSerialization['checkedBy'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int applicationId;

  _i2.CheckKind kind;

  bool passed;

  String? note;

  DateTime? checkedAt;

  int? checkedBy;

  /// Returns a shallow copy of this [ApplicationCheck]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ApplicationCheck copyWith({
    int? id,
    int? applicationId,
    _i2.CheckKind? kind,
    bool? passed,
    String? note,
    DateTime? checkedAt,
    int? checkedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ApplicationCheck',
      if (id != null) 'id': id,
      'applicationId': applicationId,
      'kind': kind.toJson(),
      'passed': passed,
      if (note != null) 'note': note,
      if (checkedAt != null) 'checkedAt': checkedAt?.toJson(),
      if (checkedBy != null) 'checkedBy': checkedBy,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ApplicationCheckImpl extends ApplicationCheck {
  _ApplicationCheckImpl({
    int? id,
    required int applicationId,
    required _i2.CheckKind kind,
    bool? passed,
    String? note,
    DateTime? checkedAt,
    int? checkedBy,
  }) : super._(
         id: id,
         applicationId: applicationId,
         kind: kind,
         passed: passed,
         note: note,
         checkedAt: checkedAt,
         checkedBy: checkedBy,
       );

  /// Returns a shallow copy of this [ApplicationCheck]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ApplicationCheck copyWith({
    Object? id = _Undefined,
    int? applicationId,
    _i2.CheckKind? kind,
    bool? passed,
    Object? note = _Undefined,
    Object? checkedAt = _Undefined,
    Object? checkedBy = _Undefined,
  }) {
    return ApplicationCheck(
      id: id is int? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      kind: kind ?? this.kind,
      passed: passed ?? this.passed,
      note: note is String? ? note : this.note,
      checkedAt: checkedAt is DateTime? ? checkedAt : this.checkedAt,
      checkedBy: checkedBy is int? ? checkedBy : this.checkedBy,
    );
  }
}
