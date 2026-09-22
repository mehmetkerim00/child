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

/// Почему сервер не принял событие поездки.
enum RideFlowError implements _i1.SerializableModel {
  rideFinished,
  wrongOrder,
  wrongCodeWord,
  handoverProofRequired,
  reasonRequired,
  unsupportedEvent
  ;

  static RideFlowError fromJson(String name) {
    switch (name) {
      case 'rideFinished':
        return RideFlowError.rideFinished;
      case 'wrongOrder':
        return RideFlowError.wrongOrder;
      case 'wrongCodeWord':
        return RideFlowError.wrongCodeWord;
      case 'handoverProofRequired':
        return RideFlowError.handoverProofRequired;
      case 'reasonRequired':
        return RideFlowError.reasonRequired;
      case 'unsupportedEvent':
        return RideFlowError.unsupportedEvent;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "RideFlowError"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
