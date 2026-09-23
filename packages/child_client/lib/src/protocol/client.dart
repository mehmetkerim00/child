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
import 'package:child_client/src/protocol/chat_thread.dart' as _i4;
import 'package:child_client/src/protocol/chat_message.dart' as _i5;
import 'package:child_client/src/protocol/quick_phrase.dart' as _i6;
import 'package:child_client/src/protocol/family.dart' as _i7;
import 'package:child_client/src/protocol/parent.dart' as _i8;
import 'package:child_client/src/protocol/child.dart' as _i9;
import 'package:child_client/src/protocol/driver.dart' as _i10;
import 'package:child_client/src/protocol/institution.dart' as _i11;
import 'package:child_client/src/protocol/family_circle.dart' as _i12;
import 'package:child_client/src/protocol/circle_rank.dart' as _i13;
import 'package:child_client/src/protocol/route_template.dart' as _i14;
import 'package:child_client/src/protocol/ride_view.dart' as _i15;
import 'package:child_client/src/protocol/ride_event.dart' as _i16;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i17;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i18;
import 'package:child_client/src/protocol/cash_top_up.dart' as _i19;
import 'package:child_client/src/protocol/ledger_entry.dart' as _i20;
import 'package:child_client/src/protocol/balance_view.dart' as _i21;
import 'package:child_client/src/protocol/pool_candidate.dart' as _i22;
import 'package:child_client/src/protocol/ride.dart' as _i23;
import 'package:child_client/src/protocol/pool_capacity.dart' as _i24;
import 'package:child_client/src/protocol/ride_seat.dart' as _i25;
import 'package:child_client/src/protocol/institution_day_view.dart' as _i26;
import 'package:child_client/src/protocol/institution_access.dart' as _i27;
import 'package:child_client/src/protocol/ride_event_submission.dart' as _i28;
import 'package:child_client/src/protocol/tracking_state.dart' as _i29;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i30;
import 'package:child_client/src/protocol/ride_location.dart' as _i31;
import 'package:child_client/src/protocol/health/server_health.dart' as _i32;
import 'protocol.dart' as _i33;

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

/// Переписка внутри приложения: родитель ↔ водитель ↔ диспетчер.
///
/// Телефоны сторон нигде не отдаются наружу: у родителя есть только имя
/// водителя, у водителя — имя семьи. Экстренная связь идёт к диспетчеру.
/// {@category Endpoint}
class EndpointChat extends _i1.EndpointRef {
  EndpointChat(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chat';

  /// Разговор по поездке. Создаётся при первом обращении.
  _i2.Future<_i4.ChatThread> threadForRide(int rideId) =>
      caller.callServerEndpoint<_i4.ChatThread>(
        'chat',
        'threadForRide',
        {'rideId': rideId},
      );

  /// Общий разговор семьи (без привязки к поездке).
  _i2.Future<_i4.ChatThread> myThread() =>
      caller.callServerEndpoint<_i4.ChatThread>(
        'chat',
        'myThread',
        {},
      );

  /// Сообщения разговора.
  _i2.Future<List<_i5.ChatMessage>> messages(int threadId) =>
      caller.callServerEndpoint<List<_i5.ChatMessage>>(
        'chat',
        'messages',
        {'threadId': threadId},
      );

  /// Отправка сообщения: свободный текст или готовая фраза.
  _i2.Future<_i5.ChatMessage> send({
    required int threadId,
    required String clientMessageId,
    String? body,
    _i6.QuickPhrase? phrase,
  }) => caller.callServerEndpoint<_i5.ChatMessage>(
    'chat',
    'send',
    {
      'threadId': threadId,
      'clientMessageId': clientMessageId,
      'body': body,
      'phrase': phrase,
    },
  );

  /// Номер диспетчера для кнопки экстренной связи.
  ///
  /// Это единственный номер, который приложение показывает: родитель
  /// звонит диспетчеру, а не водителю.
  _i2.Future<String?> dispatcherPhone() => caller.callServerEndpoint<String?>(
    'chat',
    'dispatcherPhone',
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

  _i2.Future<List<_i7.Family>> families() =>
      caller.callServerEndpoint<List<_i7.Family>>(
        'directory',
        'families',
        {},
      );

  _i2.Future<_i7.Family> saveFamily(_i7.Family family) =>
      caller.callServerEndpoint<_i7.Family>(
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

  _i2.Future<List<_i8.Parent>> parents(int familyId) =>
      caller.callServerEndpoint<List<_i8.Parent>>(
        'directory',
        'parents',
        {'familyId': familyId},
      );

  _i2.Future<_i8.Parent> saveParent(_i8.Parent parent) =>
      caller.callServerEndpoint<_i8.Parent>(
        'directory',
        'saveParent',
        {'parent': parent},
      );

  _i2.Future<List<_i9.Child>> children({int? familyId}) =>
      caller.callServerEndpoint<List<_i9.Child>>(
        'directory',
        'children',
        {'familyId': familyId},
      );

  _i2.Future<_i9.Child> saveChild(_i9.Child child) =>
      caller.callServerEndpoint<_i9.Child>(
        'directory',
        'saveChild',
        {'child': child},
      );

  _i2.Future<void> deleteChild(int childId) => caller.callServerEndpoint<void>(
    'directory',
    'deleteChild',
    {'childId': childId},
  );

  _i2.Future<List<_i10.Driver>> drivers() =>
      caller.callServerEndpoint<List<_i10.Driver>>(
        'directory',
        'drivers',
        {},
      );

  _i2.Future<_i10.Driver> saveDriver(_i10.Driver driver) =>
      caller.callServerEndpoint<_i10.Driver>(
        'directory',
        'saveDriver',
        {'driver': driver},
      );

  _i2.Future<List<_i11.Institution>> institutions() =>
      caller.callServerEndpoint<List<_i11.Institution>>(
        'directory',
        'institutions',
        {},
      );

  _i2.Future<_i11.Institution> saveInstitution(_i11.Institution institution) =>
      caller.callServerEndpoint<_i11.Institution>(
        'directory',
        'saveInstitution',
        {'institution': institution},
      );

  _i2.Future<List<_i12.FamilyCircle>> circle(int familyId) =>
      caller.callServerEndpoint<List<_i12.FamilyCircle>>(
        'directory',
        'circle',
        {'familyId': familyId},
      );

  /// Назначает водителя на место в круге семьи (постоянный/резервный).
  _i2.Future<_i12.FamilyCircle> assignDriver({
    required int familyId,
    required int driverId,
    required _i13.CircleRank rank,
  }) => caller.callServerEndpoint<_i12.FamilyCircle>(
    'directory',
    'assignDriver',
    {
      'familyId': familyId,
      'driverId': driverId,
      'rank': rank,
    },
  );

  /// Все шаблоны маршрутов.
  _i2.Future<List<_i14.RouteTemplate>> routes() =>
      caller.callServerEndpoint<List<_i14.RouteTemplate>>(
        'directory',
        'routes',
        {},
      );

  /// Заявки родителей, ожидающие активации.
  _i2.Future<List<_i14.RouteTemplate>> pendingRoutes() =>
      caller.callServerEndpoint<List<_i14.RouteTemplate>>(
        'directory',
        'pendingRoutes',
        {},
      );

  /// Активация заявки: назначаем водителя и цену, сразу создаём поездки
  /// на сегодня и завтра.
  _i2.Future<_i14.RouteTemplate> activateRoute({
    required int routeId,
    required int driverId,
    required int pricePerRideTenge,
  }) => caller.callServerEndpoint<_i14.RouteTemplate>(
    'directory',
    'activateRoute',
    {
      'routeId': routeId,
      'driverId': driverId,
      'pricePerRideTenge': pricePerRideTenge,
    },
  );

  /// Отключение маршрута: новые поездки по нему не создаются.
  _i2.Future<_i14.RouteTemplate> deactivateRoute(int routeId) =>
      caller.callServerEndpoint<_i14.RouteTemplate>(
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
  _i2.Future<List<_i15.RideView>> ridesForDate({DateTime? date}) =>
      caller.callServerEndpoint<List<_i15.RideView>>(
        'directory',
        'ridesForDate',
        {'date': date},
      );

  /// События поездки — лента для разбора проблем.
  _i2.Future<List<_i16.RideEvent>> rideEvents(int rideId) =>
      caller.callServerEndpoint<List<_i16.RideEvent>>(
        'directory',
        'rideEvents',
        {'rideId': rideId},
      );

  /// Открытые задачи: то, что требует звонка или решения человека.
  _i2.Future<List<_i17.DispatcherTask>> openTasks() =>
      caller.callServerEndpoint<List<_i17.DispatcherTask>>(
        'directory',
        'openTasks',
        {},
      );

  /// Задача решена — диспетчер закрывает её вручную.
  _i2.Future<_i17.DispatcherTask?> resolveTask(int taskId) =>
      caller.callServerEndpoint<_i17.DispatcherTask?>(
        'directory',
        'resolveTask',
        {'taskId': taskId},
      );

  /// Очередь уведомлений — видно, что ушло, что ждёт и что не доставлено.
  _i2.Future<List<_i18.NotificationOutbox>> notifications() =>
      caller.callServerEndpoint<List<_i18.NotificationOutbox>>(
        'directory',
        'notifications',
        {},
      );

  /// Ручная отправка SMS из консоли диспетчера.
  _i2.Future<_i18.NotificationOutbox?> sendManualSms({
    required String phone,
    required String body,
  }) => caller.callServerEndpoint<_i18.NotificationOutbox?>(
    'directory',
    'sendManualSms',
    {
      'phone': phone,
      'body': body,
    },
  );

  /// Приёмы наличных, ожидающие подтверждения.
  _i2.Future<List<_i19.CashTopUp>> pendingTopUps() =>
      caller.callServerEndpoint<List<_i19.CashTopUp>>(
        'directory',
        'pendingTopUps',
        {},
      );

  /// Подтверждение приёма наличных: деньги попадают в книгу операций.
  _i2.Future<_i20.LedgerEntry?> confirmTopUp(int topUpId) =>
      caller.callServerEndpoint<_i20.LedgerEntry?>(
        'directory',
        'confirmTopUp',
        {'topUpId': topUpId},
      );

  /// Отказ: денег не было или сумма неверна.
  _i2.Future<_i19.CashTopUp> rejectTopUp({
    required int topUpId,
    required String reason,
  }) => caller.callServerEndpoint<_i19.CashTopUp>(
    'directory',
    'rejectTopUp',
    {
      'topUpId': topUpId,
      'reason': reason,
    },
  );

  /// Корректировка баланса — только новой записью и только с причиной.
  _i2.Future<_i20.LedgerEntry?> adjustBalance({
    required int familyId,
    required int amountTenge,
    required String reason,
  }) => caller.callServerEndpoint<_i20.LedgerEntry?>(
    'directory',
    'adjustBalance',
    {
      'familyId': familyId,
      'amountTenge': amountTenge,
      'reason': reason,
    },
  );

  /// Баланс конкретной семьи для панели диспетчера.
  _i2.Future<_i21.BalanceView> familyBalance(int familyId) =>
      caller.callServerEndpoint<_i21.BalanceView>(
        'directory',
        'familyBalance',
        {'familyId': familyId},
      );

  /// Поездки, которые можно объединить с этой в одну машину.
  ///
  /// Совместимость: тот же день, то же учреждение и близкое время подачи.
  /// Дальше диспетчер смотрит адреса и решает сам — алгоритм не должен
  /// решать за человека, кого посадить с кем.
  _i2.Future<List<_i22.PoolCandidate>> poolCandidates(
    int rideId, {
    required int maxTimeDiffMinutes,
  }) => caller.callServerEndpoint<List<_i22.PoolCandidate>>(
    'directory',
    'poolCandidates',
    {
      'rideId': rideId,
      'maxTimeDiffMinutes': maxTimeDiffMinutes,
    },
  );

  /// Объединяет поездку в пул: дети из [rideIds] пересаживаются в [rideId].
  ///
  /// Проверяет вместимость машины и детские кресла — в пул нельзя посадить
  /// больше детей, чем поместится.
  _i2.Future<_i23.Ride> mergeIntoPool({
    required int rideId,
    required List<int> rideIds,
  }) => caller.callServerEndpoint<_i23.Ride>(
    'directory',
    'mergeIntoPool',
    {
      'rideId': rideId,
      'rideIds': rideIds,
    },
  );

  /// Свободные места в машине на этой поездке.
  _i2.Future<_i24.PoolCapacity> poolCapacity(int rideId) =>
      caller.callServerEndpoint<_i24.PoolCapacity>(
        'directory',
        'poolCapacity',
        {'rideId': rideId},
      );

  /// Места поездки — кто именно едет.
  _i2.Future<List<_i25.RideSeat>> rideSeats(int rideId) =>
      caller.callServerEndpoint<List<_i25.RideSeat>>(
        'directory',
        'rideSeats',
        {'rideId': rideId},
      );
}

/// Кабинет учреждения: работает по ссылке, без входа и установки.
///
/// Воспитателю не нужен аккаунт — у него ссылка с токеном. Поэтому
/// эндпоинт открытый, а доступ проверяется по самому токену.
/// {@category Endpoint}
class EndpointInstitution extends _i1.EndpointRef {
  EndpointInstitution(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'institution';

  /// Список детей на сегодня по ссылке доступа.
  _i2.Future<_i26.InstitutionDayView?> dayView(
    String token, {
    DateTime? date,
  }) => caller.callServerEndpoint<_i26.InstitutionDayView?>(
    'institution',
    'dayView',
    {
      'token': token,
      'date': date,
    },
  );

  /// «Принял(а)» — независимое подтверждение передачи ребёнка.
  _i2.Future<bool> confirmArrival({
    required String token,
    required int rideId,
    required int childId,
    required String confirmedBy,
  }) => caller.callServerEndpoint<bool>(
    'institution',
    'confirmArrival',
    {
      'token': token,
      'rideId': rideId,
      'childId': childId,
      'confirmedBy': confirmedBy,
    },
  );
}

/// Управление доступами учреждений — только для диспетчера.
/// {@category Endpoint}
class EndpointInstitutionAdmin extends _i1.EndpointRef {
  EndpointInstitutionAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'institutionAdmin';

  /// Выдаёт ссылку для учреждения. Токен показывается один раз.
  _i2.Future<String> issueAccess({
    required int institutionId,
    required String issuedTo,
  }) => caller.callServerEndpoint<String>(
    'institutionAdmin',
    'issueAccess',
    {
      'institutionId': institutionId,
      'issuedTo': issuedTo,
    },
  );

  /// Выданные ссылки учреждения.
  _i2.Future<List<_i27.InstitutionAccess>> accesses(int institutionId) =>
      caller.callServerEndpoint<List<_i27.InstitutionAccess>>(
        'institutionAdmin',
        'accesses',
        {'institutionId': institutionId},
      );

  /// Отзывает ссылку.
  _i2.Future<void> revokeAccess(int accessId) =>
      caller.callServerEndpoint<void>(
        'institutionAdmin',
        'revokeAccess',
        {'accessId': accessId},
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
  _i2.Future<_i7.Family?> myFamily() => caller.callServerEndpoint<_i7.Family?>(
    'profile',
    'myFamily',
    {},
  );

  /// Дети вошедшего родителя.
  _i2.Future<List<_i9.Child>> myChildren() =>
      caller.callServerEndpoint<List<_i9.Child>>(
        'profile',
        'myChildren',
        {},
      );

  /// Водители из «круга семьи»: постоянный и резервные.
  _i2.Future<List<_i10.Driver>> myDrivers() =>
      caller.callServerEndpoint<List<_i10.Driver>>(
        'profile',
        'myDrivers',
        {},
      );

  /// Профиль вошедшего водителя.
  _i2.Future<_i10.Driver?> myDriverProfile() =>
      caller.callServerEndpoint<_i10.Driver?>(
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
  _i2.Future<List<_i15.RideView>> today() =>
      caller.callServerEndpoint<List<_i15.RideView>>(
        'rides',
        'today',
        {},
      );

  /// Поездки водителя на завтра — экран подтверждения.
  _i2.Future<List<_i15.RideView>> tomorrow() =>
      caller.callServerEndpoint<List<_i15.RideView>>(
        'rides',
        'tomorrow',
        {},
      );

  /// Водитель подтверждает поездку: «завтра выйду».
  _i2.Future<_i23.Ride> confirm(int rideId) =>
      caller.callServerEndpoint<_i23.Ride>(
        'rides',
        'confirm',
        {'rideId': rideId},
      );

  /// Водитель не может выйти: причина обязательна и уходит диспетчеру.
  _i2.Future<_i23.Ride> decline(
    int rideId,
    String reason,
  ) => caller.callServerEndpoint<_i23.Ride>(
    'rides',
    'decline',
    {
      'rideId': rideId,
      'reason': reason,
    },
  );

  /// Принимает событие этапа поездки: «Выехал», «Забрал», «Передал» и так
  /// далее. Работает и для событий из офлайн-очереди, отправленных позже.
  _i2.Future<_i23.Ride> submitEvent(
    int rideId,
    _i28.RideEventSubmission submission,
  ) => caller.callServerEndpoint<_i23.Ride>(
    'rides',
    'submitEvent',
    {
      'rideId': rideId,
      'submission': submission,
    },
  );

  /// Дети в машине на этой поездке: порядок посадки и кто уже передан.
  _i2.Future<List<_i25.RideSeat>> rideSeats(int rideId) =>
      caller.callServerEndpoint<List<_i25.RideSeat>>(
        'rides',
        'rideSeats',
        {'rideId': rideId},
      );

  /// Приём точек трека от приложения водителя.
  ///
  /// Сервер сам решает, можно ли писать геолокацию: вне активной поездки
  /// точки отбрасываются и приложению возвращается запрет.
  _i2.Future<_i29.TrackingState> pushLocations(
    int rideId,
    List<_i30.RideLocationPoint> points,
  ) => caller.callServerEndpoint<_i29.TrackingState>(
    'rides',
    'pushLocations',
    {
      'rideId': rideId,
      'points': points,
    },
  );

  /// События поездки — лента для водителя.
  _i2.Future<List<_i16.RideEvent>> events(int rideId) =>
      caller.callServerEndpoint<List<_i16.RideEvent>>(
        'rides',
        'events',
        {'rideId': rideId},
      );

  /// Семьи из «круга» водителя — кому он может принять наличные.
  _i2.Future<List<_i7.Family>> myFamilies() =>
      caller.callServerEndpoint<List<_i7.Family>>(
        'rides',
        'myFamilies',
        {},
      );

  /// Водитель принял наличные от родителя.
  ///
  /// Это ещё не зачисление: деньги попадут в книгу операций после
  /// подтверждения диспетчером.
  _i2.Future<_i19.CashTopUp> recordCashTopUp({
    required int familyId,
    required int amountTenge,
    required bool hasSignature,
    String? note,
  }) => caller.callServerEndpoint<_i19.CashTopUp>(
    'rides',
    'recordCashTopUp',
    {
      'familyId': familyId,
      'amountTenge': amountTenge,
      'hasSignature': hasSignature,
      'note': note,
    },
  );

  /// Пополнения, которые водитель принял за последние дни.
  _i2.Future<List<_i19.CashTopUp>> myCashTopUps() =>
      caller.callServerEndpoint<List<_i19.CashTopUp>>(
        'rides',
        'myCashTopUps',
        {},
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
  _i2.Future<_i14.RouteTemplate> requestRoute(_i14.RouteTemplate draft) =>
      caller.callServerEndpoint<_i14.RouteTemplate>(
        'routes',
        'requestRoute',
        {'draft': draft},
      );

  /// Маршруты детей вошедшего родителя.
  _i2.Future<List<_i14.RouteTemplate>> myRoutes() =>
      caller.callServerEndpoint<List<_i14.RouteTemplate>>(
        'routes',
        'myRoutes',
        {},
      );

  /// События поездки своего ребёнка — лента «что происходило».
  _i2.Future<List<_i16.RideEvent>> rideEvents(int rideId) =>
      caller.callServerEndpoint<List<_i16.RideEvent>>(
        'routes',
        'rideEvents',
        {'rideId': rideId},
      );

  /// Трек поездки ребёнка: путь, который уже проехали.
  _i2.Future<List<_i31.RideLocation>> rideTrack(int rideId) =>
      caller.callServerEndpoint<List<_i31.RideLocation>>(
        'routes',
        'rideTrack',
        {'rideId': rideId},
      );

  /// Положение машины в реальном времени (WebSocket).
  ///
  /// Поток живёт, пока открыт экран поездки: родитель видит машину,
  /// пока она едет.
  _i2.Stream<_i31.RideLocation> watchRideLocation(int rideId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i31.RideLocation>,
        _i31.RideLocation
      >(
        'routes',
        'watchRideLocation',
        {'rideId': rideId},
        {},
      );

  /// Баланс семьи: остаток, ожидающие пополнения и история операций.
  _i2.Future<_i21.BalanceView> myBalance() =>
      caller.callServerEndpoint<_i21.BalanceView>(
        'routes',
        'myBalance',
        {},
      );

  /// «Сегодня не едем»: родитель предупреждает заранее.
  ///
  /// Водитель и учреждение видят это сразу, поездка не срывается молча.
  _i2.Future<bool> declareAbsence({
    required int rideId,
    required int childId,
    required String reason,
  }) => caller.callServerEndpoint<bool>(
    'routes',
    'declareAbsence',
    {
      'rideId': rideId,
      'childId': childId,
      'reason': reason,
    },
  );

  /// Лента уведомлений семьи: что и когда отправляли.
  _i2.Future<List<_i18.NotificationOutbox>> myNotifications() =>
      caller.callServerEndpoint<List<_i18.NotificationOutbox>>(
        'routes',
        'myNotifications',
        {},
      );

  /// Приложение подтверждает получение push: SMS по этому событию
  /// больше не нужна.
  _i2.Future<void> ackNotification(int outboxId) =>
      caller.callServerEndpoint<void>(
        'routes',
        'ackNotification',
        {'outboxId': outboxId},
      );

  /// Учреждения — родитель выбирает, куда возить ребёнка.
  _i2.Future<List<_i11.Institution>> institutions() =>
      caller.callServerEndpoint<List<_i11.Institution>>(
        'routes',
        'institutions',
        {},
      );

  /// Поездки детей семьи на сегодня и завтра (по Ашхабаду).
  _i2.Future<List<_i15.RideView>> myUpcomingRides() =>
      caller.callServerEndpoint<List<_i15.RideView>>(
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

  _i2.Future<_i32.ServerHealth> ping() =>
      caller.callServerEndpoint<_i32.ServerHealth>(
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
         _i33.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    auth = EndpointAuth(this);
    chat = EndpointChat(this);
    dev = EndpointDev(this);
    directory = EndpointDirectory(this);
    institution = EndpointInstitution(this);
    institutionAdmin = EndpointInstitutionAdmin(this);
    profile = EndpointProfile(this);
    rides = EndpointRides(this);
    routes = EndpointRoutes(this);
    health = EndpointHealth(this);
  }

  late final EndpointAuth auth;

  late final EndpointChat chat;

  late final EndpointDev dev;

  late final EndpointDirectory directory;

  late final EndpointInstitution institution;

  late final EndpointInstitutionAdmin institutionAdmin;

  late final EndpointProfile profile;

  late final EndpointRides rides;

  late final EndpointRoutes routes;

  late final EndpointHealth health;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'auth': auth,
    'chat': chat,
    'dev': dev,
    'directory': directory,
    'institution': institution,
    'institutionAdmin': institutionAdmin,
    'profile': profile,
    'rides': rides,
    'routes': routes,
    'health': health,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
