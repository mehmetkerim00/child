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

/// Ребёнок. Персональных данных — минимум (MVP_PLAN §5).
abstract class Child implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int familyId;

  String name;

  int? birthYear;

  /// Кодовое слово семьи: водитель называет его при посадке.
  String codeWord;

  bool needsChildSeat;

  String? photoUrl;

  DateTime createdAt;

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
