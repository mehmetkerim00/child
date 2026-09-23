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
import 'ride_event_type.dart' as _i2;

/// Событие поездки, отправленное приложением водителя.
///
/// Приходит и онлайн, и из офлайн-очереди задним числом.
abstract class RideEventSubmission
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RideEventSubmission._({
    required this.clientEventId,
    this.childId,
    required this.type,
    required this.at,
    this.lat,
    this.lng,
    this.note,
    this.codeWord,
    this.institutionCode,
    bool? hasSignature,
  }) : hasSignature = hasSignature ?? false;

  factory RideEventSubmission({
    required String clientEventId,
    int? childId,
    required _i2.RideEventType type,
    required DateTime at,
    double? lat,
    double? lng,
    String? note,
    String? codeWord,
    String? institutionCode,
    bool? hasSignature,
  }) = _RideEventSubmissionImpl;

  factory RideEventSubmission.fromJson(Map<String, dynamic> jsonSerialization) {
    return RideEventSubmission(
      clientEventId: jsonSerialization['clientEventId'] as String,
      childId: jsonSerialization['childId'] as int?,
      type: _i2.RideEventType.fromJson((jsonSerialization['type'] as String)),
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
      lat: (jsonSerialization['lat'] as num?)?.toDouble(),
      lng: (jsonSerialization['lng'] as num?)?.toDouble(),
      note: jsonSerialization['note'] as String?,
      codeWord: jsonSerialization['codeWord'] as String?,
      institutionCode: jsonSerialization['institutionCode'] as String?,
      hasSignature: jsonSerialization['hasSignature'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['hasSignature']),
    );
  }

  /// Идентификатор события на устройстве: защищает от двойной записи.
  String clientEventId;

  /// Кого именно забрали или передали. Пусто — поездка с одним ребёнком.
  int? childId;

  _i2.RideEventType type;

  /// Время, когда водитель нажал кнопку (не время доставки на сервер).
  DateTime at;

  double? lat;

  double? lng;

  /// Причина задержки или отказа.
  String? note;

  /// Кодовое слово семьи — проверяет сервер.
  String? codeWord;

  /// Код учреждения при передаче ребёнка.
  String? institutionCode;

  /// Принимающий расписался на экране.
  bool hasSignature;

  /// Returns a shallow copy of this [RideEventSubmission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RideEventSubmission copyWith({
    String? clientEventId,
    int? childId,
    _i2.RideEventType? type,
    DateTime? at,
    double? lat,
    double? lng,
    String? note,
    String? codeWord,
    String? institutionCode,
    bool? hasSignature,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RideEventSubmission',
      'clientEventId': clientEventId,
      if (childId != null) 'childId': childId,
      'type': type.toJson(),
      'at': at.toJson(),
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (note != null) 'note': note,
      if (codeWord != null) 'codeWord': codeWord,
      if (institutionCode != null) 'institutionCode': institutionCode,
      'hasSignature': hasSignature,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RideEventSubmission',
      'clientEventId': clientEventId,
      if (childId != null) 'childId': childId,
      'type': type.toJson(),
      'at': at.toJson(),
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (note != null) 'note': note,
      if (codeWord != null) 'codeWord': codeWord,
      if (institutionCode != null) 'institutionCode': institutionCode,
      'hasSignature': hasSignature,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RideEventSubmissionImpl extends RideEventSubmission {
  _RideEventSubmissionImpl({
    required String clientEventId,
    int? childId,
    required _i2.RideEventType type,
    required DateTime at,
    double? lat,
    double? lng,
    String? note,
    String? codeWord,
    String? institutionCode,
    bool? hasSignature,
  }) : super._(
         clientEventId: clientEventId,
         childId: childId,
         type: type,
         at: at,
         lat: lat,
         lng: lng,
         note: note,
         codeWord: codeWord,
         institutionCode: institutionCode,
         hasSignature: hasSignature,
       );

  /// Returns a shallow copy of this [RideEventSubmission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RideEventSubmission copyWith({
    String? clientEventId,
    Object? childId = _Undefined,
    _i2.RideEventType? type,
    DateTime? at,
    Object? lat = _Undefined,
    Object? lng = _Undefined,
    Object? note = _Undefined,
    Object? codeWord = _Undefined,
    Object? institutionCode = _Undefined,
    bool? hasSignature,
  }) {
    return RideEventSubmission(
      clientEventId: clientEventId ?? this.clientEventId,
      childId: childId is int? ? childId : this.childId,
      type: type ?? this.type,
      at: at ?? this.at,
      lat: lat is double? ? lat : this.lat,
      lng: lng is double? ? lng : this.lng,
      note: note is String? ? note : this.note,
      codeWord: codeWord is String? ? codeWord : this.codeWord,
      institutionCode: institutionCode is String?
          ? institutionCode
          : this.institutionCode,
      hasSignature: hasSignature ?? this.hasSignature,
    );
  }
}
