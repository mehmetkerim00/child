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

/// Состояние системы для мониторинга. Не хранится — считается на лету.
///
/// Сервис возит детей: тишина опаснее ошибки. Эти цифры отвечают на
/// вопрос «работает ли всё прямо сейчас», а не «что было вчера».
abstract class SystemHealth
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SystemHealth._({
    required this.at,
    required this.databaseOk,
    required this.queued,
    required this.oldestQueuedMinutes,
    required this.failedLastHour,
    required this.smsLastHour,
    required this.smsLatencySeconds,
    required this.ridesToday,
    required this.ridesWithoutDriver,
    required this.openTasks,
    required this.problems,
  });

  factory SystemHealth({
    required DateTime at,
    required bool databaseOk,
    required int queued,
    required int oldestQueuedMinutes,
    required int failedLastHour,
    required int smsLastHour,
    required int smsLatencySeconds,
    required int ridesToday,
    required int ridesWithoutDriver,
    required int openTasks,
    required List<String> problems,
  }) = _SystemHealthImpl;

  factory SystemHealth.fromJson(Map<String, dynamic> jsonSerialization) {
    return SystemHealth(
      at: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['at']),
      databaseOk: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['databaseOk'],
      ),
      queued: jsonSerialization['queued'] as int,
      oldestQueuedMinutes: jsonSerialization['oldestQueuedMinutes'] as int,
      failedLastHour: jsonSerialization['failedLastHour'] as int,
      smsLastHour: jsonSerialization['smsLastHour'] as int,
      smsLatencySeconds: jsonSerialization['smsLatencySeconds'] as int,
      ridesToday: jsonSerialization['ridesToday'] as int,
      ridesWithoutDriver: jsonSerialization['ridesWithoutDriver'] as int,
      openTasks: jsonSerialization['openTasks'] as int,
      problems: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['problems'],
      ),
    );
  }

  DateTime at;

  /// База отвечает.
  bool databaseOk;

  /// Уведомления, ждущие отправки.
  int queued;

  /// Возраст самого старого ожидающего уведомления, минуты.
  int oldestQueuedMinutes;

  /// Уведомления, которые не удалось доставить за последний час.
  int failedLastHour;

  /// Отправлено SMS за последний час — по ним считается счёт.
  int smsLastHour;

  /// Средняя задержка SMS от события до отправки, секунды.
  int smsLatencySeconds;

  /// Поездки на сегодня и завтра и сколько из них без водителя.
  ///
  /// Завтра — не лишнее: поездку без машины надо увидеть вечером,
  /// а не утром, когда ребёнок уже ждёт у подъезда.
  int ridesToday;

  int ridesWithoutDriver;

  /// Открытые задачи диспетчера.
  int openTasks;

  /// Что именно деградировало: пустой список — всё в порядке.
  List<String> problems;

  /// Returns a shallow copy of this [SystemHealth]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SystemHealth copyWith({
    DateTime? at,
    bool? databaseOk,
    int? queued,
    int? oldestQueuedMinutes,
    int? failedLastHour,
    int? smsLastHour,
    int? smsLatencySeconds,
    int? ridesToday,
    int? ridesWithoutDriver,
    int? openTasks,
    List<String>? problems,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SystemHealth',
      'at': at.toJson(),
      'databaseOk': databaseOk,
      'queued': queued,
      'oldestQueuedMinutes': oldestQueuedMinutes,
      'failedLastHour': failedLastHour,
      'smsLastHour': smsLastHour,
      'smsLatencySeconds': smsLatencySeconds,
      'ridesToday': ridesToday,
      'ridesWithoutDriver': ridesWithoutDriver,
      'openTasks': openTasks,
      'problems': problems.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SystemHealth',
      'at': at.toJson(),
      'databaseOk': databaseOk,
      'queued': queued,
      'oldestQueuedMinutes': oldestQueuedMinutes,
      'failedLastHour': failedLastHour,
      'smsLastHour': smsLastHour,
      'smsLatencySeconds': smsLatencySeconds,
      'ridesToday': ridesToday,
      'ridesWithoutDriver': ridesWithoutDriver,
      'openTasks': openTasks,
      'problems': problems.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SystemHealthImpl extends SystemHealth {
  _SystemHealthImpl({
    required DateTime at,
    required bool databaseOk,
    required int queued,
    required int oldestQueuedMinutes,
    required int failedLastHour,
    required int smsLastHour,
    required int smsLatencySeconds,
    required int ridesToday,
    required int ridesWithoutDriver,
    required int openTasks,
    required List<String> problems,
  }) : super._(
         at: at,
         databaseOk: databaseOk,
         queued: queued,
         oldestQueuedMinutes: oldestQueuedMinutes,
         failedLastHour: failedLastHour,
         smsLastHour: smsLastHour,
         smsLatencySeconds: smsLatencySeconds,
         ridesToday: ridesToday,
         ridesWithoutDriver: ridesWithoutDriver,
         openTasks: openTasks,
         problems: problems,
       );

  /// Returns a shallow copy of this [SystemHealth]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SystemHealth copyWith({
    DateTime? at,
    bool? databaseOk,
    int? queued,
    int? oldestQueuedMinutes,
    int? failedLastHour,
    int? smsLastHour,
    int? smsLatencySeconds,
    int? ridesToday,
    int? ridesWithoutDriver,
    int? openTasks,
    List<String>? problems,
  }) {
    return SystemHealth(
      at: at ?? this.at,
      databaseOk: databaseOk ?? this.databaseOk,
      queued: queued ?? this.queued,
      oldestQueuedMinutes: oldestQueuedMinutes ?? this.oldestQueuedMinutes,
      failedLastHour: failedLastHour ?? this.failedLastHour,
      smsLastHour: smsLastHour ?? this.smsLastHour,
      smsLatencySeconds: smsLatencySeconds ?? this.smsLatencySeconds,
      ridesToday: ridesToday ?? this.ridesToday,
      ridesWithoutDriver: ridesWithoutDriver ?? this.ridesWithoutDriver,
      openTasks: openTasks ?? this.openTasks,
      problems: problems ?? this.problems.map((e0) => e0).toList(),
    );
  }
}
