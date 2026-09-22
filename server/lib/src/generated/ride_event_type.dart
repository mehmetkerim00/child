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

/// Тип события поездки (иммутабельный лог).
enum RideEventType implements _i1.SerializableModel {
  confirmed,
  enRoute,
  pickedUp,
  inTransit,
  arrived,
  handedOver,
  delayed,
  cancelledByFamily,
  cancelledNoDriver,
  driverReplaced
  ;

  static RideEventType fromJson(String name) {
    switch (name) {
      case 'confirmed':
        return RideEventType.confirmed;
      case 'enRoute':
        return RideEventType.enRoute;
      case 'pickedUp':
        return RideEventType.pickedUp;
      case 'inTransit':
        return RideEventType.inTransit;
      case 'arrived':
        return RideEventType.arrived;
      case 'handedOver':
        return RideEventType.handedOver;
      case 'delayed':
        return RideEventType.delayed;
      case 'cancelledByFamily':
        return RideEventType.cancelledByFamily;
      case 'cancelledNoDriver':
        return RideEventType.cancelledNoDriver;
      case 'driverReplaced':
        return RideEventType.driverReplaced;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "RideEventType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
