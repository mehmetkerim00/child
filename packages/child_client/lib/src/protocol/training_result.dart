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

/// Результат обучения водителя.
///
/// Без сданного теста маршруты не назначаются: протокол передачи
/// ребёнка нельзя «выучить по ходу».
abstract class TrainingResult implements _i1.SerializableModel {
  TrainingResult._({
    this.id,
    required this.driverId,
    required this.correct,
    required this.total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) : passed = passed ?? false,
       attempt = attempt ?? 1,
       createdAt = createdAt ?? DateTime.now();

  factory TrainingResult({
    int? id,
    required int driverId,
    required int correct,
    required int total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) = _TrainingResultImpl;

  factory TrainingResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrainingResult(
      id: jsonSerialization['id'] as int?,
      driverId: jsonSerialization['driverId'] as int,
      correct: jsonSerialization['correct'] as int,
      total: jsonSerialization['total'] as int,
      passed: jsonSerialization['passed'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['passed']),
      attempt: jsonSerialization['attempt'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int driverId;

  /// Сколько верных ответов из общего числа.
  int correct;

  int total;

  bool passed;

  int attempt;

  DateTime createdAt;

  /// Returns a shallow copy of this [TrainingResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TrainingResult copyWith({
    int? id,
    int? driverId,
    int? correct,
    int? total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrainingResult',
      if (id != null) 'id': id,
      'driverId': driverId,
      'correct': correct,
      'total': total,
      'passed': passed,
      'attempt': attempt,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrainingResultImpl extends TrainingResult {
  _TrainingResultImpl({
    int? id,
    required int driverId,
    required int correct,
    required int total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         driverId: driverId,
         correct: correct,
         total: total,
         passed: passed,
         attempt: attempt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [TrainingResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TrainingResult copyWith({
    Object? id = _Undefined,
    int? driverId,
    int? correct,
    int? total,
    bool? passed,
    int? attempt,
    DateTime? createdAt,
  }) {
    return TrainingResult(
      id: id is int? ? id : this.id,
      driverId: driverId ?? this.driverId,
      correct: correct ?? this.correct,
      total: total ?? this.total,
      passed: passed ?? this.passed,
      attempt: attempt ?? this.attempt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
