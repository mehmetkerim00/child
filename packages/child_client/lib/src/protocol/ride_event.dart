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
import 'ride_event_type.dart' as _i2;
import 'account_role.dart' as _i3;

/// Иммутабельный лог событий поездки.
abstract class RideEvent implements _i1.SerializableModel {
  RideEvent._({
    this.id,
    required this.rideId,
    required this.clientEventId,
    this.childId,
    required this.type,
    required this.at,
    required this.byRole,
    this.lat,
    this.lng,
    this.photoUrl,
    this.note,
  });

  factory RideEvent({
    int? id,
    required int rideId,
    required String clientEventId,
    int? childId,
    required _i2.RideEventType type,
    required DateTime at,
    required _i3.AccountRole byRole,
    double? lat,
    double? lng,
    String? photoUrl,
    String? note,
  }) = _RideEventImpl;

  factory RideEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideEvent(
      id: jsonSerialization['id'] as int?,
      rideId: jsonSerialization['rideId'] as int,
      clientEventId: jsonSerialization['clientEventId'] as String,
      childId: jsonSerialization['childId'] as int?,
      type: _i2.RideEventType.fromJson((jsonSerialization['type'] as String)),
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
      byRole: _i3.AccountRole.fromJson((jsonSerialization['byRole'] as String)),
      lat: (jsonSerialization['lat'] as num?)?.toDouble(),
      lng: (jsonSerialization['lng'] as num?)?.toDouble(),
      photoUrl: jsonSerialization['photoUrl'] as String?,
      note: jsonSerialization['note'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int rideId;

  /// Идентификатор, присвоенный приложением водителя. Нужен, чтобы
  /// событие из офлайн-очереди не записалось дважды при повторной отправке.
  String clientEventId;

  /// Для «забрал» и «передал» в пуле — к какому ребёнку относится событие.
  int? childId;

  _i2.RideEventType type;

  DateTime at;

  /// Кто отметил событие: driver или dispatcher.
  _i3.AccountRole byRole;

  double? lat;

  double? lng;

  String? photoUrl;

  /// Причина задержки, код учреждения и прочее — короткой строкой.
  String? note;

  /// Returns a shallow copy of this [RideEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideEvent copyWith({
    int? id,
    int? rideId,
    String? clientEventId,
    int? childId,
    _i2.RideEventType? type,
    DateTime? at,
    _i3.AccountRole? byRole,
    double? lat,
    double? lng,
    String? photoUrl,
    String? note,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideEvent',
      if (id != null) 'id': id,
      'rideId': rideId,
      'clientEventId': clientEventId,
      if (childId != null) 'childId': childId,
      'type': type.toJson(),
      'at': at.toJson(),
      'byRole': byRole.toJson(),
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (photoUrl != null) 'photoUrl': photoUrl,
      if (note != null) 'note': note,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideEventImpl extends RideEvent {
  _RideEventImpl({
    int? id,
    required int rideId,
    required String clientEventId,
    int? childId,
    required _i2.RideEventType type,
    required DateTime at,
    required _i3.AccountRole byRole,
    double? lat,
    double? lng,
    String? photoUrl,
    String? note,
  }) : super._(
         id: id,
         rideId: rideId,
         clientEventId: clientEventId,
         childId: childId,
         type: type,
         at: at,
         byRole: byRole,
         lat: lat,
         lng: lng,
         photoUrl: photoUrl,
         note: note,
       );

  /// Returns a shallow copy of this [RideEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideEvent copyWith({
    Object? id = _Undefined,
    int? rideId,
    String? clientEventId,
    Object? childId = _Undefined,
    _i2.RideEventType? type,
    DateTime? at,
    _i3.AccountRole? byRole,
    Object? lat = _Undefined,
    Object? lng = _Undefined,
    Object? photoUrl = _Undefined,
    Object? note = _Undefined,
  }) {
    return RideEvent(
      id: id is int? ? id : this.id,
      rideId: rideId ?? this.rideId,
      clientEventId: clientEventId ?? this.clientEventId,
      childId: childId is int? ? childId : this.childId,
      type: type ?? this.type,
      at: at ?? this.at,
      byRole: byRole ?? this.byRole,
      lat: lat is double? ? lat : this.lat,
      lng: lng is double? ? lng : this.lng,
      photoUrl: photoUrl is String? ? photoUrl : this.photoUrl,
      note: note is String? ? note : this.note,
    );
  }
}
