import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../clock.dart';
import 'ride_pool.dart';

/// Создаёт поездки на дату из активных шаблонов маршрутов.
///
/// Все даты — местные, по Ашхабаду (MVP_PLAN §6): «завтра» в UTC наступает
/// на 5 часов позже, и поездки иначе попали бы не на тот день.
abstract final class RideGenerator {
  /// Создаёт недостающие поездки на местную дату [localDate].
  ///
  /// Повторный вызов безопасен: уже созданные поездки не дублируются.
  /// Возвращает число созданных поездок.
  static Future<int> generateForDate(
    Session session,
    DateTime localDate, {
    Clock clock = const Clock(),
  }) async {
    final date = AshgabatTime.dateOf(localDate);
    final weekday = AshgabatTime.weekday(date);
    final now = clock.now();

    final templates = await RouteTemplate.db.find(
      session,
      where: (t) => t.active.equals(true),
    );

    var created = 0;
    for (final template in templates) {
      if (!template.weekdays.contains(weekday)) continue;

      // Время подачи уже прошло — поездки не создаём.
      //
      // Диспетчер мог активировать маршрут вечером: поездка «на сегодня
      // в 07:30» в этот момент не поездка, а мусор. Она засоряет доску
      // дня, портит выполняемость в отчёте владельцу и тут же рождает
      // задачу «водитель не выехал» — про рейс, который и не мог
      // состояться.
      final plannedUtc = AshgabatTime.atLocalTime(date, template.pickupTime);
      if (plannedUtc.isBefore(now)) continue;

      final existing = await Ride.db.findFirstRow(
        session,
        where: (r) => r.templateId.equals(template.id) & r.date.equals(date),
      );
      if (existing != null) continue;

      final ride = await Ride.db.insertRow(
        session,
        Ride(
          templateId: template.id,
          childId: template.childId,
          driverId: template.driverId,
          date: date,
          plannedTime: template.pickupTime,
          status: RideStatus.scheduled,
        ),
      );
      // Даже в поездке с одним ребёнком есть место: дальше её можно
      // объединить с соседней в пул, не переписывая логику.
      await RidePool.addSeat(
        session,
        rideId: ride.id!,
        childId: template.childId,
        templateId: template.id,
        seatPriceTenge: template.pricePerRideTenge,
      );
      created++;
    }
    return created;
  }

  /// Создаёт поездки на сегодня и завтра по Ашхабаду.
  ///
  /// Сегодня — на случай, если маршрут активировали утром того же дня.
  /// Часы передаются, чтобы прогон дня не зависел от того, когда его
  /// запустили: внутри сравнивается время подачи с «сейчас».
  static Future<int> generateUpcoming(
    Session session, {
    Clock clock = const Clock(),
  }) async {
    final today = AshgabatTime.dateOf(clock.now());
    final created = await generateForDate(session, today, clock: clock);
    final tomorrow = await generateForDate(
      session,
      AshgabatTime.addDays(today, 1),
      clock: clock,
    );
    return created + tomorrow;
  }
}
