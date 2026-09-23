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
import 'ride.dart' as _i2;
import 'package:child_server/src/generated/protocol.dart' as _i3;

/// Поездка, которую можно объединить с другой в пул.
///
/// Совместимость: то же учреждение, близкое время, тот же день.
abstract class PoolCandidate
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PoolCandidate._({
    required this.ride,
    required this.childName,
    required this.fromAddress,
    required this.toName,
    required this.timeDiffMinutes,
    required this.needsChildSeat,
  });

  factory PoolCandidate({
    required _i2.Ride ride,
    required String childName,
    required String fromAddress,
    required String toName,
    required int timeDiffMinutes,
    required bool needsChildSeat,
  }) = _PoolCandidateImpl;

  factory PoolCandidate.fromJson(Map<String, dynamic> jsonSerialization) {
    return PoolCandidate(
      ride: _i3.Protocol().deserialize<_i2.Ride>(jsonSerialization['ride']),
      childName: jsonSerialization['childName'] as String,
      fromAddress: jsonSerialization['fromAddress'] as String,
      toName: jsonSerialization['toName'] as String,
      timeDiffMinutes: jsonSerialization['timeDiffMinutes'] as int,
      needsChildSeat: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['needsChildSeat'],
      ),
    );
  }

  _i2.Ride ride;

  String childName;

  String fromAddress;

  String toName;

  /// Разница во времени подачи в минутах.
  int timeDiffMinutes;

  /// Нужно ли этому ребёнку детское кресло.
  bool needsChildSeat;

  /// Returns a shallow copy of this [PoolCandidate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PoolCandidate copyWith({
    _i2.Ride? ride,
    String? childName,
    String? fromAddress,
    String? toName,
    int? timeDiffMinutes,
    bool? needsChildSeat,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PoolCandidate',
      'ride': ride.toJson(),
      'childName': childName,
      'fromAddress': fromAddress,
      'toName': toName,
      'timeDiffMinutes': timeDiffMinutes,
      'needsChildSeat': needsChildSeat,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PoolCandidate',
      'ride': ride.toJsonForProtocol(),
      'childName': childName,
      'fromAddress': fromAddress,
      'toName': toName,
      'timeDiffMinutes': timeDiffMinutes,
      'needsChildSeat': needsChildSeat,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PoolCandidateImpl extends PoolCandidate {
  _PoolCandidateImpl({
    required _i2.Ride ride,
    required String childName,
    required String fromAddress,
    required String toName,
    required int timeDiffMinutes,
    required bool needsChildSeat,
  }) : super._(
         ride: ride,
         childName: childName,
         fromAddress: fromAddress,
         toName: toName,
         timeDiffMinutes: timeDiffMinutes,
         needsChildSeat: needsChildSeat,
       );

  /// Returns a shallow copy of this [PoolCandidate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PoolCandidate copyWith({
    _i2.Ride? ride,
    String? childName,
    String? fromAddress,
    String? toName,
    int? timeDiffMinutes,
    bool? needsChildSeat,
  }) {
    return PoolCandidate(
      ride: ride ?? this.ride.copyWith(),
      childName: childName ?? this.childName,
      fromAddress: fromAddress ?? this.fromAddress,
      toName: toName ?? this.toName,
      timeDiffMinutes: timeDiffMinutes ?? this.timeDiffMinutes,
      needsChildSeat: needsChildSeat ?? this.needsChildSeat,
    );
  }
}
