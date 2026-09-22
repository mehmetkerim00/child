import 'package:child_server/src/generated/protocol.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Этапы поездки', (sessionBuilder, endpoints) {
    late Session session;
    late Child child;
    late Driver driver;
    late Institution school;
    late Ride ride;
    late TestSessionBuilder asDriver;

    setUp(() async {
      session = sessionBuilder.build();

      final family = await Family.db.insertRow(
        session,
        Family(name: 'Семья Ниязовых', ownerPhone: '+99365200444'),
      );
      child = await Child.db.insertRow(
        session,
        Child(familyId: family.id!, name: 'Мерет', codeWord: 'ýyldyz'),
      );
      driver = await Driver.db.insertRow(
        session,
        Driver(
          phone: '+99365100444',
          name: 'Аман',
          carModel: 'Toyota',
          carPlate: 'AG 0004 AH',
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
      final template = await RouteTemplate.db.insertRow(
        session,
        RouteTemplate(
          childId: child.id!,
          weekdays: [1, 2, 3, 4, 5],
          pickupTime: '07:30',
          fromAddress: 'ул. Героглы 1',
          toInstitutionId: school.id,
          direction: RouteDirection.toInstitution,
          driverId: driver.id,
          active: true,
        ),
      );
      ride = await Ride.db.insertRow(
        session,
        Ride(
          templateId: template.id,
          childId: child.id!,
          driverId: driver.id,
          date: AshgabatTime.today(),
          plannedTime: '07:30',
          status: RideStatus.confirmed,
        ),
      );

      asDriver = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          'driver:${driver.id}',
          {const Scope('driver')},
        ),
      );
    });

    var counter = 0;
    RideEventSubmission submission(
      RideEventType type, {
      String? codeWord,
      String? institutionCode,
      bool signature = false,
      String? note,
      DateTime? at,
      String? clientEventId,
    }) => RideEventSubmission(
      clientEventId: clientEventId ?? 'event-${counter++}',
      type: type,
      at: at ?? DateTime.now().toUtc(),
      codeWord: codeWord,
      institutionCode: institutionCode,
      hasSignature: signature,
      note: note,
    );

    test('полный проход поездки: выехал → забрал → передал', () async {
      var updated = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.enRoute),
      );
      expect(updated.status, RideStatus.enRoute);

      updated = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.pickedUp, codeWord: 'Ýyldyz '),
      );
      expect(updated.status, RideStatus.pickedUp);

      updated = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.inTransit),
      );
      updated = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.arrived),
      );
      expect(updated.status, RideStatus.arrived);

      updated = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.handedOver, institutionCode: '2024'),
      );
      expect(updated.status, RideStatus.handedOver);

      final events = await endpoints.rides.events(asDriver, ride.id!);
      expect(events, hasLength(5));
    });

    test('без кодового слова ребёнка забрать нельзя', () async {
      await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.enRoute),
      );

      await expectLater(
        endpoints.rides.submitEvent(
          asDriver,
          ride.id!,
          submission(RideEventType.pickedUp, codeWord: 'неверное'),
        ),
        throwsA(
          isA<RideFlowException>().having(
            (e) => e.reason,
            'reason',
            RideFlowError.wrongCodeWord,
          ),
        ),
      );

      final unchanged = await Ride.db.findById(session, ride.id!);
      expect(unchanged?.status, RideStatus.enRoute);
    });

    test('передача без кода учреждения и подписи не проходит', () async {
      for (final type in [
        RideEventType.enRoute,
        RideEventType.pickedUp,
        RideEventType.inTransit,
        RideEventType.arrived,
      ]) {
        await endpoints.rides.submitEvent(
          asDriver,
          ride.id!,
          submission(type, codeWord: 'ýyldyz'),
        );
      }

      await expectLater(
        endpoints.rides.submitEvent(
          asDriver,
          ride.id!,
          submission(RideEventType.handedOver),
        ),
        throwsA(
          isA<RideFlowException>().having(
            (e) => e.reason,
            'reason',
            RideFlowError.handoverProofRequired,
          ),
        ),
      );

      // Подпись принимающего — равноценная замена коду учреждения.
      final handed = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.handedOver, signature: true),
      );
      expect(handed.status, RideStatus.handedOver);
    });

    test('этапы нельзя перепрыгивать', () async {
      await expectLater(
        endpoints.rides.submitEvent(
          asDriver,
          ride.id!,
          submission(RideEventType.handedOver, institutionCode: '2024'),
        ),
        throwsA(
          isA<RideFlowException>().having(
            (e) => e.reason,
            'reason',
            RideFlowError.wrongOrder,
          ),
        ),
      );
    });

    test(
      'офлайн-очередь: событие задним числом принимается со своим временем',
      () async {
        // Водитель нажал «Выехал» 40 минут назад, сеть появилась только сейчас.
        final happenedAt = DateTime.now().toUtc().subtract(
          const Duration(minutes: 40),
        );

        final updated = await endpoints.rides.submitEvent(
          asDriver,
          ride.id!,
          submission(RideEventType.enRoute, at: happenedAt),
        );

        expect(updated.status, RideStatus.enRoute);
        final event = (await endpoints.rides.events(asDriver, ride.id!)).single;
        expect(
          event.at.difference(happenedAt).inSeconds.abs(),
          lessThan(2),
          reason: 'сохраняется время действия, а не время доставки',
        );
      },
    );

    test('повторная отправка того же события ничего не дублирует', () async {
      final repeated = submission(
        RideEventType.enRoute,
        clientEventId: 'одно-и-то-же',
      );

      await endpoints.rides.submitEvent(asDriver, ride.id!, repeated);
      final second = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        repeated,
      );

      expect(second.status, RideStatus.enRoute);
      expect(await endpoints.rides.events(asDriver, ride.id!), hasLength(1));
    });

    test('задержка требует причину и не ломает поездку', () async {
      await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.enRoute),
      );

      await expectLater(
        endpoints.rides.submitEvent(
          asDriver,
          ride.id!,
          submission(RideEventType.delayed),
        ),
        throwsA(
          isA<RideFlowException>().having(
            (e) => e.reason,
            'reason',
            RideFlowError.reasonRequired,
          ),
        ),
      );

      final delayed = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.delayed, note: 'Пробка на Героглы'),
      );
      expect(delayed.status, RideStatus.delayed);

      // После задержки посадка продолжается как обычно.
      final pickedUp = await endpoints.rides.submitEvent(
        asDriver,
        ride.id!,
        submission(RideEventType.pickedUp, codeWord: 'ýyldyz'),
      );
      expect(pickedUp.status, RideStatus.pickedUp);
    });
  });
}
