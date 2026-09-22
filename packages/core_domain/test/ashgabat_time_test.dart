import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  group('Время Ашхабада (UTC+5)', () {
    test('поздний вечер в UTC — это уже следующий день в Ашхабаде', () {
      // 22:30 UTC = 03:30 следующего дня по Ашхабаду.
      final moment = DateTime.utc(2026, 9, 22, 22, 30);
      expect(AshgabatTime.dateOf(moment), DateTime.utc(2026, 9, 23));
      expect(AshgabatTime.toLocal(moment).hour, 3);
    });

    test('раннее утро в UTC — ещё тот же день в Ашхабаде', () {
      // 02:00 UTC = 07:00 того же дня по Ашхабаду.
      final moment = DateTime.utc(2026, 9, 22, 2);
      expect(AshgabatTime.dateOf(moment), DateTime.utc(2026, 9, 22));
      expect(AshgabatTime.toLocal(moment).hour, 7);
    });

    test('местное время и UTC переводятся друг в друга без потерь', () {
      final moment = DateTime.utc(2026, 1, 15, 18, 45);
      expect(AshgabatTime.toUtc(AshgabatTime.toLocal(moment)), moment);
    });

    test('дата пересчитывается через календарь, а не через 24 часа', () {
      expect(
        AshgabatTime.addDays(DateTime.utc(2026, 12, 31), 1),
        DateTime.utc(2027, 1, 1),
      );
      expect(
        AshgabatTime.addDays(DateTime.utc(2028, 2, 28), 1),
        DateTime.utc(2028, 2, 29), // високосный год
      );
    });

    test('«завтра» — следующий календарный день по Ашхабаду', () {
      expect(
        AshgabatTime.tomorrow(),
        AshgabatTime.addDays(AshgabatTime.today(), 1),
      );
    });

    test('день недели: 1 — понедельник, 7 — воскресенье', () {
      expect(AshgabatTime.weekday(DateTime.utc(2026, 9, 21)), 1);
      expect(AshgabatTime.weekday(DateTime.utc(2026, 9, 27)), 7);
      // 20:00 UTC воскресенья — это уже понедельник в Ашхабаде.
      expect(AshgabatTime.weekday(DateTime.utc(2026, 9, 27, 20)), 1);
    });

    test('время подачи «07:30» хранится как 02:30 UTC', () {
      final planned = AshgabatTime.atLocalTime(
        DateTime.utc(2026, 9, 23),
        '07:30',
      );
      expect(planned, DateTime.utc(2026, 9, 23, 2, 30));
      expect(AshgabatTime.toLocal(planned).hour, 7);
      expect(AshgabatTime.toLocal(planned).minute, 30);
    });

    test('поздняя поездка остаётся в своей местной дате', () {
      // 23:00 по Ашхабаду 23 сентября = 18:00 UTC того же дня.
      final planned = AshgabatTime.atLocalTime(
        DateTime.utc(2026, 9, 23),
        '23:00',
      );
      expect(planned, DateTime.utc(2026, 9, 23, 18));
      expect(AshgabatTime.dateOf(planned), DateTime.utc(2026, 9, 23));
    });
  });
}
