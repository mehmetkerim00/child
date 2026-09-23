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
import 'package:child_server/src/generated/protocol.dart' as _i2;

/// Водитель нагрузочного прогона: чем он представляется серверу.
///
/// Отдаётся один раз при засеве, дальше скрипт бьёт по обычным
/// эндпоинтам ровно так же, как настоящее приложение водителя.
abstract class LoadDriver
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LoadDriver._({
    required this.token,
    required this.driverId,
    required this.codeWord,
    required this.rideIds,
  });

  factory LoadDriver({
    required String token,
    required int driverId,
    required String codeWord,
    required List<int> rideIds,
  }) = _LoadDriverImpl;

  factory LoadDriver.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoadDriver(
      token: jsonSerialization['token'] as String,
      driverId: jsonSerialization['driverId'] as int,
      codeWord: jsonSerialization['codeWord'] as String,
      rideIds: _i2.Protocol().deserialize<List<int>>(
        jsonSerialization['rideIds'],
      ),
    );
  }

  /// Токен сессии: тот же, что выдаёт обычный вход по телефону.
  String token;

  int driverId;

  /// Кодовое слово семьи — без него «Забрал» не пройдёт.
  String codeWord;

  /// Поездки этого водителя на сегодня.
  List<int> rideIds;

  /// Returns a shallow copy of this [LoadDriver]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LoadDriver copyWith({
    String? token,
    int? driverId,
    String? codeWord,
    List<int>? rideIds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LoadDriver',
      'token': token,
      'driverId': driverId,
      'codeWord': codeWord,
      'rideIds': rideIds.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LoadDriver',
      'token': token,
      'driverId': driverId,
      'codeWord': codeWord,
      'rideIds': rideIds.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LoadDriverImpl extends LoadDriver {
  _LoadDriverImpl({
    required String token,
    required int driverId,
    required String codeWord,
    required List<int> rideIds,
  }) : super._(
         token: token,
         driverId: driverId,
         codeWord: codeWord,
         rideIds: rideIds,
       );

  /// Returns a shallow copy of this [LoadDriver]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LoadDriver copyWith({
    String? token,
    int? driverId,
    String? codeWord,
    List<int>? rideIds,
  }) {
    return LoadDriver(
      token: token ?? this.token,
      driverId: driverId ?? this.driverId,
      codeWord: codeWord ?? this.codeWord,
      rideIds: rideIds ?? this.rideIds.map((e0) => e0).toList(),
    );
  }
}
