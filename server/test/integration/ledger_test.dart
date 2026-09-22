import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/clock.dart';
import 'package:child_server/src/services/money/ledger_service.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// Цена поездки: 35 манатов = 3500 тенге. Все суммы — целые тенге.
const _ridePrice = 3500;

void main() {
  withServerpod('Деньги семьи', (sessionBuilder, endpoints) {
    late Session session;
    late TestClock clock;
    late LedgerService ledger;
    late Family family;
    late Child child;
    late Driver driver;
    late RouteTemplate template;
    late TestSessionBuilder asParent;
    late TestSessionBuilder asDriver;
    late TestSessionBuilder asDispatcher;

    setUp(() async {
      session = sessionBuilder.build();
      clock = TestClock(DateTime.utc(2026, 9, 23, 5));
      ledger = LedgerService(clock: clock);

      family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365203333'),
      );
      final parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365203333',
          name: 'Огулджан',
          role: ParentRole.owner,
        ),
      );
      child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365103333',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0033 AH',
        ),
      );
      await FamilyCircle.db.insertRow(
        session,
        FamilyCircle(
          familyId: family.id!,
          driverId: driver.id!,
          rank: CircleRank.primary,
        ),
      );
      template = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1, 2, 3, 4, 5],
          pickupTime: '07:30',
          fromAddress: 'ул. Героглы 1',
          direction: RouteDirection.toInstitution,
          driverId: driver.id,
          pricePerRideTenge: _ridePrice,
          active: true,
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
      final dispatcher = await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365003333', name: 'Мерджен'),
      );
      asDispatcher = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'dispatcher:${dispatcher.id}',
          {const Scope('dispatcher')},
        ),
      );
    });

    Future<Ride> ride({RideStatus status = RideStatus.arrived}) {
      return Ride.db.insertRow(
        session,
        Ride(
          templateId: template.id,
          childId: child.id!,
          driverId: driver.id,
          date: AshgabatTime.today(),
          plannedTime: '07:30',
          status: status,
        ),
      );
    }

    test(
      'списание за поездку идемпотентно: одна поездка — одно списание',
      () async {
        final trip = await ride();

        // «Передал» может прийти много раз: офлайн-очередь повторяет отправку.
        for (var i = 0; i < 5; i++) {
          await ledger.chargeRide(session, trip);
        }

        final entries = await LedgerEntry.db.find(session);
        expect(entries, hasLength(1));
        expect(entries.single.amountTenge, -_ridePrice);
        expect(await ledger.balance(session, family.id!), -_ridePrice);
      },
    );

    test('две разные поездки списываются каждая', () async {
      final first = await ride();
      final second = await ride();

      await ledger.chargeRide(session, first);
      await ledger.chargeRide(session, second);

      expect(await ledger.balance(session, family.id!), -_ridePrice * 2);
    });

    test(
      'наличные зачисляются только после подтверждения диспетчером',
      () async {
        final request = await endpoints.rides.recordCashTopUp(
          asDriver,
          familyId: family.id!,
          amountTenge: 20000,
          hasSignature: true,
        );

        // Пока диспетчер не подтвердил, денег в балансе нет.
        expect(await ledger.balance(session, family.id!), 0);
        final beforeView = await endpoints.routes.myBalance(asParent);
        expect(beforeView.balanceTenge, 0);
        expect(beforeView.pendingTopUpTenge, 20000);

        await endpoints.directory.confirmTopUp(asDispatcher, request.id!);

        final afterView = await endpoints.routes.myBalance(asParent);
        expect(afterView.balanceTenge, 20000);
        expect(afterView.pendingTopUpTenge, 0);
      },
    );

    test('повторное подтверждение не удваивает деньги', () async {
      final request = await endpoints.rides.recordCashTopUp(
        asDriver,
        familyId: family.id!,
        amountTenge: 15000,
        hasSignature: false,
      );

      await endpoints.directory.confirmTopUp(asDispatcher, request.id!);
      await endpoints.directory.confirmTopUp(asDispatcher, request.id!);

      expect(await ledger.balance(session, family.id!), 15000);
      expect(await LedgerEntry.db.find(session), hasLength(1));
    });

    test('отклонённое пополнение в баланс не попадает', () async {
      final request = await endpoints.rides.recordCashTopUp(
        asDriver,
        familyId: family.id!,
        amountTenge: 5000,
        hasSignature: false,
      );

      await endpoints.directory.rejectTopUp(
        asDispatcher,
        topUpId: request.id!,
        reason: 'Родитель денег не передавал',
      );

      expect(await ledger.balance(session, family.id!), 0);
      final view = await endpoints.routes.myBalance(asParent);
      expect(view.pendingTopUpTenge, 0);
    });

    test('водитель не может принять наличные чужой семье', () async {
      final otherFamily = await Family.db.insertRow(
        session,
        Family(name: 'Семья Атаевых', ownerPhone: '+99365204444'),
      );

      await expectLater(
        endpoints.rides.recordCashTopUp(
          asDriver,
          familyId: otherFamily.id!,
          amountTenge: 10000,
          hasSignature: false,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('исправление — только новой записью с причиной', () async {
      await ledger.adjust(
        session,
        familyId: family.id!,
        amountTenge: -2500,
        reason: 'Двойное пополнение 23 сентября',
      );

      final entries = await LedgerEntry.db.find(session);
      expect(entries.single.type, LedgerEntryType.adjust);
      expect(entries.single.note, contains('Двойное пополнение'));

      // Без причины корректировку не принимаем.
      await expectLater(
        ledger.adjust(
          session,
          familyId: family.id!,
          amountTenge: 100,
          reason: '   ',
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('предупреждение, когда денег меньше чем на три поездки', () async {
      final request = await endpoints.rides.recordCashTopUp(
        asDriver,
        familyId: family.id!,
        // Ровно на две поездки.
        amountTenge: _ridePrice * 2,
        hasSignature: false,
      );
      await endpoints.directory.confirmTopUp(asDispatcher, request.id!);

      var view = await endpoints.routes.myBalance(asParent);
      expect(view.ridePriceTenge, _ridePrice);
      expect(view.lowBalance, isTrue);

      // Добавили ещё — предупреждение снимается.
      final more = await endpoints.rides.recordCashTopUp(
        asDriver,
        familyId: family.id!,
        amountTenge: _ridePrice * 2,
        hasSignature: false,
      );
      await endpoints.directory.confirmTopUp(asDispatcher, more.id!);

      view = await endpoints.routes.myBalance(asParent);
      expect(view.lowBalance, isFalse);
      expect(view.balanceTenge, _ridePrice * 4);
    });

    test('нулевые и отрицательные пополнения не принимаются', () async {
      for (final amount in [0, -100]) {
        await expectLater(
          endpoints.rides.recordCashTopUp(
            asDriver,
            familyId: family.id!,
            amountTenge: amount,
            hasSignature: false,
          ),
          throwsA(isA<Exception>()),
        );
      }
    });

    test('история операций показывает и пополнения, и списания', () async {
      final request = await endpoints.rides.recordCashTopUp(
        asDriver,
        familyId: family.id!,
        amountTenge: 10000,
        hasSignature: false,
      );
      await endpoints.directory.confirmTopUp(asDispatcher, request.id!);
      await ledger.chargeRide(session, await ride());

      final view = await endpoints.routes.myBalance(asParent);

      expect(view.entries, hasLength(2));
      expect(view.balanceTenge, 10000 - _ridePrice);
      expect(
        view.entries.map((entry) => entry.type).toSet(),
        {LedgerEntryType.cashTopup, LedgerEntryType.rideCharge},
      );
    });
  });
}
