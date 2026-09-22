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

/// Статус поездки (MVP_PLAN §6). Дублирует RideStatus из core_domain.
enum RideStatus implements _i1.SerializableModel {
  scheduled,
  confirmed,
  enRoute,
  pickedUp,
  inTransit,
  arrived,
  handedOver,
  delayed,
  cancelledByFamily,
  cancelledNoDriver,
  driverReplaced;

  static RideStatus fromJson(String name) {
    switch (name) {
      case 'scheduled':
        return RideStatus.scheduled;
      case 'confirmed':
        return RideStatus.confirmed;
      case 'enRoute':
        return RideStatus.enRoute;
      case 'pickedUp':
        return RideStatus.pickedUp;
      case 'inTransit':
        return RideStatus.inTransit;
      case 'arrived':
        return RideStatus.arrived;
      case 'handedOver':
        return RideStatus.handedOver;
      case 'delayed':
        return RideStatus.delayed;
      case 'cancelledByFamily':
        return RideStatus.cancelledByFamily;
      case 'cancelledNoDriver':
        return RideStatus.cancelledNoDriver;
      case 'driverReplaced':
        return RideStatus.driverReplaced;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "RideStatus"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
