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

/// Ответ сервера приложению водителя после отправки точек.
abstract class TrackingState implements _i1.SerializableModel {
  TrackingState._({
    required this.trackingAllowed,
    required this.accepted,
  });

  factory TrackingState({
    required bool trackingAllowed,
    required int accepted,
  }) = _TrackingStateImpl;

  factory TrackingState.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrackingState(
      trackingAllowed: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['trackingAllowed'],
      ),
      accepted: jsonSerialization['accepted'] as int,
    );
  }

  /// false — поездка закончилась или отменена: приложение обязано
  /// выключить геолокацию и убрать уведомление.
  bool trackingAllowed;

  /// Сколько точек принято.
  int accepted;

  /// Returns a shallow copy of this [TrackingState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TrackingState copyWith({
    bool? trackingAllowed,
    int? accepted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrackingState',
      'trackingAllowed': trackingAllowed,
      'accepted': accepted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TrackingStateImpl extends TrackingState {
  _TrackingStateImpl({
    required bool trackingAllowed,
    required int accepted,
  }) : super._(
         trackingAllowed: trackingAllowed,
         accepted: accepted,
       );

  /// Returns a shallow copy of this [TrackingState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TrackingState copyWith({
    bool? trackingAllowed,
    int? accepted,
  }) {
    return TrackingState(
      trackingAllowed: trackingAllowed ?? this.trackingAllowed,
      accepted: accepted ?? this.accepted,
    );
  }
}
