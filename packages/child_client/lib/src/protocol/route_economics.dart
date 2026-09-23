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

/// Экономика одного маршрута за период.
///
/// Главный вопрос владельца: какие маршруты убыточны. Считаем честно:
/// выручка минус SMS минус доля выплаты водителю.
abstract class RouteEconomics implements _i1.SerializableModel {
  RouteEconomics._({
    required this.routeId,
    required this.childName,
    required this.destination,
    required this.rides,
    required this.revenueTenge,
    required this.smsCostTenge,
    required this.driverPayTenge,
    required this.marginTenge,
  });

  factory RouteEconomics({
    required int routeId,
    required String childName,
    required String destination,
    required int rides,
    required int revenueTenge,
    required int smsCostTenge,
    required int driverPayTenge,
    required int marginTenge,
  }) = _RouteEconomicsImpl;

  factory RouteEconomics.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteEconomics(
      routeId: jsonSerialization['routeId'] as int,
      childName: jsonSerialization['childName'] as String,
      destination: jsonSerialization['destination'] as String,
      rides: jsonSerialization['rides'] as int,
      revenueTenge: jsonSerialization['revenueTenge'] as int,
      smsCostTenge: jsonSerialization['smsCostTenge'] as int,
      driverPayTenge: jsonSerialization['driverPayTenge'] as int,
      marginTenge: jsonSerialization['marginTenge'] as int,
    );
  }

  int routeId;

  String childName;

  String destination;

  int rides;

  int revenueTenge;

  int smsCostTenge;

  int driverPayTenge;

  /// Выручка − SMS − выплата водителю.
  int marginTenge;

  /// Returns a shallow copy of this [RouteEconomics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteEconomics copyWith({
    int? routeId,
    String? childName,
    String? destination,
    int? rides,
    int? revenueTenge,
    int? smsCostTenge,
    int? driverPayTenge,
    int? marginTenge,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RouteEconomics',
      'routeId': routeId,
      'childName': childName,
      'destination': destination,
      'rides': rides,
      'revenueTenge': revenueTenge,
      'smsCostTenge': smsCostTenge,
      'driverPayTenge': driverPayTenge,
      'marginTenge': marginTenge,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RouteEconomicsImpl extends RouteEconomics {
  _RouteEconomicsImpl({
    required int routeId,
    required String childName,
    required String destination,
    required int rides,
    required int revenueTenge,
    required int smsCostTenge,
    required int driverPayTenge,
    required int marginTenge,
  }) : super._(
         routeId: routeId,
         childName: childName,
         destination: destination,
         rides: rides,
         revenueTenge: revenueTenge,
         smsCostTenge: smsCostTenge,
         driverPayTenge: driverPayTenge,
         marginTenge: marginTenge,
       );

  /// Returns a shallow copy of this [RouteEconomics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteEconomics copyWith({
    int? routeId,
    String? childName,
    String? destination,
    int? rides,
    int? revenueTenge,
    int? smsCostTenge,
    int? driverPayTenge,
    int? marginTenge,
  }) {
    return RouteEconomics(
      routeId: routeId ?? this.routeId,
      childName: childName ?? this.childName,
      destination: destination ?? this.destination,
      rides: rides ?? this.rides,
      revenueTenge: revenueTenge ?? this.revenueTenge,
      smsCostTenge: smsCostTenge ?? this.smsCostTenge,
      driverPayTenge: driverPayTenge ?? this.driverPayTenge,
      marginTenge: marginTenge ?? this.marginTenge,
    );
  }
}
