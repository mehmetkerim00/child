import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/reports/report_service.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// Отчёты владельцу: цифры должны сходиться с книгой операций.
///
/// Владелец принимает по ним решения — закрывать маршрут, нанимать
/// водителя. Поэтому отчёт проверяется на конкретных суммах, а не на
/// «отработало без ошибок».
void main() {
  withServerpod('Отчёты владельцу', (sessionBuilder, endpoints) {
    late Session session;
    late Family family;
    late Child child;
    late Driver driver;
    late Institution school;
    late RouteTemplate route;
    late TestSessionBuilder asOwner;
    late TestSessionBuilder asDispatcher;

    const ridePrice = 3500;
    final today = AshgabatTime.dateOf(DateTime.utc(2026, 9, 23, 6));

    setUp(() async {
      session = sessionBuilder.build();

      final owner = await OwnerAccount.db.insertRow(
        session,
        OwnerAccount(phone: '+99365001111', name: 'Владелец'),
      );
      final dispatcher = await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365002222', name: 'Мерджен'),
      );
      asOwner = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'owner:${owner.id}',
          {const Scope('owner')},
        ),
      );
      asDispatcher = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'dispatcher:${dispatcher.id}',
          {const Scope('dispatcher')},
        ),
      );

      family = await Family.db.insertRow(
        session,
        Family(name: 'Ниязовы', ownerPhone: '+99365209999'),
      );
      child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365109999',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 1234 AH',
          vettingStatus: VettingStatus.verified,
        ),
      );
      school = await Institution.db.insertRow(
        session,
        Institution(
          type: InstitutionType.school,
          name: 'Школа №20',
          address: 'ул. Героглы 45',
          handoverCode: '2024',
        ),
      );
      route = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1, 2, 3, 4, 5],
          pickupTime: '07:30',
          fromAddress: 'ул. Героглы 1',
          toInstitutionId: school.id,
          direction: RouteDirection.toInstitution,
          driverId: driver.id,
          pricePerRideTenge: ridePrice,
          active: true,
        ),
      );
    });

    /// Поездка с готовым результатом: так быстрее собрать день целиком.
    Future<Ride> ride({
      required RideStatus status,
      String time = '07:30',
      bool charge = true,
    }) async {
      final created = await Ride.db.insertRow(
        session,
        Ride(
          templateId: route.id,
          childId: child.id!,
          driverId: driver.id,
          date: today,
          plannedTime: time,
          status: status,
        ),
      );
      if (charge && status == RideStatus.handedOver) {
        await LedgerEntry.db.insertRow(
          session,
          LedgerEntry(
            familyId: family.id!,
            rideId: created.id,
            type: LedgerEntryType.rideCharge,
            amountTenge: -ridePrice,
            note: 'Поездка',
            dedupeKey: 'ride-charge:${created.id}',
            createdAt: today,
          ),
        );
      }
      return created;
    }

    test(
      'выручка считается по книге операций, а не по числу поездок',
      () async {
        await ride(status: RideStatus.handedOver);
        await ride(status: RideStatus.handedOver, time: '13:00');
        // Сорванная поездка: списания нет, в выручку не попадает.
        await ride(status: RideStatus.cancelledByFamily, time: '14:00');

        final report = await endpoints.owner.report(
          asOwner,
          fromDate: today,
          toDate: today,
        );

        expect(report.revenueTenge, ridePrice * 2);
        expect(report.days.single.planned, 3);
        expect(report.days.single.completed, 2);
        expect(report.days.single.cancelled, 1);
        expect(report.completionPercent, 67);
      },
    );

    test('маржа: выручка минус SMS минус выплата водителю', () async {
      await ride(status: RideStatus.handedOver);
      await ride(status: RideStatus.handedOver, time: '13:00');

      final report = await endpoints.owner.report(
        asOwner,
        fromDate: today,
        toDate: today,
        smsPriceTenge: 300,
        blockPayTenge: 10000,
        perRideTenge: 2000,
      );

      // Два блока (утро и день) по 10000 плюс две поездки по 2000.
      expect(report.driverPayTenge, 24000);
      expect(report.smsCostTenge, 0, reason: 'SMS ещё не уходили');
      expect(report.marginTenge, ridePrice * 2 - 24000);
      expect(
        report.marginTenge,
        lessThan(0),
        reason: 'один ребёнок в машине не окупает блок — ради этого и пулинг',
      );
    });

    test('убыточные маршруты — сверху списка', () async {
      await ride(status: RideStatus.handedOver);

      final report = await endpoints.owner.report(
        asOwner,
        fromDate: today,
        toDate: today,
      );

      final economics = report.routes.single;
      expect(economics.routeId, route.id);
      expect(economics.childName, child.name);
      expect(economics.destination, school.name);
      expect(economics.rides, 1);
      expect(economics.revenueTenge, ridePrice);
      expect(economics.marginTenge, ridePrice - 2000);
    });

    test('пустые часы видны: в них машина простаивает', () async {
      await ride(status: RideStatus.handedOver);

      final report = await endpoints.owner.report(
        asOwner,
        fromDate: today,
        toDate: today,
      );

      expect(report.emptyHours, isNot(contains(7)));
      expect(report.emptyHours, contains(12));
    });

    test('балансы семей: должники первыми', () async {
      await LedgerEntry.db.insertRow(
        session,
        LedgerEntry(
          familyId: family.id!,
          type: LedgerEntryType.rideCharge,
          amountTenge: -ridePrice,
          note: 'Поездка',
          dedupeKey: 'debt',
          createdAt: today,
        ),
      );
      final rich = await Family.db.insertRow(
        session,
        Family(name: 'Аннаевы', ownerPhone: '+99365208888'),
      );
      await LedgerEntry.db.insertRow(
        session,
        LedgerEntry(
          familyId: rich.id!,
          type: LedgerEntryType.cashTopup,
          amountTenge: 50000,
          note: 'Наличные',
          dedupeKey: 'topup',
          createdAt: today,
        ),
      );

      final balances = await endpoints.owner.familyBalances(asOwner);

      expect(balances.first.familyName, 'Ниязовы');
      expect(balances.first.inDebt, isTrue);
      expect(balances.first.balanceTenge, -ridePrice);
      expect(balances.last.inDebt, isFalse);

      final report = await endpoints.owner.report(
        asOwner,
        fromDate: today,
        toDate: today,
      );
      expect(report.familiesInDebt, 1);
      expect(report.familyBalanceTenge, 50000 - ridePrice);
    });

    test('диспетчер не видит отчётов: деньги — не его работа', () async {
      await expectLater(
        endpoints.owner.report(asDispatcher, fromDate: today, toDate: today),
        throwsA(isA<Exception>()),
      );
    });

    test('ссылка на выгрузку одноразовая и с живым сроком', () async {
      final link = await endpoints.owner.exportLink(
        asOwner,
        fromDate: today,
        toDate: today,
      );

      expect(link, startsWith('/hasabat.csv?t='));

      final saved = await ReportExport.db.find(session);
      expect(saved, hasLength(1));
      expect(saved.single.usedAt, isNull);
      expect(
        saved.single.expiresAt.difference(saved.single.createdAt).inMinutes,
        15,
      );
      // В базе только хэш: сам токен есть лишь в ссылке.
      expect(link.contains(saved.single.tokenHash), isFalse);
    });

    test('выгрузка открывается в Excel: BOM и разделитель «;»', () async {
      await ride(status: RideStatus.handedOver);
      final report = await endpoints.owner.report(
        asOwner,
        fromDate: today,
        toDate: today,
      );

      final csv = ReportService().toCsv(report);

      expect(
        csv.codeUnitAt(0),
        0xFEFF,
        reason: 'без BOM Excel портит кириллицу',
      );
      expect(csv, contains('Выручка;'));
      expect(csv, contains('$ridePrice'));
      expect(csv, contains('\r\n'), reason: 'Excel ждёт CRLF');
    });
  });
}
