import 'package:child_server/src/endpoints/dev_endpoint.dart';
import 'package:child_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// Сиды и нагрузочный засев.
///
/// Эти методы создают аккаунты и поездки без всякой проверки прав — это
/// их смысл в разработке и это дыра где угодно ещё. На боевом сервере
/// они обязаны отвечать отказом, даже если кто-то узнал адрес и собрал
/// запрос руками: эндпоинт открытый, логина он не требует.
void main() {
  group('Режим работы сервера', () {
    test('сидирование разрешено только в development', () {
      expect(DevEndpoint.seedingAllowedIn('development'), isTrue);

      for (final mode in ['production', 'staging', 'test', '', 'Development']) {
        expect(
          DevEndpoint.seedingAllowedIn(mode),
          isFalse,
          reason: 'в режиме «$mode» сиды недопустимы',
        );
      }
    });
  });

  withServerpod('Сиды вне разработки', (sessionBuilder, endpoints) {
    // Тесты идут в режиме test — то есть не development. Значит, здесь
    // проверяется ровно то же правило, что защищает боевой сервер.
    test('режим тестов не является development', () {
      expect(sessionBuilder.build().serverpod.runMode, isNot('development'));
    });

    test('seed отклоняется', () async {
      await expectLater(
        endpoints.dev.seed(sessionBuilder),
        throwsA(isA<Exception>()),
      );
      expect(
        await Family.db.find(sessionBuilder.build()),
        isEmpty,
        reason: 'отказ должен быть до единой записи в базе',
      );
    });

    test('seedLoad отклоняется', () async {
      await expectLater(
        endpoints.dev.seedLoad(sessionBuilder, drivers: 1, ridesPerDriver: 1),
        throwsA(isA<Exception>()),
      );
      expect(await Driver.db.find(sessionBuilder.build()), isEmpty);
    });

    test('cleanupLoad отклоняется', () async {
      // Уборка опаснее засева: на боевом сервере она удаляла бы семьи.
      await expectLater(
        endpoints.dev.cleanupLoad(sessionBuilder),
        throwsA(isA<Exception>()),
      );
    });

    test('loadResult отклоняется', () async {
      await expectLater(
        endpoints.dev.loadResult(sessionBuilder),
        throwsA(isA<Exception>()),
      );
    });

    // Вход без кода — самое опасное в этом эндпоинте. Сиды создают
    // лишние записи, а devLogin выдаёт готовую сессию семьи: имена
    // детей, адреса и время, когда их забирают. Логина он не требует,
    // поэтому полагаться на незнание адреса нельзя.
    test('devLogin отклоняется', () async {
      await expectLater(
        endpoints.dev.devLogin(sessionBuilder, '+99365200001'),
        throwsA(isA<Exception>()),
      );
    });

    test('devLogin не выдаёт сессию даже существующему номеру', () async {
      // Заводим настоящего родителя: отказ должен быть из-за режима
      // сервера, а не из-за того, что номер не нашёлся.
      final session = sessionBuilder.build();
      final family = await Family.db.insertRow(
        session,
        Family(name: 'Тестовы', ownerPhone: '+99365200001'),
      );
      await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365200001',
          name: 'Огулджан',
        ),
      );

      await expectLater(
        endpoints.dev.devLogin(sessionBuilder, '+99365200001'),
        throwsA(isA<Exception>()),
      );
      expect(
        await AuthToken.db.find(session),
        isEmpty,
        reason: 'отказ должен быть до выдачи токена',
      );
    });

    test('devAccounts отклоняется', () async {
      // Список готовых аккаунтов в бою — подсказка, кого ломать.
      await expectLater(
        endpoints.dev.devAccounts(sessionBuilder),
        throwsA(isA<Exception>()),
      );
    });
  });
}
