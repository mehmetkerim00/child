import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
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
    DateTime localDate,
  ) async {
    final date = AshgabatTime.dateOf(localDate);
    final weekday = AshgabatTime.weekday(date);

    final templates = await RouteTemplate.db.find(
      session,
      where: (t) => t.active.equals(true),
    );

    var created = 0;
    for (final template in templates) {
      if (!template.weekdays.contains(weekday)) continue;

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
  static Future<int> generateUpcoming(Session session) async {
    final today = await generateForDate(session, AshgabatTime.today());
    final tomorrow = await generateForDate(session, AshgabatTime.tomorrow());
    return today + tomorrow;
  }
}
