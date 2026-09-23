import 'ride_status.dart';

/// Что водитель делает на очередном этапе поездки.
enum RideAction {
  /// «Выехал к вам».
  depart,

  /// «Забрал» — водитель называет кодовое слово семьи.
  pickUp,

  /// «Посадил, едем».
  startTransit,

  /// «Приехали к учреждению».
  arrive,

  /// «Передал» — код учреждения или подпись принимающего.
  handOver,

  /// «Задерживаюсь» — с причиной и новым временем.
  delay,

  /// «Не могу выйти» — поездка остаётся без водителя.
  cancelNoDriver,
}

/// Почему переход запрещён.
enum RideTransitionError {
  /// Поездка уже завершена или отменена.
  rideFinished,

  /// Этап не следует за текущим статусом.
  wrongOrder,

  /// Водитель не назвал кодовое слово семьи.
  codeWordRequired,

  /// Передача без кода учреждения и без подписи принимающего.
  handoverProofRequired,

  /// Задержка и отказ требуют причины.
  reasonRequired,
}

/// Что известно о шаге, который делает водитель.
///
/// Приложение собирает эти данные на экране поездки и отдаёт их машине
/// состояний — она решает, можно ли делать переход.
class RideStep {
  const RideStep({
    required this.action,
    this.codeWordMatches = false,
    this.institutionCodeMatches = false,
    this.hasSignature = false,
    this.reason,
  });

  final RideAction action;

  /// Водитель назвал кодовое слово и родитель/ребёнок его подтвердили.
  final bool codeWordMatches;

  /// Введён верный код учреждения.
  final bool institutionCodeMatches;

  /// Принимающий расписался на экране.
  final bool hasSignature;

  /// Причина задержки или отказа.
  final String? reason;
}

/// Результат проверки перехода.
sealed class RideTransition {
  const RideTransition();
}

/// Переход разрешён.
class RideTransitionAllowed extends RideTransition {
  const RideTransitionAllowed(this.status);

  /// Статус, в который переходит поездка.
  final RideStatus status;
}

/// Переход запрещён.
class RideTransitionDenied extends RideTransition {
  const RideTransitionDenied(this.error);

  final RideTransitionError error;
}

/// Правила переходов поездки (MVP_PLAN §6).
///
/// Здесь нет ни сети, ни UI: тем же кодом проверяются события,
/// накопленные в офлайне и отправленные задним числом.
abstract final class RideStateMachine {
  /// Следующий шаг основного пути для статуса — подсказка для кнопки
  /// на экране водителя. null, если поездка завершена.
  static RideAction? nextAction(RideStatus status) => switch (status) {
    RideStatus.scheduled || RideStatus.confirmed => RideAction.depart,
    RideStatus.enRoute => RideAction.pickUp,
    RideStatus.pickedUp => RideAction.startTransit,
    RideStatus.inTransit => RideAction.arrive,
    RideStatus.arrived => RideAction.handOver,
    RideStatus.delayed => RideAction.pickUp,
    RideStatus.handedOver ||
    RideStatus.cancelledByFamily ||
    RideStatus.cancelledNoDriver ||
    RideStatus.driverReplaced => null,
  };

  /// Проверяет шаг и возвращает новый статус либо причину отказа.
  static RideTransition apply(RideStatus current, RideStep step) {
    if (current.isTerminal) {
      return const RideTransitionDenied(RideTransitionError.rideFinished);
    }

    return switch (step.action) {
      RideAction.depart => _expect(current, const {
        RideStatus.scheduled,
        RideStatus.confirmed,
      }, RideStatus.enRoute),

      // Забрать ребёнка можно, только назвав кодовое слово семьи:
      // это главный барьер против передачи ребёнка чужому человеку.
      //
      // В пуле детей забирают по очереди, поэтому «забрал» допустим и
      // когда в машине уже кто-то едет.
      RideAction.pickUp =>
        !step.codeWordMatches
            ? const RideTransitionDenied(RideTransitionError.codeWordRequired)
            : _expect(current, const {
                RideStatus.enRoute,
                RideStatus.delayed,
                RideStatus.pickedUp,
                RideStatus.inTransit,
              }, RideStatus.pickedUp),

      // «Едем дальше» — и после посадки, и после высадки части детей
      // на предыдущей остановке.
      RideAction.startTransit => _expect(current, const {
        RideStatus.pickedUp,
        RideStatus.arrived,
      }, RideStatus.inTransit),

      RideAction.arrive => _expect(current, const {
        RideStatus.inTransit,
        RideStatus.pickedUp,
      }, RideStatus.arrived),

      // Передача фиксируется кодом учреждения или подписью принимающего.
      RideAction.handOver =>
        !(step.institutionCodeMatches || step.hasSignature)
            ? const RideTransitionDenied(
                RideTransitionError.handoverProofRequired,
              )
            : _expect(current, const {
                RideStatus.arrived,
              }, RideStatus.handedOver),

      RideAction.delay => _withReason(step, RideStatus.delayed),
      RideAction.cancelNoDriver => _withReason(
        step,
        RideStatus.cancelledNoDriver,
      ),
    };
  }

  static RideTransition _expect(
    RideStatus current,
    Set<RideStatus> allowed,
    RideStatus next,
  ) {
    if (!allowed.contains(current)) {
      return const RideTransitionDenied(RideTransitionError.wrongOrder);
    }
    return RideTransitionAllowed(next);
  }

  /// Задержку и отказ без причины не принимаем: диспетчеру нужно знать,
  /// что случилось, чтобы найти замену.
  static RideTransition _withReason(RideStep step, RideStatus next) {
    final reason = step.reason?.trim() ?? '';
    if (reason.isEmpty) {
      return const RideTransitionDenied(RideTransitionError.reasonRequired);
    }
    return RideTransitionAllowed(next);
  }
}
