import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/clock.dart';
import 'package:child_server/src/services/money/ledger_service.dart';
import 'package:child_server/src/services/notifications/notification_service.dart';
import 'package:child_server/src/services/notifications/push_gateway.dart';
import 'package:child_server/src/services/notifications/silent_failure_watch.dart';
import 'package:child_server/src/services/rides/ride_generator.dart';
import 'package:child_server/src/services/rides/ride_pool.dart';
import 'package:child_server/src/services/sms/sms_gateway.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

/// Прогон полного школьного дня — сценарий приёмки перед каждым релизом.
///
/// Утро: поездка в школу с передачей ребёнка. День: обратный маршрут.
/// Деньги: пополнение и списания. Вечер: сорванная поездка на завтра
/// и эскалация диспетчеру.
///
/// Запускается как обычный тест (`./tools/check.sh server`) и в CI:
/// сценарий не должен зависеть от того, помнит ли его человек.
const _ridePriceTenge = 3500;
const _codeWord = 'ýyldyz';
const _schoolCode = '2024';

/// Push и SMS собираем в списки, чтобы проверять, что именно получила семья.
class _CapturedPush implements PushGateway {
  final messages = <String>[];

  @override
  Future<bool> send(
    Session session, {
    required String recipientPhone,
    required String title,
    required String body,
    required int outboxId,
  }) async {
    messages.add(body);
    return true;
  }
}

class _CapturedSms implements SmsGateway {
  final messages = <String>[];

  @override
  Future<void> send(
    Session session, {
    required String phone,
    required String body,
  }) async {
    messages.add('$phone: $body');
  }
}

void main() {
  withServerpod('Полный день', (sessionBuilder, endpoints) {
    late Session session;
    late TestClock clock;
    late _CapturedPush push;
    late _CapturedSms sms;
    late NotificationService notifications;
    late LedgerService ledger;

    late Family family;
    late Child child;
    late Driver driver;
    late Institution school;
    late RouteTemplate morningRoute;
    late RouteTemplate eveningRoute;
    late TestSessionBuilder asParent;
    late TestSessionBuilder asDriver;
    late TestSessionBuilder asDispatcher;
    late TestSessionBuilder asOwner;

    /// Сиды: одна семья, один ребёнок, один водитель, школа и два маршрута.
    setUp(() async {
      session = sessionBuilder.build();
      // Утро школьного дня: 06:30 по Ашхабаду.
      clock = TestClock(AshgabatTime.toUtc(DateTime.utc(2026, 9, 23, 6, 30)));
      push = _CapturedPush();
      sms = _CapturedSms();
      notifications = NotificationService(clock: clock, push: push, sms: sms);
      ledger = LedgerService(clock: clock);

      family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365209999'),
      );
      final parent = await Parent.db.insertRow(
        session,
        Parent(
          familyId: family.id!,
          phone: '+99365209999',
          name: 'Огулджан',
          role: ParentRole.owner,
        ),
      );
      child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: _codeWord),
      );
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365109999',
          name: 'Аман',
          carModel: 'Toyota Corolla',
          carPlate: 'AG 1234 AH',
          vettingStatus: VettingStatus.verified,
        ),
      );
      final dispatcher = await DispatcherAccount.db.insertRow(
        session,
        DispatcherAccount(phone: '+99365009999', name: 'Мерджен'),
      );
      final owner = await OwnerAccount.db.insertRow(
        session,
        OwnerAccount(phone: '+99365008888', name: 'Владелец'),
      );
      await FamilyCircle.db.insertRow(
        session,
        FamilyCircle(
          familyId: family.id!,
          driverId: driver.id!,
          rank: CircleRank.primary,
        ),
      );
      school = await Institution.db.insertRow(
        session,
        Institution(
          type: InstitutionType.school,
          name: 'Школа №20',
          address: 'ул. Героглы 45',
          handoverCode: _schoolCode,
        ),
      );

      morningRoute = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1, 2, 3, 4, 5],
          pickupTime: '07:30',
          fromAddress: 'ул. Героглы 1',
          toInstitutionId: school.id,
          direction: RouteDirection.toInstitution,
          driverId: driver.id,
          pricePerRideTenge: _ridePriceTenge,
          active: true,
        ),
      );
      eveningRoute = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1, 2, 3, 4, 5],
          pickupTime: '13:00',
          fromAddress: 'ул. Героглы 45',
          toAddress: 'ул. Героглы 1',
          direction: RouteDirection.toHome,
          driverId: driver.id,
          pricePerRideTenge: _ridePriceTenge,
          active: true,
        ),
      );

      // Водитель сдал обучение: без этого маршруты не назначаются.
      await TrainingResult.db.insertRow(
        session,
        TrainingResult(
          driverId: driver.id!,
          correct: 10,
          total: 10,
          passed: true,
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
      asOwner = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'owner:${owner.id}',
          {const Scope('owner')},
        ),
      );
    });

    var eventCounter = 0;
    RideEventSubmission step(
      RideEventType type, {
      int? childId,
      String? codeWord,
      String? institutionCode,
      bool hasSignature = false,
      String? note,
    }) => RideEventSubmission(
      clientEventId: 'full-day-${eventCounter++}',
      type: type,
      at: clock.now(),
      childId: childId,
      codeWord: codeWord,
      institutionCode: institutionCode,
      hasSignature: hasSignature,
      note: note,
    );

    /// Последняя отправка «Передал» — её повторяет офлайн-очередь.
    late RideEventSubmission lastHandOver;

    /// Проводит поездку от «Выехал» до «Передал».
    Future<Ride> driveToHandOver(
      Ride ride, {
      String? institutionCode,
      bool withSignature = false,
    }) async {
      var current = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        step(RideEventType.enRoute),
      );
      clock.advance(const Duration(minutes: 4));
      current = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        step(RideEventType.pickedUp, codeWord: _codeWord),
      );
      current = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        step(RideEventType.inTransit),
      );
      clock.advance(const Duration(minutes: 12));
      current = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        step(RideEventType.arrived),
      );
      lastHandOver = step(
        RideEventType.handedOver,
        institutionCode: institutionCode,
        hasSignature: withSignature,
      );
      current = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        lastHandOver,
      );
      return current;
    }

    test('школьный день целиком: утро, обратный путь, деньги, сбой', () async {
      // --- Ночью генератор создал поездки на сегодня ---------------------
      final created = await RideGenerator.generateUpcoming(session);
      expect(created, greaterThanOrEqualTo(2), reason: 'утро и обратный путь');

      final today = AshgabatTime.today();
      final todayRides = await Ride.db.find(
        session,
        where: (r) => r.date.equals(today),
        orderBy: (r) => r.plannedTime,
      );
      expect(todayRides, hasLength(2));
      final morning = todayRides.first;
      final evening = todayRides.last;
      expect(morning.templateId, morningRoute.id);
      expect(evening.templateId, eveningRoute.id);

      // --- Родитель пополняет баланс наличными ---------------------------
      final topUp = await endpoints.rides.recordCashTopUp(
        asDriver,
        familyId: family.id!,
        amountTenge: 20000,
        hasSignature: true,
      );
      await endpoints.directory.confirmTopUp(asDispatcher, topUp.id!);
      expect(await ledger.balance(session, family.id!), 20000);

      // --- Утренний маршрут: дом → школа ---------------------------------
      // В школе передачу подтверждает код учреждения.
      final morningDone = await driveToHandOver(
        morning,
        institutionCode: _schoolCode,
      );
      expect(morningDone.status, RideStatus.handedOver);

      // Списалась ровно одна поездка.
      expect(
        await ledger.balance(session, family.id!),
        20000 - _ridePriceTenge,
      );

      // Офлайн-очередь повторяет отправку того же события, пока сервер
      // не подтвердит приём: второго списания быть не должно.
      await endpoints.rides.submitEvent(asDriver, morning.id!, lastHandOver);
      await endpoints.rides.submitEvent(asDriver, morning.id!, lastHandOver);
      expect(
        await ledger.balance(session, family.id!),
        20000 - _ridePriceTenge,
        reason: 'второго списания быть не должно',
      );

      // Родитель видит ленту событий утренней поездки.
      final morningEvents = await endpoints.routes.rideEvents(
        asParent,
        morning.id!,
      );
      expect(morningEvents, hasLength(5));

      // --- Уведомления по утренней поездке -------------------------------
      await notifications.processQueue(session);
      expect(push.messages, isNotEmpty);
      expect(
        sms.messages.where((m) => m.contains('в машине')),
        isNotEmpty,
        reason: '«забрал» — критическое событие, SMS уходит сразу',
      );
      expect(
        sms.messages.where((m) => m.contains('передан')),
        isNotEmpty,
        reason: '«передал» — тоже критическое',
      );

      // --- Связь без раскрытия номеров -----------------------------------
      // Родитель пишет водителю прямо в приложении.
      final thread = await endpoints.chat.threadForRide(asParent, morning.id!);
      await endpoints.chat.send(
        asParent,
        threadId: thread.id!,
        clientMessageId: 'day-chat-1',
        body: 'Заберите, пожалуйста, у второго подъезда',
      );
      await endpoints.chat.send(
        asDriver,
        threadId: thread.id!,
        clientMessageId: 'day-chat-2',
        phrase: QuickPhrase.waitingAtEntrance,
      );

      final chat = await endpoints.chat.messages(asParent, thread.id!);
      expect(chat, hasLength(2));
      for (final message in chat) {
        expect(
          message.body,
          isNot(contains('+993')),
          reason: 'номера телефонов в переписке не раскрываются',
        );
      }

      // Экстренная связь ведёт к диспетчеру, а не к водителю.
      final emergency = await endpoints.chat.dispatcherPhone(asParent);
      expect(emergency, isNot(driver.phone));

      // --- Обратный маршрут: школа → дом ---------------------------------
      clock.advance(const Duration(hours: 5));
      // Дома кода учреждения нет: родитель расписывается на экране.
      final eveningDone = await driveToHandOver(evening, withSignature: true);
      expect(eveningDone.status, RideStatus.handedOver);

      expect(
        await ledger.balance(session, family.id!),
        20000 - _ridePriceTenge * 2,
        reason: 'две поездки за день',
      );

      // --- Вечер: поездка на завтра осталась неподтверждённой ------------
      final tomorrow = AshgabatTime.tomorrow();
      await RideGenerator.generateForDate(session, tomorrow);
      final tomorrowRides = await Ride.db.find(
        session,
        where: (r) => r.date.equals(tomorrow),
      );
      expect(tomorrowRides, isNotEmpty);

      // Водитель подтверждает одну поездку и отказывается от второй.
      await endpoints.rides.confirm(asDriver, tomorrowRides.first.id!);
      final declined = await endpoints.rides.decline(
        asDriver,
        tomorrowRides.last.id!,
        'Машина в ремонте',
      );
      expect(declined.status, RideStatus.cancelledNoDriver);
      expect(
        declined.driverId,
        isNull,
        reason: 'поездка осталась без водителя',
      );

      // --- Кабинет учреждения --------------------------------------------
      // Диспетчер выдаёт школе ссылку, воспитатель подтверждает приём.
      final schoolToken = await endpoints.institutionAdmin.issueAccess(
        asDispatcher,
        institutionId: school.id!,
        issuedTo: 'Воспитатель Гульнара',
      );
      final schoolDay = await endpoints.institution.dayView(
        sessionBuilder,
        schoolToken,
        date: null,
      );
      expect(schoolDay, isNotNull);
      expect(schoolDay!.arrivals, isNotEmpty);

      final arrival = schoolDay.arrivals.first;
      expect(
        arrival.handedOverAt,
        isNotNull,
        reason: 'водитель уже передал ребёнка',
      );

      final confirmed = await endpoints.institution.confirmArrival(
        sessionBuilder,
        token: schoolToken,
        rideId: arrival.rideId,
        childId: arrival.childId,
        confirmedBy: 'Гульнара',
      );
      expect(
        confirmed,
        isTrue,
        reason: 'второе, независимое от водителя подтверждение',
      );

      // --- Вечер, после 20:00: проверка «тихих сбоев» --------------------
      clock.advance(const Duration(hours: 9));
      expect(
        AshgabatTime.toLocal(clock.now()).hour,
        greaterThanOrEqualTo(20),
        reason: 'дедлайн подтверждения — 20:00 по Ашхабаду',
      );
      final problems = await SilentFailureWatch.check(
        session,
        notifications: notifications,
      );
      expect(problems, greaterThanOrEqualTo(1));

      final tasks = await DispatcherTask.db.find(
        session,
        where: (task) => task.resolvedAt.equals(null),
      );
      expect(
        tasks.map((task) => task.kind),
        contains(DispatcherTaskKind.rideWithoutDriver),
        reason: 'диспетчер видит поездку без водителя',
      );

      // --- Итог дня ------------------------------------------------------
      await notifications.processQueue(session);
      final balance = await endpoints.routes.myBalance(asParent);
      expect(balance.balanceTenge, 20000 - _ridePriceTenge * 2);
      expect(balance.entries, hasLength(3), reason: 'пополнение и две поездки');
      expect(balance.lowBalance, isFalse);

      // Родитель получил уведомление об отмене — это критическое событие.
      expect(
        sms.messages.where((m) => m.contains('без водителя')),
        isNotEmpty,
      );

      // --- Владелец смотрит на день цифрами ------------------------------
      //
      // Последняя проверка дня: сходится ли то, что видел владелец, с тем,
      // что реально произошло. Если отчёт разойдётся с книгой операций,
      // решения будут приниматься по выдуманным числам.
      final report = await endpoints.owner.report(
        asOwner,
        fromDate: today,
        toDate: today,
      );

      expect(
        report.revenueTenge,
        _ridePriceTenge * 2,
        reason: 'выручка дня — ровно два состоявшихся рейса',
      );
      expect(report.days.single.completed, 2);
      expect(report.routes, hasLength(2), reason: 'утро и обратный путь');
      expect(
        report.marginTenge,
        lessThan(report.revenueTenge),
        reason: 'из выручки вычитаются SMS и выплата водителю',
      );

      final balances = await endpoints.owner.familyBalances(asOwner);
      expect(
        balances.firstWhere((row) => row.familyId == family.id).balanceTenge,
        balance.balanceTenge,
        reason: 'владелец и родитель видят один и тот же баланс',
      );

      // Диспетчеру этот отчёт недоступен: деньги — не его работа.
      await expectLater(
        endpoints.owner.report(asDispatcher, fromDate: today, toDate: today),
        throwsA(isA<Exception>()),
      );
    });

    test('утро с пулом: три ребёнка в одной машине', () async {
      // Две соседние семьи едут в ту же школу в то же время.
      final neighbours = <({Child child, Ride ride, Family family})>[];
      for (final (index, name) in ['Атаевых', 'Сапаровых'].indexed) {
        final phone = '+9936520880$index';
        final otherFamily = await Family.db.insertRow(
          session,
          Family(name: 'Семья $name', ownerPhone: phone),
        );
        await Parent.db.insertRow(
          session,
          Parent(
            familyId: otherFamily.id!,
            phone: phone,
            name: 'Родитель $name',
            role: ParentRole.owner,
          ),
        );
        final otherChild = await Child.db.insertRow(
          session,
          Child(
            familyId: otherFamily.id!,
            name: 'Ребёнок $name',
            codeWord: 'kod$index',
          ),
        );
        final otherTemplate = await RouteTemplate.db.insertRow(
          session,
          RouteTemplate(
            childId: otherChild.id!,
            weekdays: [1, 2, 3, 4, 5],
            pickupTime: '07:35',
            fromAddress: 'ул. Героглы, соседний дом $index',
            toInstitutionId: school.id,
            direction: RouteDirection.toInstitution,
            driverId: driver.id,
            pricePerRideTenge: _ridePriceTenge,
            active: true,
          ),
        );
        final otherRide = await Ride.db.insertRow(
          session,
          Ride(
            templateId: otherTemplate.id,
            childId: otherChild.id!,
            driverId: driver.id,
            date: AshgabatTime.today(),
            plannedTime: '07:35',
            status: RideStatus.scheduled,
          ),
        );
        await RidePool.addSeat(
          session,
          rideId: otherRide.id!,
          childId: otherChild.id!,
          templateId: otherTemplate.id,
          seatPriceTenge: _ridePriceTenge,
        );
        neighbours.add((
          child: otherChild,
          ride: otherRide,
          family: otherFamily,
        ));
      }

      // Наша утренняя поездка.
      await RideGenerator.generateForDate(session, AshgabatTime.today());
      final morning = (await Ride.db.find(
        session,
        where: (r) =>
            r.date.equals(AshgabatTime.today()) &
            r.childId.equals(child.id) &
            r.plannedTime.equals('07:30'),
      )).single;

      // Диспетчер видит совместимые поездки и собирает пул.
      final candidates = await endpoints.directory.poolCandidates(
        asDispatcher,
        morning.id!,
        maxTimeDiffMinutes: 20,
      );
      expect(candidates.length, greaterThanOrEqualTo(2));

      await endpoints.directory.mergeIntoPool(
        asDispatcher,
        rideId: morning.id!,
        rideIds: neighbours.map((n) => n.ride.id!).toList(),
      );
      final seats = await RidePool.seats(session, morning.id!);
      expect(seats, hasLength(3), reason: 'три ребёнка в машине');

      // Водитель забирает каждого по своему кодовому слову.
      await endpoints.rides.submitEvent(
        asDriver,
        morning.id!,
        step(RideEventType.enRoute),
      );
      await endpoints.rides.submitEvent(
        asDriver,
        morning.id!,
        step(
          RideEventType.pickedUp,
          childId: child.id,
          codeWord: _codeWord,
        ),
      );
      for (final (index, neighbour) in neighbours.indexed) {
        await endpoints.rides.submitEvent(
          asDriver,
          morning.id!,
          step(
            RideEventType.pickedUp,
            childId: neighbour.child.id,
            codeWord: 'kod$index',
          ),
        );
      }
      expect(await RidePool.allPickedUp(session, morning.id!), isTrue);

      // Приехали в школу и передали всех по коду учреждения.
      await endpoints.rides.submitEvent(
        asDriver,
        morning.id!,
        step(RideEventType.inTransit),
      );
      await endpoints.rides.submitEvent(
        asDriver,
        morning.id!,
        step(RideEventType.arrived),
      );

      var ride = await endpoints.rides.submitEvent(
        asDriver,
        morning.id!,
        step(
          RideEventType.handedOver,
          childId: child.id,
          institutionCode: _schoolCode,
        ),
      );
      expect(
        ride.status,
        RideStatus.arrived,
        reason: 'двое детей ещё в машине',
      );

      for (final neighbour in neighbours) {
        ride = await endpoints.rides.submitEvent(
          asDriver,
          morning.id!,
          step(
            RideEventType.handedOver,
            childId: neighbour.child.id,
            institutionCode: _schoolCode,
          ),
        );
      }
      expect(ride.status, RideStatus.handedOver);

      // Каждая семья заплатила за своё место, чужие деньги не тронуты.
      for (final familyId in [
        family.id!,
        ...neighbours.map((n) => n.family.id!),
      ]) {
        final charges = await LedgerEntry.db.find(
          session,
          where: (entry) =>
              entry.familyId.equals(familyId) &
              entry.type.equals(LedgerEntryType.rideCharge),
        );
        expect(charges, hasLength(1), reason: 'одно место — одно списание');
        expect(charges.single.amountTenge, -_ridePriceTenge);
      }

      // Родитель видит своего ребёнка и число детей в машине, но не чужих.
      final parentRides = await endpoints.routes.myUpcomingRides(asParent);
      final view = parentRides.firstWhere((v) => v.ride.id == morning.id);
      expect(view.childrenInCar, 3);
      expect(view.seats, hasLength(1));
      expect(view.childName, child.name);
    });

    /// Путь нового водителя: анкета → проверки → наём → обучение → маршрут.
    ///
    /// Это вторая половина дня диспетчера. Смысл прогона — убедиться, что
    /// непроверенный и необученный человек не получит ребёнка, даже если
    /// диспетчер торопится и жмёт «Нанять».
    test('конвейер водителя: анкета, проверки, обучение, расчёт', () async {
      // 1. Кандидат заполняет анкету с телефона: аккаунта у него ещё нет.
      final application = await endpoints.driverApplication.submit(
        sessionBuilder,
        DriverApplication(
          fullName: 'Гульнара Атаева',
          phone: '+99365117777',
          experienceWithChildren: 'Воспитатель детского сада, 8 лет',
          drivingYears: 6,
          carModel: 'Hyundai Accent',
          carPlate: 'AG 7788 AH',
          isFemale: true,
          hasChildSeat: true,
        ),
      );
      expect(application.status, ApplicationStatus.submitted);

      // Повторная отправка анкеты не плодит дубликаты: связь рвётся.
      final again = await endpoints.driverApplication.submit(
        sessionBuilder,
        DriverApplication(
          fullName: 'Гульнара Атаева',
          phone: '8 65 11-77-77',
          experienceWithChildren: 'Воспитатель детского сада, 8 лет',
          drivingYears: 6,
          carModel: 'Hyundai Accent',
          carPlate: 'AG 7788 AH',
        ),
      );
      expect(again.id, application.id, reason: 'одна анкета на номер');

      // 2. Наём до закрытия чек-листа невозможен.
      await expectLater(
        endpoints.hiring.hire(asDispatcher, application.id!),
        throwsA(isA<Exception>()),
        reason: 'нельзя нанять непроверенного человека',
      );

      // 3. Диспетчер проходит чек-лист. Справка о несудимости — последней:
      // проверяем, что до неё наём всё ещё закрыт.
      for (final kind in const [
        CheckKind.passport,
        CheckKind.drivingLicense,
        CheckKind.carDocuments,
        CheckKind.interview,
        CheckKind.childSeatDemo,
      ]) {
        await endpoints.hiring.setCheck(
          asDispatcher,
          applicationId: application.id!,
          kind: kind,
          passed: true,
        );
      }
      await expectLater(
        endpoints.hiring.hire(asDispatcher, application.id!),
        throwsA(isA<Exception>()),
        reason: 'без справки о несудимости — нет',
      );

      await endpoints.hiring.setCheck(
        asDispatcher,
        applicationId: application.id!,
        kind: CheckKind.criminalRecord,
        passed: true,
      );

      // 4. Наём: из анкеты создаётся аккаунт водителя.
      final hired = await endpoints.hiring.hire(asDispatcher, application.id!);
      expect(hired.name, 'Гульнара Атаева');
      expect(hired.isFemale, isTrue, reason: 'семьи просят женщину-водителя');
      expect(hired.childSeats, 1);
      expect(hired.vettingStatus, VettingStatus.verified);

      // Повторное нажатие «Нанять» не создаёт второго водителя.
      final hiredAgain = await endpoints.hiring.hire(
        asDispatcher,
        application.id!,
      );
      expect(hiredAgain.id, hired.id);

      // 5. Маршрут новому водителю не назначается: обучение не сдано.
      final asNewDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${hired.id}',
          {const Scope('driver')},
        ),
      );
      expect(await endpoints.training.myTrainingPassed(asNewDriver), isFalse);
      await expectLater(
        endpoints.directory.activateRoute(
          asDispatcher,
          routeId: morningRoute.id!,
          driverId: hired.id!,
          pricePerRideTenge: _ridePriceTenge,
        ),
        throwsA(isA<Exception>()),
        reason: 'необученный водитель детей не возит',
      );

      // 6. Тест сдан наполовину — этого мало.
      final failed = await endpoints.training.submitTest(
        asNewDriver,
        correct: 5,
        total: 10,
      );
      expect(failed.passed, isFalse);
      expect(await endpoints.training.myTrainingPassed(asNewDriver), isFalse);

      // 7. Вторая попытка: 9 из 10 — порог пройден.
      final passed = await endpoints.training.submitTest(
        asNewDriver,
        correct: 9,
        total: 10,
      );
      expect(passed.passed, isTrue);
      expect(passed.attempt, 2, reason: 'попытки нумеруются');
      expect(await endpoints.training.myTrainingPassed(asNewDriver), isTrue);

      // 8. Теперь маршрут назначается.
      final route = await endpoints.directory.activateRoute(
        asDispatcher,
        routeId: morningRoute.id!,
        driverId: hired.id!,
        pricePerRideTenge: _ridePriceTenge,
      );
      expect(route.driverId, hired.id);

      // 9. Инцидент: опоздание. Закрыть без решения нельзя.
      final incident = await endpoints.hiring.logIncident(
        asDispatcher,
        severity: IncidentSeverity.note,
        description: 'Опоздала на 12 минут, семью не предупредила',
        driverId: hired.id,
      );
      expect(incident.resolvedAt, isNull);
      await expectLater(
        endpoints.hiring.resolveIncident(
          asDispatcher,
          incidentId: incident.id!,
          resolution: '   ',
        ),
        throwsA(isA<Exception>()),
        reason: 'журнал инцидентов без решений бесполезен',
      );

      final resolved = await endpoints.hiring.resolveIncident(
        asDispatcher,
        incidentId: incident.id!,
        resolution: 'Разобрали: напоминание отмечать задержку в приложении',
      );
      expect(resolved.resolvedAt, isNotNull);

      // 10. Расчёт за неделю у водителя без выполненных поездок: блоков нет,
      // но запись создаётся — диспетчер видит ноль, а не пустоту.
      final today = AshgabatTime.today();
      final payout = await endpoints.hiring.calculatePayout(
        asDispatcher,
        driverId: hired.id!,
        fromDate: AshgabatTime.addDays(today, -7),
        toDate: today,
        blockPayTenge: 10000,
        perRideTenge: 2000,
      );
      expect(payout.totalTenge, 0);
      expect(payout.paidAt, isNull);

      final paid = await endpoints.hiring.markPaid(asDispatcher, payout.id!);
      expect(paid!.paidAt, isNotNull);
    });
  });
}
