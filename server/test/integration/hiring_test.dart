import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/drivers/hiring_service.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Конвейер водителей', (sessionBuilder, endpoints) {
    late Session session;
    late TestSessionBuilder asDispatcher;

    setUp(() async {
      session = sessionBuilder.build();
      final dispatcher = await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365004444', name: 'Мерджен'),
      );
      asDispatcher = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'dispatcher:${dispatcher.id}',
          {const Scope('dispatcher')},
        ),
      );
    });

    DriverApplication application({String phone = '65 40-00-01'}) =>
        DriverApplication(
          fullName: 'Аман Гурбанов',
          phone: phone,
          experienceWithChildren: 'Свои двое детей, возил в садик 3 года',
          drivingYears: 12,
          carModel: 'Toyota Corolla',
          carPlate: 'AG 4444 AH',
          hasChildSeat: true,
        );

    Future<DriverApplication> submitted() =>
        endpoints.driverApplication.submit(sessionBuilder, application());

    Future<void> passAllChecks(int applicationId) async {
      for (final kind in HiringService.requiredChecks) {
        await endpoints.hiring.setCheck(
          asDispatcher,
          applicationId: applicationId,
          kind: kind,
          passed: true,
          note: null,
        );
      }
    }

    test('кандидат подаёт анкету, номер приводится к формату', () async {
      final app = await submitted();

      expect(app.phone, '+99365400001');
      expect(app.status, ApplicationStatus.submitted);
    });

    test('повторная анкета с того же номера не плодит дубликаты', () async {
      await submitted();
      await submitted();

      final all = await endpoints.hiring.applications(
        asDispatcher,
        status: null,
      );
      expect(all, hasLength(1));
    });

    test('без всех проверок нанять нельзя', () async {
      final app = await submitted();

      await endpoints.hiring.setCheck(
        asDispatcher,
        applicationId: app.id!,
        kind: CheckKind.passport,
        passed: true,
        note: null,
      );

      await expectLater(
        endpoints.hiring.hire(asDispatcher, app.id!),
        throwsA(isA<Exception>()),
      );
    });

    test('после всех проверок кандидат становится водителем', () async {
      final app = await submitted();
      await passAllChecks(app.id!);

      final driver = await endpoints.hiring.hire(asDispatcher, app.id!);

      expect(driver.name, 'Аман Гурбанов');
      expect(driver.vettingStatus, VettingStatus.verified);
      expect(driver.childSeats, 1, reason: 'у кандидата было кресло');

      // Повторный наём не создаёт второго водителя.
      final again = await endpoints.hiring.hire(asDispatcher, app.id!);
      expect(again.id, driver.id);
      expect(await Driver.db.find(session), hasLength(1));
    });

    test('отказ без причины не принимается', () async {
      final app = await submitted();

      await expectLater(
        endpoints.hiring.setStatus(
          asDispatcher,
          applicationId: app.id!,
          status: ApplicationStatus.rejected,
          rejectedReason: '  ',
        ),
        throwsA(isA<Exception>()),
      );

      final rejected = await endpoints.hiring.setStatus(
        asDispatcher,
        applicationId: app.id!,
        status: ApplicationStatus.rejected,
        rejectedReason: 'Нет справки об отсутствии судимости',
      );
      expect(rejected.rejectedReason, contains('судимости'));
    });

    test('маршрут не назначается, пока водитель не сдал тест', () async {
      final app = await submitted();
      await passAllChecks(app.id!);
      final driver = await endpoints.hiring.hire(asDispatcher, app.id!);

      final family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Тестовых', ownerPhone: '+99365204001'),
      );
      final child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      final route = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1],
          pickupTime: '07:30',
          fromAddress: 'ул. Героглы 1',
          direction: RouteDirection.toInstitution,
          active: false,
        ),
      );

      final asDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${driver.id}',
          {const Scope('driver')},
        ),
      );

      // Тест не сдан — назначить нельзя.
      await expectLater(
        endpoints.directory.activateRoute(
          asDispatcher,
          routeId: route.id!,
          driverId: driver.id!,
          pricePerRideTenge: 3500,
        ),
        throwsA(isA<Exception>()),
      );

      // Провалил тест — всё ещё нельзя.
      final failed = await endpoints.training.submitTest(
        asDriver,
        correct: 6,
        total: 10,
      );
      expect(failed.passed, isFalse);
      expect(await endpoints.training.myTrainingPassed(asDriver), isFalse);

      // Сдал — маршрут назначается.
      final passed = await endpoints.training.submitTest(
        asDriver,
        correct: 9,
        total: 10,
      );
      expect(passed.passed, isTrue);
      expect(passed.attempt, 2, reason: 'вторая попытка');

      final activated = await endpoints.directory.activateRoute(
        asDispatcher,
        routeId: route.id!,
        driverId: driver.id!,
        pricePerRideTenge: 3500,
      );
      expect(activated.active, isTrue);
    });

    test('расчёт за период: блоки оплачиваются гарантированно', () async {
      final app = await submitted();
      await passAllChecks(app.id!);
      final driver = await endpoints.hiring.hire(asDispatcher, app.id!);

      final family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Тестовых', ownerPhone: '+99365204002'),
      );
      final child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );

      // Утро и день одного дня — два блока, три выполненные поездки.
      final today = AshgabatTime.today();
      for (final time in ['07:30', '07:50', '13:00']) {
        await Ride.db.insertRow(
          session,
          Ride(
            childId: child.id!,
            driverId: driver.id,
            date: today,
            plannedTime: time,
            status: RideStatus.handedOver,
          ),
        );
      }
      // Несостоявшаяся поездка в расчёт не идёт.
      await Ride.db.insertRow(
        session,
        Ride(
          childId: child.id!,
          driverId: driver.id,
          date: today,
          plannedTime: '18:00',
          status: RideStatus.cancelledNoDriver,
        ),
      );

      final payout = await endpoints.hiring.calculatePayout(
        asDispatcher,
        driverId: driver.id!,
        fromDate: today,
        toDate: today,
        blockPayTenge: 5000,
        perRideTenge: 1000,
      );

      expect(payout.blocks, 2, reason: 'утро и день');
      expect(payout.blockPayTenge, 10000);
      expect(payout.ridePayTenge, 3000, reason: 'три состоявшиеся поездки');
      expect(payout.totalTenge, 13000);
    });

    test('инцидент фиксируется и закрывается решением', () async {
      final app = await submitted();
      await passAllChecks(app.id!);
      final driver = await endpoints.hiring.hire(asDispatcher, app.id!);

      final incident = await endpoints.hiring.logIncident(
        asDispatcher,
        severity: IncidentSeverity.note,
        description: 'Опоздал на 15 минут, не предупредил',
        driverId: driver.id,
        rideId: null,
        familyId: null,
      );
      expect(incident.resolvedAt, isNull);

      // Закрыть без решения нельзя.
      await expectLater(
        endpoints.hiring.resolveIncident(
          asDispatcher,
          incidentId: incident.id!,
          resolution: '   ',
        ),
        throwsA(isA<Exception>()),
      );

      final resolved = await endpoints.hiring.resolveIncident(
        asDispatcher,
        incidentId: incident.id!,
        resolution: 'Поговорили, причина — пробка. Договорились предупреждать',
      );
      expect(resolved.resolvedAt, isNotNull);
      expect(resolved.resolution, contains('Договорились'));
    });
  });
}
