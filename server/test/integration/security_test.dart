import 'dart:io';

import 'package:child_server/src/endpoints/auth_endpoint.dart';
import 'package:child_server/src/endpoints/chat_endpoint.dart';
import 'package:child_server/src/endpoints/dev_endpoint.dart';
import 'package:child_server/src/endpoints/directory_endpoint.dart';
import 'package:child_server/src/endpoints/hiring_endpoint.dart';
import 'package:child_server/src/endpoints/institution_endpoint.dart';
import 'package:child_server/src/endpoints/owner_endpoint.dart';
import 'package:child_server/src/endpoints/profile_endpoint.dart';
import 'package:child_server/src/endpoints/rides_endpoint.dart';
import 'package:child_server/src/endpoints/routes_endpoint.dart';
import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/health/health_endpoint.dart';
import 'package:child_server/src/services/clock.dart';
import 'package:child_server/src/services/security/rate_limiter.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// Аудит доступа: кто что может.
///
/// Эти тесты — не про функции, а про границы. Ошибка здесь не ломает
/// сервис, она молча отдаёт чужие данные о детях: адрес, время, когда
/// ребёнок один у подъезда. Такое находят не в проде.
void main() {
  /// Эндпоинты, открытые без входа, — каждый с причиной.
  ///
  /// Список закрытый: новый публичный эндпоинт придётся вписать сюда
  /// руками, а значит — объяснить, почему он публичный.
  const publicEndpoints = {
    // Вход: до получения кода у человека нет сессии.
    'auth',
    // Проверка связи: приложение показывает, доступен ли сервер.
    'health',
    // Анкета кандидата: аккаунта у него ещё нет.
    'driverApplication',
    // Кабинет учреждения: воспитатель входит по ссылке с токеном,
    // доступ проверяется самим токеном.
    'institution',
    // Демо-данные: сам эндпоинт отказывает вне режима development.
    'dev',
  };

  /// Эндпоинты, которыми пользуются сразу несколько ролей.
  ///
  /// Одним набором scope это не выражается: Serverpod требует все scope
  /// сразу, а чат и профиль открыты и родителю, и водителю, и
  /// диспетчеру. Они проверяют доступ внутри каждого метода — что
  /// отдельно закреплено тестами «Границы доступа» ниже.
  const multiRoleEndpoints = {'chat', 'profile'};

  /// Все эндпоинты проекта. Связь с именами из сгенерированного кода
  /// проверяется отдельным тестом ниже.
  final endpointsByName = <String, Endpoint>{
    'auth': AuthEndpoint(),
    'chat': ChatEndpoint(),
    'dev': DevEndpoint(),
    'directory': DirectoryEndpoint(),
    'driverApplication': DriverApplicationEndpoint(),
    'hiring': HiringEndpoint(),
    'training': TrainingEndpoint(),
    'institution': InstitutionEndpoint(),
    'institutionAdmin': InstitutionAdminEndpoint(),
    'owner': OwnerEndpoint(),
    'profile': ProfileEndpoint(),
    'rides': RidesEndpoint(),
    'routes': RoutesEndpoint(),
    'health': HealthEndpoint(),
  };

  test('каждый непубличный эндпоинт требует вход и роль', () {
    final unprotected = <String>[];

    for (final entry in endpointsByName.entries) {
      if (publicEndpoints.contains(entry.key)) continue;

      // Многоролевые обязаны требовать вход; роль они проверяют сами.
      if (multiRoleEndpoints.contains(entry.key)) {
        if (!entry.value.requireLogin) unprotected.add(entry.key);
        continue;
      }

      if (!entry.value.requireLogin || entry.value.requiredScopes.isEmpty) {
        unprotected.add(entry.key);
      }
    }

    expect(
      unprotected,
      isEmpty,
      reason:
          'эндпоинт без роли отдаёт данные о детях любому вошедшему; '
          'если он публичный или многоролевой — впишите его в '
          'publicEndpoints или multiRoleEndpoints с объяснением',
    );
  });

  test('аудит знает обо всех эндпоинтах проекта', () {
    // Имена берём из сгенерированного кода: новый эндпоинт появится там
    // сам, и тест заставит решить, кому он открыт.
    final generated = File(
      'lib/src/generated/endpoints.dart',
    ).readAsStringSync();
    final names = RegExp(
      r"connectors\['([A-Za-z]+)'\]",
    ).allMatches(generated).map((match) => match.group(1)!).toSet();

    expect(
      publicEndpoints.intersection(multiRoleEndpoints),
      isEmpty,
      reason: 'эндпоинт не может быть одновременно открытым и ролевым',
    );
    expect(
      names.difference(endpointsByName.keys.toSet()),
      isEmpty,
      reason: 'новый эндпоинт не прошёл аудит доступа — впишите его сюда',
    );
    expect(
      endpointsByName.keys.toSet().difference(names),
      isEmpty,
      reason: 'эндпоинт переименован или удалён — список устарел',
    );
  });

  withServerpod('Границы доступа', (sessionBuilder, endpoints) {
    late Session session;
    late Family mine;
    late Family theirs;
    late Child myChild;
    late Child theirChild;
    late Driver myDriver;
    late Driver otherDriver;
    late TestSessionBuilder asParent;
    late TestSessionBuilder asOtherDriver;

    setUp(() async {
      session = sessionBuilder.build();

      mine = await Family.db.insertRow(
        session,
        Family(name: 'Ниязовы', ownerPhone: '+99365200001'),
      );
      theirs = await Family.db.insertRow(
        session,
        Family(name: 'Аннаевы', ownerPhone: '+99365200002'),
      );
      final parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: mine.id!,
          phone: '+99365200001',
          name: 'Огулджан',
          role: ParentRole.owner,
        ),
      );
      myChild = await Child.db.insertRow(
        session,
        Child(familyId: mine.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      theirChild = await Child.db.insertRow(
        session,
        Child(familyId: theirs.id!, name: 'Айна', codeWord: 'gün'),
      );
      myDriver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365100001',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 1111 AH',
          vettingStatus: VettingStatus.verified,
        ),
      );
      otherDriver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365100002',
          name: 'Мая',
          carModel: 'Hyundai',
          carPlate: 'AG 2222 AH',
          vettingStatus: VettingStatus.verified,
        ),
      );

      asParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${parent.id}',
          {const Scope('parent')},
        ),
      );
      asOtherDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${otherDriver.id}',
          {const Scope('driver')},
        ),
      );
    });

    test('родитель видит только своих детей', () async {
      final children = await endpoints.profile.myChildren(asParent);

      expect(children.map((c) => c.id), contains(myChild.id));
      expect(
        children.map((c) => c.id),
        isNot(contains(theirChild.id)),
        reason: 'чужой ребёнок — это чужой адрес и чужое расписание',
      );
    });

    test('родитель не видит поездки чужой семьи', () async {
      final theirRide = await Ride.db.insertRow(
        session,
        Ride(
          childId: theirChild.id!,
          driverId: myDriver.id,
          date: DateTime.utc(2026, 9, 23),
          plannedTime: '07:30',
          status: RideStatus.confirmed,
        ),
      );

      final visible = await endpoints.routes.myUpcomingRides(asParent);

      expect(
        visible.map((view) => view.ride.id),
        isNot(contains(theirRide.id)),
      );
    });

    test('водитель не может отметить чужую поездку', () async {
      final ride = await Ride.db.insertRow(
        session,
        Ride(
          childId: myChild.id!,
          driverId: myDriver.id,
          date: DateTime.utc(2026, 9, 23),
          plannedTime: '07:30',
          status: RideStatus.confirmed,
        ),
      );

      // Чужой водитель знает id поездки — этого не должно хватать.
      await expectLater(
        endpoints.rides.submitEvent(
          asOtherDriver,
          ride.id!,
          RideEventSubmission(
            clientEventId: 'other-driver-1',
            type: RideEventType.enRoute,
            at: DateTime.utc(2026, 9, 23, 7),
          ),
        ),
        throwsA(anything),
        reason: 'ребёнка забирает только назначенный водитель',
      );
    });

    test('родитель не попадает в эндпоинты диспетчера', () async {
      await expectLater(
        endpoints.directory.families(asParent),
        throwsA(anything),
        reason: 'справочник — это все семьи и все адреса',
      );
    });
  });

  withServerpod('Ограничение частоты', (sessionBuilder, endpoints) {
    late Session session;
    late TestClock clock;
    late RateLimiter limiter;

    setUp(() async {
      session = sessionBuilder.build();
      clock = TestClock(DateTime.utc(2026, 9, 23, 6));
      limiter = RateLimiter(clock: clock);

      await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365003333', name: 'Мерджен'),
      );
    });

    test('коды входа: три запроса подряд, четвёртый — отказ', () async {
      for (var attempt = 1; attempt <= RateLimiter.authLimit; attempt++) {
        expect(
          await limiter.allowAuthCode(session, '+99365003333'),
          isTrue,
          reason: 'попытка $attempt должна проходить',
        );
      }

      expect(
        await limiter.allowAuthCode(session, '+99365003333'),
        isFalse,
        reason: 'иначе чужим номером можно завалить человека SMS',
      );
    });

    test('окно скользит: через десять минут снова можно', () async {
      for (var attempt = 0; attempt < RateLimiter.authLimit; attempt++) {
        await limiter.allowAuthCode(session, '+99365003333');
      }
      expect(await limiter.allowAuthCode(session, '+99365003333'), isFalse);

      clock.advance(RateLimiter.authWindow + const Duration(minutes: 1));

      expect(
        await limiter.allowAuthCode(session, '+99365003333'),
        isTrue,
        reason: 'человек действительно мог не получить SMS',
      );
    });

    test('лимит на номер, а не на всех сразу', () async {
      for (var attempt = 0; attempt < RateLimiter.authLimit; attempt++) {
        await limiter.allowAuthCode(session, '+99365003333');
      }

      expect(
        await limiter.allowAuthCode(session, '+99365004444'),
        isTrue,
        reason: 'перебор одного номера не должен закрывать вход всем',
      );
    });

    test('уборка удаляет вчерашние отметки и щадит свежие', () async {
      await limiter.allowAuthCode(session, '+99365003333');
      clock.advance(const Duration(days: 2));
      await limiter.allowAuthCode(session, '+99365004444');

      final deleted = await limiter.cleanup(session);

      expect(deleted, 1);
      expect(await RateLimitHit.db.count(session), 1);
    });

    test('эндпоинт входа отдаёт отказ, а не молча шлёт SMS', () async {
      for (var attempt = 0; attempt < RateLimiter.authLimit; attempt++) {
        await endpoints.auth.requestCode(sessionBuilder, '+99365003333');
      }

      await expectLater(
        endpoints.auth.requestCode(sessionBuilder, '+99365003333'),
        throwsA(isA<AuthException>()),
      );
    });
  });
}
