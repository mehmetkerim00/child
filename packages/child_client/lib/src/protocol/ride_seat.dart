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

/// Место ребёнка в поездке.
///
/// В машине может ехать несколько детей из разных семей (пулинг).
/// Каждого забирают и передают отдельно: своё кодовое слово, свой адрес,
/// своё списание. Поэтому статус этапов — на месте, а не на поездке.
abstract class RideSeat implements _i1.SerializableModel {
  RideSeat._({
    this.id,
    required this.rideId,
    required this.childId,
    this.templateId,
    int? pickupOrder,
    this.pickedUpAt,
    this.handedOverAt,
    this.cancelledAt,
    this.absenceReason,
    this.confirmedByInstitutionAt,
    this.confirmedByInstitutionName,
    int? seatPriceTenge,
  }) : pickupOrder = pickupOrder ?? 1,
       seatPriceTenge = seatPriceTenge ?? 0;

  factory RideSeat({
    int? id,
    required int rideId,
    required int childId,
    int? templateId,
    int? pickupOrder,
    DateTime? pickedUpAt,
    DateTime? handedOverAt,
    DateTime? cancelledAt,
    String? absenceReason,
    DateTime? confirmedByInstitutionAt,
    String? confirmedByInstitutionName,
    int? seatPriceTenge,
  }) = _RideSeatImpl;

  factory RideSeat.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideSeat(
      id: jsonSerialization['id'] as int?,
      rideId: jsonSerialization['rideId'] as int,
      childId: jsonSerialization['childId'] as int,
      templateId: jsonSerialization['templateId'] as int?,
      pickupOrder: jsonSerialization['pickupOrder'] as int?,
      pickedUpAt: jsonSerialization['pickedUpAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['pickedUpAt']),
      handedOverAt: jsonSerialization['handedOverAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['handedOverAt'],
            ),
      cancelledAt: jsonSerialization['cancelledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancelledAt'],
            ),
      absenceReason: jsonSerialization['absenceReason'] as String?,
      confirmedByInstitutionAt:
          jsonSerialization['confirmedByInstitutionAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedByInstitutionAt'],
            ),
      confirmedByInstitutionName:
          jsonSerialization['confirmedByInstitutionName'] as String?,
      seatPriceTenge: jsonSerialization['seatPriceTenge'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int rideId;

  int childId;

  /// Шаблон маршрута этого ребёнка: из него берутся адрес и цена места.
  int? templateId;

  /// Порядок посадки: 1 — забираем первым.
  int pickupOrder;

  /// Этот ребёнок уже в машине.
  DateTime? pickedUpAt;

  /// Этот ребёнок передан принимающему.
  DateTime? handedOverAt;

  /// Семья отменила поездку этого ребёнка на сегодня.
  DateTime? cancelledAt;

  /// Причина отсутствия, если семья предупредила заранее.
  String? absenceReason;

  /// Учреждение подтвердило приём ребёнка — независимое от водителя
  /// подтверждение передачи.
  DateTime? confirmedByInstitutionAt;

  /// Кто подтвердил со стороны учреждения (имя воспитателя).
  String? confirmedByInstitutionName;

  /// Цена места в тенге: в пуле каждая семья платит за своё место.
  int seatPriceTenge;

  /// Returns a shallow copy of this [RideSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideSeat copyWith({
    int? id,
    int? rideId,
    int? childId,
    int? templateId,
    int? pickupOrder,
    DateTime? pickedUpAt,
    DateTime? handedOverAt,
    DateTime? cancelledAt,
    String? absenceReason,
    DateTime? confirmedByInstitutionAt,
    String? confirmedByInstitutionName,
    int? seatPriceTenge,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideSeat',
      if (id != null) 'id': id,
      'rideId': rideId,
      'childId': childId,
      if (templateId != null) 'templateId': templateId,
      'pickupOrder': pickupOrder,
      if (pickedUpAt != null) 'pickedUpAt': pickedUpAt?.toJson(),
      if (handedOverAt != null) 'handedOverAt': handedOverAt?.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
      if (absenceReason != null) 'absenceReason': absenceReason,
      if (confirmedByInstitutionAt != null)
        'confirmedByInstitutionAt': confirmedByInstitutionAt?.toJson(),
      if (confirmedByInstitutionName != null)
        'confirmedByInstitutionName': confirmedByInstitutionName,
      'seatPriceTenge': seatPriceTenge,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideSeatImpl extends RideSeat {
  _RideSeatImpl({
    int? id,
    required int rideId,
    required int childId,
    int? templateId,
    int? pickupOrder,
    DateTime? pickedUpAt,
    DateTime? handedOverAt,
    DateTime? cancelledAt,
    String? absenceReason,
    DateTime? confirmedByInstitutionAt,
    String? confirmedByInstitutionName,
    int? seatPriceTenge,
  }) : super._(
         id: id,
         rideId: rideId,
         childId: childId,
         templateId: templateId,
         pickupOrder: pickupOrder,
         pickedUpAt: pickedUpAt,
         handedOverAt: handedOverAt,
         cancelledAt: cancelledAt,
         absenceReason: absenceReason,
         confirmedByInstitutionAt: confirmedByInstitutionAt,
         confirmedByInstitutionName: confirmedByInstitutionName,
         seatPriceTenge: seatPriceTenge,
       );

  /// Returns a shallow copy of this [RideSeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideSeat copyWith({
    Object? id = _Undefined,
    int? rideId,
    int? childId,
    Object? templateId = _Undefined,
    int? pickupOrder,
    Object? pickedUpAt = _Undefined,
    Object? handedOverAt = _Undefined,
    Object? cancelledAt = _Undefined,
    Object? absenceReason = _Undefined,
    Object? confirmedByInstitutionAt = _Undefined,
    Object? confirmedByInstitutionName = _Undefined,
    int? seatPriceTenge,
  }) {
    return RideSeat(
      id: id is int? ? id : this.id,
      rideId: rideId ?? this.rideId,
      childId: childId ?? this.childId,
      templateId: templateId is int? ? templateId : this.templateId,
      pickupOrder: pickupOrder ?? this.pickupOrder,
      pickedUpAt: pickedUpAt is DateTime? ? pickedUpAt : this.pickedUpAt,
      handedOverAt: handedOverAt is DateTime?
          ? handedOverAt
          : this.handedOverAt,
      cancelledAt: cancelledAt is DateTime? ? cancelledAt : this.cancelledAt,
      absenceReason: absenceReason is String?
          ? absenceReason
          : this.absenceReason,
      confirmedByInstitutionAt: confirmedByInstitutionAt is DateTime?
          ? confirmedByInstitutionAt
          : this.confirmedByInstitutionAt,
      confirmedByInstitutionName: confirmedByInstitutionName is String?
          ? confirmedByInstitutionName
          : this.confirmedByInstitutionName,
      seatPriceTenge: seatPriceTenge ?? this.seatPriceTenge,
    );
  }
}
