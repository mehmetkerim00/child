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
import 'dart:async' as _i2;
import 'package:child_client/src/protocol/auth_result.dart' as _i3;
import 'package:child_client/src/protocol/family.dart' as _i4;
import 'package:child_client/src/protocol/parent.dart' as _i5;
import 'package:child_client/src/protocol/child.dart' as _i6;
import 'package:child_client/src/protocol/driver.dart' as _i7;
import 'package:child_client/src/protocol/institution.dart' as _i8;
import 'package:child_client/src/protocol/family_circle.dart' as _i9;
import 'package:child_client/src/protocol/circle_rank.dart' as _i10;
import 'package:child_client/src/protocol/route_template.dart' as _i11;
import 'package:child_client/src/protocol/ride_view.dart' as _i12;
import 'package:child_client/src/protocol/ride_event.dart' as _i13;
import 'package:child_client/src/protocol/ride.dart' as _i14;
import 'package:child_client/src/protocol/ride_event_submission.dart' as _i15;
import 'package:child_client/src/protocol/health/server_health.dart' as _i16;
import 'protocol.dart' as _i17;

/// Вход по номеру телефона и одноразовому коду.
///
/// Аккаунты заводит диспетчер: незнакомый номер получает отказ
/// `unknownPhone`, а не создаёт нового пользователя.
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Запрашивает код подтверждения. Код уходит через SmsGateway
  /// (в dev-режиме — в консоль сервера).
  _i2.Future<void> requestCode(String phoneInput) =>
      caller.callServerEndpoint<void>(
        'auth',
        'requestCode',
        {'phoneInput': phoneInput},
      );

  /// Подтверждает код и выдаёт токен сессии.
  _i2.Future<_i3.AuthResult> verifyCode(
    String phoneInput,
    String code,
  ) => caller.callServerEndpoint<_i3.AuthResult>(
    'auth',
    'verifyCode',
    {
      'phoneInput': phoneInput,
      'code': code,
    },
  );

  /// Завершает сессию текущего устройства.
  _i2.Future<void> logout() => caller.callServerEndpoint<void>(
    'auth',
    'logout',
    {},
  );
}

/// Тестовые данные для разработки и ручной проверки.
///
/// Работает только в режиме development — в проде эндпоинт отвечает отказом.
/// {@category Endpoint}
class EndpointDev extends _i1.EndpointRef {
  EndpointDev(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dev';

  /// Заполняет базу демо-данными: диспетчер, две семьи с детьми,
  /// два водителя, два учреждения. Повторный вызов ничего не дублирует.
  _i2.Future<String> seed() => caller.callServerEndpoint<String>(
    'dev',
    'seed',
    {},
  );
}

/// Справочники для панели диспетчера: семьи, дети, водители, учреждения.
///
/// Доступ только у диспетчера — родители и водители своих данных здесь
/// не правят.
/// {@category Endpoint}
class EndpointDirectory extends _i1.EndpointRef {
  EndpointDirectory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'directory';

  _i2.Future<List<_i4.Family>> families() =>
      caller.callServerEndpoint<List<_i4.Family>>(
        'directory',
        'families',
        {},
      );

  _i2.Future<_i4.Family> saveFamily(_i4.Family family) =>
      caller.callServerEndpoint<_i4.Family>(
        'directory',
        'saveFamily',
        {'family': family},
      );

  _i2.Future<void> deleteFamily(int familyId) =>
      caller.callServerEndpoint<void>(
        'directory',
        'deleteFamily',
        {'familyId': familyId},
      );

  _i2.Future<List<_i5.Parent>> parents(int familyId) =>
      caller.callServerEndpoint<List<_i5.Parent>>(
        'directory',
        'parents',
        {'familyId': familyId},
      );

  _i2.Future<_i5.Parent> saveParent(_i5.Parent parent) =>
      caller.callServerEndpoint<_i5.Parent>(
        'directory',
        'saveParent',
        {'parent': parent},
      );

  _i2.Future<List<_i6.Child>> children({int? familyId}) =>
      caller.callServerEndpoint<List<_i6.Child>>(
        'directory',
        'children',
        {'familyId': familyId},
      );

  _i2.Future<_i6.Child> saveChild(_i6.Child child) =>
      caller.callServerEndpoint<_i6.Child>(
        'directory',
        'saveChild',
        {'child': child},
      );

  _i2.Future<void> deleteChild(int childId) => caller.callServerEndpoint<void>(
    'directory',
    'deleteChild',
    {'childId': childId},
  );

  _i2.Future<List<_i7.Driver>> drivers() =>
      caller.callServerEndpoint<List<_i7.Driver>>(
        'directory',
        'drivers',
        {},
      );

  _i2.Future<_i7.Driver> saveDriver(_i7.Driver driver) =>
      caller.callServerEndpoint<_i7.Driver>(
        'directory',
        'saveDriver',
        {'driver': driver},
      );

  _i2.Future<List<_i8.Institution>> institutions() =>
      caller.callServerEndpoint<List<_i8.Institution>>(
        'directory',
        'institutions',
        {},
      );

  _i2.Future<_i8.Institution> saveInstitution(_i8.Institution institution) =>
      caller.callServerEndpoint<_i8.Institution>(
        'directory',
        'saveInstitution',
        {'institution': institution},
      );

  _i2.Future<List<_i9.FamilyCircle>> circle(int familyId) =>
      caller.callServerEndpoint<List<_i9.FamilyCircle>>(
        'directory',
        'circle',
        {'familyId': familyId},
      );

  /// Назначает водителя на место в круге семьи (постоянный/резервный).
  _i2.Future<_i9.FamilyCircle> assignDriver({
    required int familyId,
    required int driverId,
    required _i10.CircleRank rank,
  }) => caller.callServerEndpoint<_i9.FamilyCircle>(
    'directory',
    'assignDriver',
    {
      'familyId': familyId,
      'driverId': driverId,
      'rank': rank,
    },
  );

  /// Все шаблоны маршрутов.
  _i2.Future<List<_i11.RouteTemplate>> routes() =>
      caller.callServerEndpoint<List<_i11.RouteTemplate>>(
        'directory',
        'routes',
        {},
      );

  /// Заявки родителей, ожидающие активации.
  _i2.Future<List<_i11.RouteTemplate>> pendingRoutes() =>
      caller.callServerEndpoint<List<_i11.RouteTemplate>>(
        'directory',
        'pendingRoutes',
        {},
      );

  /// Активация заявки: назначаем водителя и цену, сразу создаём поездки
  /// на сегодня и завтра.
  _i2.Future<_i11.RouteTemplate> activateRoute({
    required int routeId,
    required int driverId,
    required int pricePerRide,
  }) => caller.callServerEndpoint<_i11.RouteTemplate>(
    'directory',
    'activateRoute',
    {
      'routeId': routeId,
      'driverId': driverId,
      'pricePerRide': pricePerRide,
    },
  );

  /// Отключение маршрута: новые поездки по нему не создаются.
  _i2.Future<_i11.RouteTemplate> deactivateRoute(int routeId) =>
      caller.callServerEndpoint<_i11.RouteTemplate>(
        'directory',
        'deactivateRoute',
        {'routeId': routeId},
      );

  /// Ручной запуск генератора поездок: кнопка у диспетчера и способ
  /// проверить ночную задачу, не дожидаясь полуночи.
  _i2.Future<int> generateUpcomingRides() => caller.callServerEndpoint<int>(
    'directory',
    'generateUpcomingRides',
    {},
  );

  /// Поездки на местную дату (по умолчанию — сегодня) для доски дня.
  _i2.Future<List<_i12.RideView>> ridesForDate({DateTime? date}) =>
      caller.callServerEndpoint<List<_i12.RideView>>(
        'directory',
        'ridesForDate',
        {'date': date},
      );

  /// События поездки — лента для разбора проблем.
  _i2.Future<List<_i13.RideEvent>> rideEvents(int rideId) =>
      caller.callServerEndpoint<List<_i13.RideEvent>>(
        'directory',
        'rideEvents',
        {'rideId': rideId},
      );
}

/// Данные вошедшего пользователя: семья и дети — родителю,
/// профиль — водителю.
/// {@category Endpoint}
class EndpointProfile extends _i1.EndpointRef {
  EndpointProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  /// Семья вошедшего родителя.
  _i2.Future<_i4.Family?> myFamily() => caller.callServerEndpoint<_i4.Family?>(
    'profile',
    'myFamily',
    {},
  );

  /// Дети вошедшего родителя.
  _i2.Future<List<_i6.Child>> myChildren() =>
      caller.callServerEndpoint<List<_i6.Child>>(
        'profile',
        'myChildren',
        {},
      );

  /// Водители из «круга семьи»: постоянный и резервные.
  _i2.Future<List<_i7.Driver>> myDrivers() =>
      caller.callServerEndpoint<List<_i7.Driver>>(
        'profile',
        'myDrivers',
        {},
      );

  /// Профиль вошедшего водителя.
  _i2.Future<_i7.Driver?> myDriverProfile() =>
      caller.callServerEndpoint<_i7.Driver?>(
        'profile',
        'myDriverProfile',
        {},
      );
}

/// Поездки глазами водителя: сегодня, завтра и подтверждение накануне.
///
/// Подтверждение завтрашних поездок — защита от «тихого сбоя»
/// (MVP_PLAN §6): диспетчер узнаёт о проблеме вечером, а не утром.
/// {@category Endpoint}
class EndpointRides extends _i1.EndpointRef {
  EndpointRides(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'rides';

  /// Поездки водителя на сегодня.
  _i2.Future<List<_i12.RideView>> today() =>
      caller.callServerEndpoint<List<_i12.RideView>>(
        'rides',
        'today',
        {},
      );

  /// Поездки водителя на завтра — экран подтверждения.
  _i2.Future<List<_i12.RideView>> tomorrow() =>
      caller.callServerEndpoint<List<_i12.RideView>>(
        'rides',
        'tomorrow',
        {},
      );

  /// Водитель подтверждает поездку: «завтра выйду».
  _i2.Future<_i14.Ride> confirm(int rideId) =>
      caller.callServerEndpoint<_i14.Ride>(
        'rides',
        'confirm',
        {'rideId': rideId},
      );

  /// Водитель не может выйти: причина обязательна и уходит диспетчеру.
  _i2.Future<_i14.Ride> decline(
    int rideId,
    String reason,
  ) => caller.callServerEndpoint<_i14.Ride>(
    'rides',
    'decline',
    {
      'rideId': rideId,
      'reason': reason,
    },
  );

  /// Принимает событие этапа поездки: «Выехал», «Забрал», «Передал» и так
  /// далее. Работает и для событий из офлайн-очереди, отправленных позже.
  _i2.Future<_i14.Ride> submitEvent(
    int rideId,
    _i15.RideEventSubmission submission,
  ) => caller.callServerEndpoint<_i14.Ride>(
    'rides',
    'submitEvent',
    {
      'rideId': rideId,
      'submission': submission,
    },
  );

  /// События поездки — лента для водителя.
  _i2.Future<List<_i13.RideEvent>> events(int rideId) =>
      caller.callServerEndpoint<List<_i13.RideEvent>>(
        'rides',
        'events',
        {'rideId': rideId},
      );

  /// Местная дата «завтра» по Ашхабаду: приложение не считает её само.
  _i2.Future<DateTime> tomorrowDate() => caller.callServerEndpoint<DateTime>(
    'rides',
    'tomorrowDate',
    {},
  );
}

/// Маршруты глазами родителя: заявка и свои маршруты (MVP_PLAN §7).
///
/// Активирует заявки диспетчер — в DirectoryEndpoint.
/// {@category Endpoint}
class EndpointRoutes extends _i1.EndpointRef {
  EndpointRoutes(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'routes';

  /// Заявка родителя на регулярный маршрут. Активной её делает диспетчер.
  _i2.Future<_i11.RouteTemplate> requestRoute(_i11.RouteTemplate draft) =>
      caller.callServerEndpoint<_i11.RouteTemplate>(
        'routes',
        'requestRoute',
        {'draft': draft},
      );

  /// Маршруты детей вошедшего родителя.
  _i2.Future<List<_i11.RouteTemplate>> myRoutes() =>
      caller.callServerEndpoint<List<_i11.RouteTemplate>>(
        'routes',
        'myRoutes',
        {},
      );

  /// События поездки своего ребёнка — лента «что происходило».
  _i2.Future<List<_i13.RideEvent>> rideEvents(int rideId) =>
      caller.callServerEndpoint<List<_i13.RideEvent>>(
        'routes',
        'rideEvents',
        {'rideId': rideId},
      );

  /// Учреждения — родитель выбирает, куда возить ребёнка.
  _i2.Future<List<_i8.Institution>> institutions() =>
      caller.callServerEndpoint<List<_i8.Institution>>(
        'routes',
        'institutions',
        {},
      );

  /// Поездки детей семьи на сегодня и завтра (по Ашхабаду).
  _i2.Future<List<_i12.RideView>> myUpcomingRides() =>
      caller.callServerEndpoint<List<_i12.RideView>>(
        'routes',
        'myUpcomingRides',
        {},
      );
}

/// Проверка связи: клиенты вызывают `client.health.ping()`.
/// {@category Endpoint}
class EndpointHealth extends _i1.EndpointRef {
  EndpointHealth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'health';

  _i2.Future<_i16.ServerHealth> ping() =>
      caller.callServerEndpoint<_i16.ServerHealth>(
        'health',
        'ping',
        {},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i17.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    auth = EndpointAuth(this);
    dev = EndpointDev(this);
    directory = EndpointDirectory(this);
    profile = EndpointProfile(this);
    rides = EndpointRides(this);
    routes = EndpointRoutes(this);
    health = EndpointHealth(this);
  }

  late final EndpointAuth auth;

  late final EndpointDev dev;

  late final EndpointDirectory directory;

  late final EndpointProfile profile;

  late final EndpointRides rides;

  late final EndpointRoutes routes;

  late final EndpointHealth health;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'auth': auth,
    'dev': dev,
    'directory': directory,
    'profile': profile,
    'rides': rides,
    'routes': routes,
    'health': health,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
