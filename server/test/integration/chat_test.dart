import 'package:child_server/src/generated/protocol.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Связь без раскрытия номеров', (sessionBuilder, endpoints) {
    late Session session;
    late Family family;
    late Parent parent;
    late Driver driver;
    late Ride ride;
    late TestSessionBuilder asParent;
    late TestSessionBuilder asDriver;
    late TestSessionBuilder asDispatcher;
    late TestSessionBuilder asStranger;

    setUp(() async {
      session = sessionBuilder.build();

      family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365207777'),
      );
      parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365207777',
          name: 'Огулджан',
          role: ParentRole.owner,
        ),
      );
      final child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365107777',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0077 AH',
        ),
      );
      final dispatcher = await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365007777', name: 'Мерджен'),
      );
      ride = await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          driverId: driver.id,
          date: AshgabatTime.today(),
          plannedTime: '07:30',
          status: RideStatus.scheduled,
        ),
      );

      // Чужая семья — для проверки доступа.
      final otherFamily = await Family.db.insertRow(
        session,
        Family(name: 'Семья Чужих', ownerPhone: '+99365208888'),
      );
      final otherParent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: otherFamily.id!,
          phone: '+99365208888',
          name: 'Чужой',
          role: ParentRole.owner,
        ),
      );

      asParent = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${parent.id}',
          {const Scope('parent')},
        ),
      );
      asDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${driver.id}',
          {const Scope('driver')},
        ),
      );
      asDispatcher = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'dispatcher:${dispatcher.id}',
          {const Scope('dispatcher')},
        ),
      );
      asStranger = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'parent:${otherParent.id}',
          {const Scope('parent')},
        ),
      );
    });

    test('родитель и водитель переписываются, не зная номеров', () async {
      final thread = await endpoints.chat.threadForRide(asParent, ride.id!);

      await endpoints.chat.send(
        asParent,
        threadId: thread.id!,
        clientMessageId: 'm1',
        body: 'Мерет выйдет через 2 минуты',
      );
      await endpoints.chat.send(
        asDriver,
        threadId: thread.id!,
        clientMessageId: 'm2',
        phrase: QuickPhrase.waitingAtEntrance,
      );

      final messages = await endpoints.chat.messages(asParent, thread.id!);
      expect(messages, hasLength(2));
      expect(messages.first.senderName, 'Огулджан');
      expect(messages.last.body, 'Ждём у подъезда');

      // Ни в одном сообщении нет номеров телефонов.
      for (final message in messages) {
        expect(message.body, isNot(contains('+993')));
      }
    });

    test('готовые фразы приходят на языке семьи', () async {
      await Family.db.updateRow(session, family.copyWith(locale: 'tk'));
      final thread = await endpoints.chat.threadForRide(asDriver, ride.id!);

      final message = await endpoints.chat.send(
        asDriver,
        threadId: thread.id!,
        clientMessageId: 'tk1',
        phrase: QuickPhrase.comingOut,
      );

      expect(message.body, 'Çykýarys');
    });

    test(
      'критичная фраза дублируется уведомлением и зовёт диспетчера',
      () async {
        final thread = await endpoints.chat.threadForRide(asParent, ride.id!);

        await endpoints.chat.send(
          asParent,
          threadId: thread.id!,
          clientMessageId: 'sick1',
          phrase: QuickPhrase.childIsSick,
        );

        // Водитель получил уведомление, помеченное как критическое.
        final outbox = await NotificationOutbox.db.find(
          session,
          where: (row) => row.recipientRole.equals(AccountRole.driver),
        );
        expect(outbox, isNotEmpty);
        expect(outbox.first.critical, isTrue);
        expect(outbox.first.body, contains('болеет'));

        // Диспетчер увидит задачу: поездку надо отменить.
        final tasks = await DispatcherTask.db.find(session);
        expect(tasks, hasLength(1));
        expect(tasks.single.text, contains('Ниязовых'));
      },
    );

    test('повторная отправка не задваивает сообщение', () async {
      final thread = await endpoints.chat.threadForRide(asParent, ride.id!);

      for (var i = 0; i < 3; i++) {
        await endpoints.chat.send(
          asParent,
          threadId: thread.id!,
          clientMessageId: 'same',
          body: 'Выходим',
        );
      }

      expect(await endpoints.chat.messages(asParent, thread.id!), hasLength(1));
    });

    test('чужой родитель не видит переписку', () async {
      final thread = await endpoints.chat.threadForRide(asParent, ride.id!);

      await expectLater(
        endpoints.chat.messages(asStranger, thread.id!),
        throwsA(isA<Exception>()),
      );
      await expectLater(
        endpoints.chat.send(
          asStranger,
          threadId: thread.id!,
          clientMessageId: 'x1',
          body: 'подсматриваю',
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('диспетчер видит всю переписку', () async {
      final thread = await endpoints.chat.threadForRide(asParent, ride.id!);
      await endpoints.chat.send(
        asParent,
        threadId: thread.id!,
        clientMessageId: 'd1',
        body: 'Вопрос водителю',
      );

      final seen = await endpoints.chat.messages(asDispatcher, thread.id!);
      expect(seen, hasLength(1));
    });

    test('кнопка экстренной связи ведёт к диспетчеру', () async {
      final phone = await endpoints.chat.dispatcherPhone(asParent);
      expect(phone, '+99365007777');
      expect(
        phone,
        isNot(driver.phone),
        reason: 'родитель звонит диспетчеру, а не водителю',
      );
    });

    test('пустое сообщение не отправляется', () async {
      final thread = await endpoints.chat.threadForRide(asParent, ride.id!);
      await expectLater(
        endpoints.chat.send(
          asParent,
          threadId: thread.id!,
          clientMessageId: 'empty',
          body: '   ',
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
