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
import 'package:child_client/src/protocol/load_fixture.dart' as _i7;
import 'package:child_client/src/protocol/load_result.dart' as _i8;
import 'package:child_client/src/protocol/family.dart' as _i9;
import 'package:child_client/src/protocol/parent.dart' as _i10;
import 'package:child_client/src/protocol/child.dart' as _i11;
import 'package:child_client/src/protocol/driver.dart' as _i12;
import 'package:child_client/src/protocol/institution.dart' as _i13;
import 'package:child_client/src/protocol/family_circle.dart' as _i14;
import 'package:child_client/src/protocol/circle_rank.dart' as _i15;
import 'package:child_client/src/protocol/route_template.dart' as _i16;
import 'package:child_client/src/protocol/ride_view.dart' as _i17;
import 'package:child_client/src/protocol/ride_event.dart' as _i18;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i19;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i20;
import 'package:child_client/src/protocol/cash_top_up.dart' as _i21;
import 'package:child_client/src/protocol/ledger_entry.dart' as _i22;
import 'package:child_client/src/protocol/balance_view.dart' as _i23;
import 'package:child_client/src/protocol/pool_candidate.dart' as _i24;
import 'package:child_client/src/protocol/ride.dart' as _i25;
import 'package:child_client/src/protocol/pool_capacity.dart' as _i26;
import 'package:child_client/src/protocol/ride_seat.dart' as _i27;
import 'package:child_client/src/protocol/driver_application.dart' as _i28;
import 'package:child_client/src/protocol/application_status.dart' as _i29;
import 'package:child_client/src/protocol/application_check.dart' as _i30;
import 'package:child_client/src/protocol/check_kind.dart' as _i31;
import 'package:child_client/src/protocol/payout_period.dart' as _i32;
import 'package:child_client/src/protocol/incident.dart' as _i33;
import 'package:child_client/src/protocol/incident_severity.dart' as _i34;
import 'package:child_client/src/protocol/training_result.dart' as _i35;
import 'package:child_client/src/protocol/institution_day_view.dart' as _i36;
import 'package:child_client/src/protocol/institution_access.dart' as _i37;
import 'package:child_client/src/protocol/owner_report.dart' as _i38;
import 'package:child_client/src/protocol/system_health.dart' as _i39;
import 'package:child_client/src/protocol/family_balance_row.dart' as _i40;
import 'package:child_client/src/protocol/ride_event_submission.dart' as _i41;
import 'package:child_client/src/protocol/tracking_state.dart' as _i42;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i43;
import 'package:child_client/src/protocol/ride_location.dart' as _i44;
import 'package:child_client/src/protocol/health/server_health.dart' as _i45;
import 'protocol.dart' as _i46;

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

  /// Засевает данные для нагрузочного прогона: водителей с поездками на
  /// сегодня и токенами сессий.
  ///
  /// Нужен, чтобы мерить нагрузку на боевом пути — водитель отмечает
  /// этапы, сервер пишет событие, двигает статус, списывает деньги и
  /// ставит уведомления в очередь.
  _i2.Future<_i7.LoadFixture> seedLoad({
    required int drivers,
    required int ridesPerDriver,
  }) => caller.callServerEndpoint<_i7.LoadFixture>(
    'dev',
    'seedLoad',
    {
      'drivers': drivers,
      'ridesPerDriver': ridesPerDriver,
    },
  );

  /// Сколько поездок нагрузочного прогона доведено до конца.
  _i2.Future<_i8.LoadResult> loadResult() =>
      caller.callServerEndpoint<_i8.LoadResult>(
        'dev',
        'loadResult',
        {},
      );

  /// Убирает за нагрузочным прогоном. Возвращает число удалённых семей.
  _i2.Future<int> cleanupLoad() => caller.callServerEndpoint<int>(
    'dev',
    'cleanupLoad',
    {},
  );

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

  _i2.Future<List<_i9.Family>> families() =>
      caller.callServerEndpoint<List<_i9.Family>>(
        'directory',
        'families',
        {},
      );

  _i2.Future<_i9.Family> saveFamily(_i9.Family family) =>
      caller.callServerEndpoint<_i9.Family>(
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

  _i2.Future<List<_i10.Parent>> parents(int familyId) =>
      caller.callServerEndpoint<List<_i10.Parent>>(
        'directory',
        'parents',
        {'familyId': familyId},
      );

  _i2.Future<_i10.Parent> saveParent(_i10.Parent parent) =>
      caller.callServerEndpoint<_i10.Parent>(
        'directory',
        'saveParent',
        {'parent': parent},
      );

  _i2.Future<List<_i11.Child>> children({int? familyId}) =>
      caller.callServerEndpoint<List<_i11.Child>>(
        'directory',
        'children',
        {'familyId': familyId},
      );

  _i2.Future<_i11.Child> saveChild(_i11.Child child) =>
      caller.callServerEndpoint<_i11.Child>(
        'directory',
        'saveChild',
        {'child': child},
      );

  _i2.Future<void> deleteChild(int childId) => caller.callServerEndpoint<void>(
    'directory',
    'deleteChild',
    {'childId': childId},
  );

  _i2.Future<List<_i12.Driver>> drivers() =>
      caller.callServerEndpoint<List<_i12.Driver>>(
        'directory',
        'drivers',
        {},
      );

  _i2.Future<_i12.Driver> saveDriver(_i12.Driver driver) =>
      caller.callServerEndpoint<_i12.Driver>(
        'directory',
        'saveDriver',
        {'driver': driver},
      );

  _i2.Future<List<_i13.Institution>> institutions() =>
      caller.callServerEndpoint<List<_i13.Institution>>(
        'directory',
        'institutions',
        {},
      );

  _i2.Future<_i13.Institution> saveInstitution(_i13.Institution institution) =>
      caller.callServerEndpoint<_i13.Institution>(
        'directory',
        'saveInstitution',
        {'institution': institution},
      );

  _i2.Future<List<_i14.FamilyCircle>> circle(int familyId) =>
      caller.callServerEndpoint<List<_i14.FamilyCircle>>(
        'directory',
        'circle',
        {'familyId': familyId},
      );

  /// Назначает водителя на место в круге семьи (постоянный/резервный).
  _i2.Future<_i14.FamilyCircle> assignDriver({
    required int familyId,
    required int driverId,
    required _i15.CircleRank rank,
  }) => caller.callServerEndpoint<_i14.FamilyCircle>(
    'directory',
    'assignDriver',
    {
      'familyId': familyId,
      'driverId': driverId,
      'rank': rank,
    },
  );

  /// Все шаблоны маршрутов.
  _i2.Future<List<_i16.RouteTemplate>> routes() =>
      caller.callServerEndpoint<List<_i16.RouteTemplate>>(
        'directory',
        'routes',
        {},
      );

  /// Заявки родителей, ожидающие активации.
  _i2.Future<List<_i16.RouteTemplate>> pendingRoutes() =>
      caller.callServerEndpoint<List<_i16.RouteTemplate>>(
        'directory',
        'pendingRoutes',
        {},
      );

  /// Активация заявки: назначаем водителя и цену, сразу создаём поездки
  /// на сегодня и завтра.
  _i2.Future<_i16.RouteTemplate> activateRoute({
    required int routeId,
    required int driverId,
    required int pricePerRideTenge,
  }) => caller.callServerEndpoint<_i16.RouteTemplate>(
    'directory',
    'activateRoute',
    {
      'routeId': routeId,
      'driverId': driverId,
      'pricePerRideTenge': pricePerRideTenge,
    },
  );

  /// Отключение маршрута: новые поездки по нему не создаются.
  _i2.Future<_i16.RouteTemplate> deactivateRoute(int routeId) =>
      caller.callServerEndpoint<_i16.RouteTemplate>(
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
  _i2.Future<List<_i17.RideView>> ridesForDate({DateTime? date}) =>
      caller.callServerEndpoint<List<_i17.RideView>>(
        'directory',
        'ridesForDate',
        {'date': date},
      );

  /// События поездки — лента для разбора проблем.
  _i2.Future<List<_i18.RideEvent>> rideEvents(int rideId) =>
      caller.callServerEndpoint<List<_i18.RideEvent>>(
        'directory',
        'rideEvents',
        {'rideId': rideId},
      );

  /// Открытые задачи: то, что требует звонка или решения человека.
  _i2.Future<List<_i19.DispatcherTask>> openTasks() =>
      caller.callServerEndpoint<List<_i19.DispatcherTask>>(
        'directory',
        'openTasks',
        {},
      );

  /// Задача решена — диспетчер закрывает её вручную.
  _i2.Future<_i19.DispatcherTask?> resolveTask(int taskId) =>
      caller.callServerEndpoint<_i19.DispatcherTask?>(
        'directory',
        'resolveTask',
        {'taskId': taskId},
      );

  /// Очередь уведомлений — видно, что ушло, что ждёт и что не доставлено.
  _i2.Future<List<_i20.NotificationOutbox>> notifications() =>
      caller.callServerEndpoint<List<_i20.NotificationOutbox>>(
        'directory',
        'notifications',
        {},
      );

  /// Ручная отправка SMS из консоли диспетчера.
  _i2.Future<_i20.NotificationOutbox?> sendManualSms({
    required String phone,
    required String body,
  }) => caller.callServerEndpoint<_i20.NotificationOutbox?>(
    'directory',
    'sendManualSms',
    {
      'phone': phone,
      'body': body,
    },
  );

  /// Приёмы наличных, ожидающие подтверждения.
  _i2.Future<List<_i21.CashTopUp>> pendingTopUps() =>
      caller.callServerEndpoint<List<_i21.CashTopUp>>(
        'directory',
        'pendingTopUps',
        {},
      );

  /// Подтверждение приёма наличных: деньги попадают в книгу операций.
  _i2.Future<_i22.LedgerEntry?> confirmTopUp(int topUpId) =>
      caller.callServerEndpoint<_i22.LedgerEntry?>(
        'directory',
        'confirmTopUp',
        {'topUpId': topUpId},
      );

  /// Отказ: денег не было или сумма неверна.
  _i2.Future<_i21.CashTopUp> rejectTopUp({
    required int topUpId,
    required String reason,
  }) => caller.callServerEndpoint<_i21.CashTopUp>(
    'directory',
    'rejectTopUp',
    {
      'topUpId': topUpId,
      'reason': reason,
    },
  );

  /// Корректировка баланса — только новой записью и только с причиной.
  _i2.Future<_i22.LedgerEntry?> adjustBalance({
    required int familyId,
    required int amountTenge,
    required String reason,
  }) => caller.callServerEndpoint<_i22.LedgerEntry?>(
    'directory',
    'adjustBalance',
    {
      'familyId': familyId,
      'amountTenge': amountTenge,
      'reason': reason,
    },
  );

  /// Баланс конкретной семьи для панели диспетчера.
  _i2.Future<_i23.BalanceView> familyBalance(int familyId) =>
      caller.callServerEndpoint<_i23.BalanceView>(
        'directory',
        'familyBalance',
        {'familyId': familyId},
      );

  /// Поездки, которые можно объединить с этой в одну машину.
  ///
  /// Совместимость: тот же день, то же учреждение и близкое время подачи.
  /// Дальше диспетчер смотрит адреса и решает сам — алгоритм не должен
  /// решать за человека, кого посадить с кем.
  _i2.Future<List<_i24.PoolCandidate>> poolCandidates(
    int rideId, {
    required int maxTimeDiffMinutes,
  }) => caller.callServerEndpoint<List<_i24.PoolCandidate>>(
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
  _i2.Future<_i25.Ride> mergeIntoPool({
    required int rideId,
    required List<int> rideIds,
  }) => caller.callServerEndpoint<_i25.Ride>(
    'directory',
    'mergeIntoPool',
    {
      'rideId': rideId,
      'rideIds': rideIds,
    },
  );

  /// Свободные места в машине на этой поездке.
  _i2.Future<_i26.PoolCapacity> poolCapacity(int rideId) =>
      caller.callServerEndpoint<_i26.PoolCapacity>(
        'directory',
        'poolCapacity',
        {'rideId': rideId},
      );

  /// Места поездки — кто именно едет.
  _i2.Future<List<_i27.RideSeat>> rideSeats(int rideId) =>
      caller.callServerEndpoint<List<_i27.RideSeat>>(
        'directory',
        'rideSeats',
        {'rideId': rideId},
      );
}

/// Приём анкет кандидатов — открытый эндпоинт.
///
/// Кандидат заполняет анкету с телефона: аккаунта у него ещё нет.
/// {@category Endpoint}
class EndpointDriverApplication extends _i1.EndpointRef {
  EndpointDriverApplication(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'driverApplication';

  /// Подать анкету.
  _i2.Future<_i28.DriverApplication> submit(
    _i28.DriverApplication application,
  ) => caller.callServerEndpoint<_i28.DriverApplication>(
    'driverApplication',
    'submit',
    {'application': application},
  );
}

/// Конвейер найма и работа с водителями — только диспетчер.
/// {@category Endpoint}
class EndpointHiring extends _i1.EndpointRef {
  EndpointHiring(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'hiring';

  /// Анкеты по этапам.
  _i2.Future<List<_i28.DriverApplication>> applications({
    _i29.ApplicationStatus? status,
  }) => caller.callServerEndpoint<List<_i28.DriverApplication>>(
    'hiring',
    'applications',
    {'status': status},
  );

  /// Чек-лист проверки кандидата.
  _i2.Future<List<_i30.ApplicationCheck>> checks(int applicationId) =>
      caller.callServerEndpoint<List<_i30.ApplicationCheck>>(
        'hiring',
        'checks',
        {'applicationId': applicationId},
      );

  /// Отметить пункт чек-листа.
  _i2.Future<_i30.ApplicationCheck> setCheck({
    required int applicationId,
    required _i31.CheckKind kind,
    required bool passed,
    String? note,
  }) => caller.callServerEndpoint<_i30.ApplicationCheck>(
    'hiring',
    'setCheck',
    {
      'applicationId': applicationId,
      'kind': kind,
      'passed': passed,
      'note': note,
    },
  );

  /// Перевести кандидата на другой этап.
  _i2.Future<_i28.DriverApplication> setStatus({
    required int applicationId,
    required _i29.ApplicationStatus status,
    String? rejectedReason,
  }) => caller.callServerEndpoint<_i28.DriverApplication>(
    'hiring',
    'setStatus',
    {
      'applicationId': applicationId,
      'status': status,
      'rejectedReason': rejectedReason,
    },
  );

  /// Нанять: создать аккаунт водителя из анкеты.
  _i2.Future<_i12.Driver> hire(int applicationId) =>
      caller.callServerEndpoint<_i12.Driver>(
        'hiring',
        'hire',
        {'applicationId': applicationId},
      );

  /// Готов ли водитель к работе: сдан ли тест после обучения.
  _i2.Future<bool> trainingPassed(int driverId) =>
      caller.callServerEndpoint<bool>(
        'hiring',
        'trainingPassed',
        {'driverId': driverId},
      );

  /// Расчёт водителю за период.
  _i2.Future<_i32.PayoutPeriod> calculatePayout({
    required int driverId,
    required DateTime fromDate,
    required DateTime toDate,
    required int blockPayTenge,
    required int perRideTenge,
  }) => caller.callServerEndpoint<_i32.PayoutPeriod>(
    'hiring',
    'calculatePayout',
    {
      'driverId': driverId,
      'fromDate': fromDate,
      'toDate': toDate,
      'blockPayTenge': blockPayTenge,
      'perRideTenge': perRideTenge,
    },
  );

  /// Расчёты за периоды — для выгрузки на выплату.
  _i2.Future<List<_i32.PayoutPeriod>> payouts({int? driverId}) =>
      caller.callServerEndpoint<List<_i32.PayoutPeriod>>(
        'hiring',
        'payouts',
        {'driverId': driverId},
      );

  /// Отметить выплату произведённой.
  _i2.Future<_i32.PayoutPeriod?> markPaid(int payoutId) =>
      caller.callServerEndpoint<_i32.PayoutPeriod?>(
        'hiring',
        'markPaid',
        {'payoutId': payoutId},
      );

  /// Журнал инцидентов.
  _i2.Future<List<_i33.Incident>> incidents({int? driverId}) =>
      caller.callServerEndpoint<List<_i33.Incident>>(
        'hiring',
        'incidents',
        {'driverId': driverId},
      );

  /// Зафиксировать инцидент.
  _i2.Future<_i33.Incident> logIncident({
    required _i34.IncidentSeverity severity,
    required String description,
    int? driverId,
    int? rideId,
    int? familyId,
  }) => caller.callServerEndpoint<_i33.Incident>(
    'hiring',
    'logIncident',
    {
      'severity': severity,
      'description': description,
      'driverId': driverId,
      'rideId': rideId,
      'familyId': familyId,
    },
  );

  /// Закрыть инцидент решением.
  _i2.Future<_i33.Incident> resolveIncident({
    required int incidentId,
    required String resolution,
  }) => caller.callServerEndpoint<_i33.Incident>(
    'hiring',
    'resolveIncident',
    {
      'incidentId': incidentId,
      'resolution': resolution,
    },
  );
}

/// Обучение в приложении водителя.
/// {@category Endpoint}
class EndpointTraining extends _i1.EndpointRef {
  EndpointTraining(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'training';

  /// Сдан ли тест — от этого зависит назначение маршрутов.
  _i2.Future<bool> myTrainingPassed() => caller.callServerEndpoint<bool>(
    'training',
    'myTrainingPassed',
    {},
  );

  /// Мои попытки теста.
  _i2.Future<List<_i35.TrainingResult>> myResults() =>
      caller.callServerEndpoint<List<_i35.TrainingResult>>(
        'training',
        'myResults',
        {},
      );

  /// Записать результат теста.
  _i2.Future<_i35.TrainingResult> submitTest({
    required int correct,
    required int total,
  }) => caller.callServerEndpoint<_i35.TrainingResult>(
    'training',
    'submitTest',
    {
      'correct': correct,
      'total': total,
    },
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
  _i2.Future<_i36.InstitutionDayView?> dayView(
    String token, {
    DateTime? date,
  }) => caller.callServerEndpoint<_i36.InstitutionDayView?>(
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
  _i2.Future<List<_i37.InstitutionAccess>> accesses(int institutionId) =>
      caller.callServerEndpoint<List<_i37.InstitutionAccess>>(
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

/// Отчёты владельцу.
///
/// Роль отдельная от диспетчера: диспетчер управляет поездками и не видит
/// выручку, владелец видит деньги и не трогает чужой рабочий день.
/// {@category Endpoint}
class EndpointOwner extends _i1.EndpointRef {
  EndpointOwner(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'owner';

  /// Отчёт за период.
  _i2.Future<_i38.OwnerReport> report({
    required DateTime fromDate,
    required DateTime toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
  }) => caller.callServerEndpoint<_i38.OwnerReport>(
    'owner',
    'report',
    {
      'fromDate': fromDate,
      'toDate': toDate,
      'smsPriceTenge': smsPriceTenge,
      'blockPayTenge': blockPayTenge,
      'perRideTenge': perRideTenge,
    },
  );

  /// Отчёт за сегодня — то, что владелец открывает чаще всего.
  _i2.Future<_i38.OwnerReport> today() =>
      caller.callServerEndpoint<_i38.OwnerReport>(
        'owner',
        'today',
        {},
      );

  /// Одноразовая ссылка на выгрузку в таблицу.
  ///
  /// Возвращает путь вида `/hasabat.csv?t=...`: его открывают на ноутбуке,
  /// где такие файлы и смотрят. Токен живёт 15 минут и сгорает после
  /// первого скачивания.
  _i2.Future<String> exportLink({
    required DateTime fromDate,
    required DateTime toDate,
    int? smsPriceTenge,
    int? blockPayTenge,
    int? perRideTenge,
  }) => caller.callServerEndpoint<String>(
    'owner',
    'exportLink',
    {
      'fromDate': fromDate,
      'toDate': toDate,
      'smsPriceTenge': smsPriceTenge,
      'blockPayTenge': blockPayTenge,
      'perRideTenge': perRideTenge,
    },
  );

  /// Состояние сервиса прямо сейчас.
  ///
  /// Те же цифры, по которым сервер сам поднимает тревогу: владелец
  /// должен видеть их без звонка разработчику.
  _i2.Future<_i39.SystemHealth> systemHealth() =>
      caller.callServerEndpoint<_i39.SystemHealth>(
        'owner',
        'systemHealth',
        {},
      );

  /// Балансы всех семей: кто в минусе и на сколько.
  ///
  /// Минус — это уже сделанные поездки, за которые не заплатили. Владелец
  /// должен видеть этот список раньше, чем он станет большим.
  _i2.Future<List<_i40.FamilyBalanceRow>> familyBalances() =>
      caller.callServerEndpoint<List<_i40.FamilyBalanceRow>>(
        'owner',
        'familyBalances',
        {},
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
  _i2.Future<_i9.Family?> myFamily() => caller.callServerEndpoint<_i9.Family?>(
    'profile',
    'myFamily',
    {},
  );

  /// Дети вошедшего родителя.
  _i2.Future<List<_i11.Child>> myChildren() =>
      caller.callServerEndpoint<List<_i11.Child>>(
        'profile',
        'myChildren',
        {},
      );

  /// Водители из «круга семьи»: постоянный и резервные.
  _i2.Future<List<_i12.Driver>> myDrivers() =>
      caller.callServerEndpoint<List<_i12.Driver>>(
        'profile',
        'myDrivers',
        {},
      );

  /// Профиль вошедшего водителя.
  _i2.Future<_i12.Driver?> myDriverProfile() =>
      caller.callServerEndpoint<_i12.Driver?>(
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
  _i2.Future<List<_i17.RideView>> today() =>
      caller.callServerEndpoint<List<_i17.RideView>>(
        'rides',
        'today',
        {},
      );

  /// Поездки водителя на завтра — экран подтверждения.
  _i2.Future<List<_i17.RideView>> tomorrow() =>
      caller.callServerEndpoint<List<_i17.RideView>>(
        'rides',
        'tomorrow',
        {},
      );

  /// Водитель подтверждает поездку: «завтра выйду».
  _i2.Future<_i25.Ride> confirm(int rideId) =>
      caller.callServerEndpoint<_i25.Ride>(
        'rides',
        'confirm',
        {'rideId': rideId},
      );

  /// Водитель не может выйти: причина обязательна и уходит диспетчеру.
  _i2.Future<_i25.Ride> decline(
    int rideId,
    String reason,
  ) => caller.callServerEndpoint<_i25.Ride>(
    'rides',
    'decline',
    {
      'rideId': rideId,
      'reason': reason,
    },
  );

  /// Принимает событие этапа поездки: «Выехал», «Забрал», «Передал» и так
  /// далее. Работает и для событий из офлайн-очереди, отправленных позже.
  _i2.Future<_i25.Ride> submitEvent(
    int rideId,
    _i41.RideEventSubmission submission,
  ) => caller.callServerEndpoint<_i25.Ride>(
    'rides',
    'submitEvent',
    {
      'rideId': rideId,
      'submission': submission,
    },
  );

  /// Дети в машине на этой поездке: порядок посадки и кто уже передан.
  _i2.Future<List<_i27.RideSeat>> rideSeats(int rideId) =>
      caller.callServerEndpoint<List<_i27.RideSeat>>(
        'rides',
        'rideSeats',
        {'rideId': rideId},
      );

  /// Приём точек трека от приложения водителя.
  ///
  /// Сервер сам решает, можно ли писать геолокацию: вне активной поездки
  /// точки отбрасываются и приложению возвращается запрет.
  _i2.Future<_i42.TrackingState> pushLocations(
    int rideId,
    List<_i43.RideLocationPoint> points,
  ) => caller.callServerEndpoint<_i42.TrackingState>(
    'rides',
    'pushLocations',
    {
      'rideId': rideId,
      'points': points,
    },
  );

  /// События поездки — лента для водителя.
  _i2.Future<List<_i18.RideEvent>> events(int rideId) =>
      caller.callServerEndpoint<List<_i18.RideEvent>>(
        'rides',
        'events',
        {'rideId': rideId},
      );

  /// Семьи из «круга» водителя — кому он может принять наличные.
  _i2.Future<List<_i9.Family>> myFamilies() =>
      caller.callServerEndpoint<List<_i9.Family>>(
        'rides',
        'myFamilies',
        {},
      );

  /// Водитель принял наличные от родителя.
  ///
  /// Это ещё не зачисление: деньги попадут в книгу операций после
  /// подтверждения диспетчером.
  _i2.Future<_i21.CashTopUp> recordCashTopUp({
    required int familyId,
    required int amountTenge,
    required bool hasSignature,
    String? note,
  }) => caller.callServerEndpoint<_i21.CashTopUp>(
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
  _i2.Future<List<_i21.CashTopUp>> myCashTopUps() =>
      caller.callServerEndpoint<List<_i21.CashTopUp>>(
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
  _i2.Future<_i16.RouteTemplate> requestRoute(_i16.RouteTemplate draft) =>
      caller.callServerEndpoint<_i16.RouteTemplate>(
        'routes',
        'requestRoute',
        {'draft': draft},
      );

  /// Маршруты детей вошедшего родителя.
  _i2.Future<List<_i16.RouteTemplate>> myRoutes() =>
      caller.callServerEndpoint<List<_i16.RouteTemplate>>(
        'routes',
        'myRoutes',
        {},
      );

  /// События поездки своего ребёнка — лента «что происходило».
  _i2.Future<List<_i18.RideEvent>> rideEvents(int rideId) =>
      caller.callServerEndpoint<List<_i18.RideEvent>>(
        'routes',
        'rideEvents',
        {'rideId': rideId},
      );

  /// Трек поездки ребёнка: путь, который уже проехали.
  _i2.Future<List<_i44.RideLocation>> rideTrack(int rideId) =>
      caller.callServerEndpoint<List<_i44.RideLocation>>(
        'routes',
        'rideTrack',
        {'rideId': rideId},
      );

  /// Положение машины в реальном времени (WebSocket).
  ///
  /// Поток живёт, пока открыт экран поездки: родитель видит машину,
  /// пока она едет.
  _i2.Stream<_i44.RideLocation> watchRideLocation(int rideId) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i44.RideLocation>,
        _i44.RideLocation
      >(
        'routes',
        'watchRideLocation',
        {'rideId': rideId},
        {},
      );

  /// Баланс семьи: остаток, ожидающие пополнения и история операций.
  _i2.Future<_i23.BalanceView> myBalance() =>
      caller.callServerEndpoint<_i23.BalanceView>(
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
  _i2.Future<List<_i20.NotificationOutbox>> myNotifications() =>
      caller.callServerEndpoint<List<_i20.NotificationOutbox>>(
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
  _i2.Future<List<_i13.Institution>> institutions() =>
      caller.callServerEndpoint<List<_i13.Institution>>(
        'routes',
        'institutions',
        {},
      );

  /// Поездки детей семьи на сегодня и завтра (по Ашхабаду).
  _i2.Future<List<_i17.RideView>> myUpcomingRides() =>
      caller.callServerEndpoint<List<_i17.RideView>>(
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

  _i2.Future<_i45.ServerHealth> ping() =>
      caller.callServerEndpoint<_i45.ServerHealth>(
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
         _i46.Protocol(),
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
    driverApplication = EndpointDriverApplication(this);
    hiring = EndpointHiring(this);
    training = EndpointTraining(this);
    institution = EndpointInstitution(this);
    institutionAdmin = EndpointInstitutionAdmin(this);
    owner = EndpointOwner(this);
    profile = EndpointProfile(this);
    rides = EndpointRides(this);
    routes = EndpointRoutes(this);
    health = EndpointHealth(this);
  }

  late final EndpointAuth auth;

  late final EndpointChat chat;

  late final EndpointDev dev;

  late final EndpointDirectory directory;

  late final EndpointDriverApplication driverApplication;

  late final EndpointHiring hiring;

  late final EndpointTraining training;

  late final EndpointInstitution institution;

  late final EndpointInstitutionAdmin institutionAdmin;

  late final EndpointOwner owner;

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
    'driverApplication': driverApplication,
    'hiring': hiring,
    'training': training,
    'institution': institution,
    'institutionAdmin': institutionAdmin,
    'owner': owner,
    'profile': profile,
    'rides': rides,
    'routes': routes,
    'health': health,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
