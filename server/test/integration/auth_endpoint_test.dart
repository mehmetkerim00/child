import 'package:child_server/src/auth/phone_auth.dart';
import 'package:child_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Вход по телефону', (sessionBuilder, endpoints) {
    late Session session;
    late Driver driver;

    setUp(() async {
      session = sessionBuilder.build();
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365100777',
          name: 'Тестовый водитель',
          carModel: 'Toyota',
          carPlate: 'TT 0001 AH',
        ),
      );
    });

    Future<String> lastCode() async {
      final otp = await OtpCode.db.findFirstRow(
        session,
        orderBy: (c) => c.createdAt,
        orderDescending: true,
      );
      // Код хранится хэшем, поэтому ищем совпадение перебором — в тесте
      // это дёшево и подтверждает, что в базе нет самого кода.
      for (var i = 100000; i < 1000000; i++) {
        if (PhoneAuth.hash('$i') == otp!.codeHash) return '$i';
      }
      fail('код не найден');
    }

    test('незнакомый номер получает отказ', () async {
      await expectLater(
        endpoints.auth.requestCode(sessionBuilder, '+99361111111'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.reason,
            'reason',
            AuthFailureReason.unknownPhone,
          ),
        ),
      );
    });

    test('номер приводится к формату +993 и код выдаётся', () async {
      await endpoints.auth.requestCode(sessionBuilder, '65 10-07-77');
      final otp = await OtpCode.db.findFirstRow(session);
      expect(otp?.phone, '+99365100777');
    });

    test('неверный код не пускает и считает попытки', () async {
      await endpoints.auth.requestCode(sessionBuilder, driver.phone);
      await expectLater(
        endpoints.auth.verifyCode(sessionBuilder, driver.phone, '000000'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.reason,
            'reason',
            AuthFailureReason.wrongCode,
          ),
        ),
      );
      final otp = await OtpCode.db.findFirstRow(session);
      expect(otp?.attempts, 1);
    });

    test('верный код выдаёт токен сессии водителя', () async {
      await endpoints.auth.requestCode(sessionBuilder, driver.phone);
      final result = await endpoints.auth.verifyCode(
        sessionBuilder,
        driver.phone,
        await lastCode(),
      );

      expect(result.role, AccountRole.driver);
      expect(result.subjectId, driver.id);
      expect(result.token, isNotEmpty);

      // В базе лежит только хэш токена.
      final stored = await AuthToken.db.findFirstRow(session);
      expect(stored?.tokenHash, isNot(result.token));

      // Код одноразовый.
      await expectLater(
        endpoints.auth.verifyCode(sessionBuilder, driver.phone, '123456'),
        throwsA(isA<AuthException>()),
      );
    });
  });

  withServerpod('Справочники диспетчера', (sessionBuilder, endpoints) {
    test('без роли диспетчера доступа нет', () async {
      final asParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:1',
          {const Scope('parent')},
        ),
      );
      await expectLater(
        endpoints.directory.families(asParent),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test(
      'диспетчер создаёт семью, и у неё появляется родитель-владелец',
      () async {
        final asDispatcher = sessionBuilder.copyWith(
          authentication: AuthenticationOverride.authenticationInfo(
            'dispatcher:1',
            {const Scope('dispatcher')},
          ),
        );

        final family = await endpoints.directory.saveFamily(
          asDispatcher,
          Family(name: 'Семья Тестовых', ownerPhone: '65 20-07-77'),
        );
        expect(family.ownerPhone, '+99365200777');

        final parents = await endpoints.directory.parents(
          asDispatcher,
          family.id!,
        );
        expect(parents, hasLength(1));
        expect(parents.single.role, ParentRole.owner);
      },
    );
  });
}
