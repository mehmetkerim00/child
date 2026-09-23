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

/// Сколько ещё детей влезет в машину.
abstract class PoolCapacity
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PoolCapacity._({
    required this.seatsLeft,
    required this.childSeatsLeft,
    required this.fits,
  });

  factory PoolCapacity({
    required int seatsLeft,
    required int childSeatsLeft,
    required bool fits,
  }) = _PoolCapacityImpl;

  factory PoolCapacity.fromJson(Map<String, dynamic> jsonSerialization) {
    return PoolCapacity(
      seatsLeft: jsonSerialization['seatsLeft'] as int,
      childSeatsLeft: jsonSerialization['childSeatsLeft'] as int,
      fits: _i1.BoolJsonExtension.fromJson(jsonSerialization['fits']),
    );
  }

  /// Свободных мест.
  int seatsLeft;

  /// Свободных детских кресел.
  int childSeatsLeft;

  /// Влезет ли конкретный кандидат (с учётом кресла).
  bool fits;

  /// Returns a shallow copy of this [PoolCapacity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PoolCapacity copyWith({
    int? seatsLeft,
    int? childSeatsLeft,
    bool? fits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PoolCapacity',
      'seatsLeft': seatsLeft,
      'childSeatsLeft': childSeatsLeft,
      'fits': fits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PoolCapacity',
      'seatsLeft': seatsLeft,
      'childSeatsLeft': childSeatsLeft,
      'fits': fits,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PoolCapacityImpl extends PoolCapacity {
  _PoolCapacityImpl({
    required int seatsLeft,
    required int childSeatsLeft,
    required bool fits,
  }) : super._(
         seatsLeft: seatsLeft,
         childSeatsLeft: childSeatsLeft,
         fits: fits,
       );

  /// Returns a shallow copy of this [PoolCapacity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PoolCapacity copyWith({
    int? seatsLeft,
    int? childSeatsLeft,
    bool? fits,
  }) {
    return PoolCapacity(
      seatsLeft: seatsLeft ?? this.seatsLeft,
      childSeatsLeft: childSeatsLeft ?? this.childSeatsLeft,
      fits: fits ?? this.fits,
    );
  }
}
