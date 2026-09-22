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
import 'circle_rank.dart' as _i2;

/// «Круг семьи»: постоянный водитель и 1–2 резервных.
abstract class FamilyCircle implements _i1.SerializableModel {
  FamilyCircle._({
    this.id,
    required this.familyId,
    required this.driverId,
    required this.rank,
  });

  factory FamilyCircle({
    int? id,
    required int familyId,
    required int driverId,
    required _i2.CircleRank rank,
  }) = _FamilyCircleImpl;

  factory FamilyCircle.fromJson(Map<String, dynamic> jsonSerialization) {
    return FamilyCircle(
      id: jsonSerialization['id'] as int?,
      familyId: jsonSerialization['familyId'] as int,
      driverId: jsonSerialization['driverId'] as int,
      rank: _i2.CircleRank.fromJson((jsonSerialization['rank'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int familyId;

  int driverId;

  _i2.CircleRank rank;

  /// Returns a shallow copy of this [FamilyCircle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FamilyCircle copyWith({
    int? id,
    int? familyId,
    int? driverId,
    _i2.CircleRank? rank,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FamilyCircle',
      if (id != null) 'id': id,
      'familyId': familyId,
      'driverId': driverId,
      'rank': rank.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FamilyCircleImpl extends FamilyCircle {
  _FamilyCircleImpl({
    int? id,
    required int familyId,
    required int driverId,
    required _i2.CircleRank rank,
  }) : super._(
         id: id,
         familyId: familyId,
         driverId: driverId,
         rank: rank,
       );

  /// Returns a shallow copy of this [FamilyCircle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FamilyCircle copyWith({
    Object? id = _Undefined,
    int? familyId,
    int? driverId,
    _i2.CircleRank? rank,
  }) {
    return FamilyCircle(
      id: id is int? ? id : this.id,
      familyId: familyId ?? this.familyId,
      driverId: driverId ?? this.driverId,
      rank: rank ?? this.rank,
    );
  }
}
