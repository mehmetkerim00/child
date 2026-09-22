import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

/// Шаг с уже выполненными условиями — чтобы тесты читались по существу.
RideStep step(
  RideAction action, {
  bool codeWord = true,
  bool institutionCode = false,
  bool signature = false,
  String? reason,
}) => RideStep(
  action: action,
  codeWordMatches: codeWord,
  institutionCodeMatches: institutionCode,
  hasSignature: signature,
  reason: reason,
);

RideStatus? statusAfter(RideStatus from, RideStep next) {
  final result = RideStateMachine.apply(from, next);
  return result is RideTransitionAllowed ? result.status : null;
}

RideTransitionError? errorFor(RideStatus from, RideStep next) {
  final result = RideStateMachine.apply(from, next);
  return result is RideTransitionDenied ? result.error : null;
}

void main() {
  group('Основной путь поездки', () {
    test('проходит от подтверждения до передачи ребёнка', () {
      var status = RideStatus.confirmed;

      status = statusAfter(status, step(RideAction.depart))!;
      expect(status, RideStatus.enRoute);

      status = statusAfter(status, step(RideAction.pickUp))!;
      expect(status, RideStatus.pickedUp);

      status = statusAfter(status, step(RideAction.startTransit))!;
      expect(status, RideStatus.inTransit);

      status = statusAfter(status, step(RideAction.arrive))!;
      expect(status, RideStatus.arrived);

      status = statusAfter(
        status,
        step(RideAction.handOver, institutionCode: true),
      )!;
      expect(status, RideStatus.handedOver);
      expect(status.isTerminal, isTrue);
    });

    test('подсказывает кнопку следующего этапа', () {
      expect(
        RideStateMachine.nextAction(RideStatus.scheduled),
        RideAction.depart,
      );
      expect(
        RideStateMachine.nextAction(RideStatus.enRoute),
        RideAction.pickUp,
      );
      expect(
        RideStateMachine.nextAction(RideStatus.arrived),
        RideAction.handOver,
      );
      expect(RideStateMachine.nextAction(RideStatus.handedOver), isNull);
    });
  });

  group('Защита ребёнка', () {
    test('без кодового слова забрать ребёнка нельзя', () {
      expect(
        errorFor(RideStatus.enRoute, step(RideAction.pickUp, codeWord: false)),
        RideTransitionError.codeWordRequired,
      );
    });

    test('передача требует код учреждения или подпись', () {
      expect(
        errorFor(RideStatus.arrived, step(RideAction.handOver)),
        RideTransitionError.handoverProofRequired,
      );
      expect(
        statusAfter(
          RideStatus.arrived,
          step(RideAction.handOver, signature: true),
        ),
        RideStatus.handedOver,
      );
    });

    test('этапы нельзя перепрыгивать', () {
      // Нельзя «передать», не забрав ребёнка.
      expect(
        errorFor(
          RideStatus.enRoute,
          step(RideAction.handOver, institutionCode: true),
        ),
        RideTransitionError.wrongOrder,
      );
      // Нельзя выехать повторно.
      expect(
        errorFor(RideStatus.inTransit, step(RideAction.depart)),
        RideTransitionError.wrongOrder,
      );
    });

    test('завершённую поездку изменить нельзя', () {
      for (final status in RideStatus.values.where((s) => s.isTerminal)) {
        expect(
          errorFor(status, step(RideAction.depart)),
          RideTransitionError.rideFinished,
          reason: 'статус $status',
        );
      }
    });
  });

  group('Исключения', () {
    test('задержка и отказ требуют причину', () {
      expect(
        errorFor(RideStatus.enRoute, step(RideAction.delay)),
        RideTransitionError.reasonRequired,
      );
      expect(
        errorFor(RideStatus.enRoute, step(RideAction.delay, reason: '   ')),
        RideTransitionError.reasonRequired,
      );
      expect(
        statusAfter(
          RideStatus.enRoute,
          step(RideAction.delay, reason: 'Пробка на Героглы'),
        ),
        RideStatus.delayed,
      );
    });

    test('после задержки поездка продолжается с посадки', () {
      expect(
        statusAfter(RideStatus.delayed, step(RideAction.pickUp)),
        RideStatus.pickedUp,
      );
    });

    test('отказ водителя оставляет поездку без водителя', () {
      expect(
        statusAfter(
          RideStatus.confirmed,
          step(RideAction.cancelNoDriver, reason: 'Машина в ремонте'),
        ),
        RideStatus.cancelledNoDriver,
      );
    });
  });
}
