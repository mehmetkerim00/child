import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  test('основной путь начинается с scheduled и заканчивается handedOver', () {
    expect(RideStatus.happyPath.first, RideStatus.scheduled);
    expect(RideStatus.happyPath.last, RideStatus.handedOver);
  });

  test('терминальные статусы', () {
    final terminal = RideStatus.values.where((s) => s.isTerminal).toSet();
    expect(terminal, {
      RideStatus.handedOver,
      RideStatus.cancelledByFamily,
      RideStatus.cancelledNoDriver,
    });
  });

  test('геолокация пишется только во время активной поездки', () {
    // От «Выехал» до «Приехали» — машина в пути, родитель видит её на карте.
    for (final status in [
      RideStatus.enRoute,
      RideStatus.pickedUp,
      RideStatus.inTransit,
      RideStatus.arrived,
      // Задержка — машина уже в пути.
      RideStatus.delayed,
    ]) {
      expect(status.allowsLocationTracking, isTrue, reason: '$status');
    }

    // До выезда и после передачи ребёнка — ни одной координаты.
    for (final status in [
      RideStatus.scheduled,
      RideStatus.confirmed,
      RideStatus.handedOver,
      RideStatus.cancelledByFamily,
      RideStatus.cancelledNoDriver,
      RideStatus.driverReplaced,
    ]) {
      expect(status.allowsLocationTracking, isFalse, reason: '$status');
    }
  });

  test('исключения — всё, что вне основного пути', () {
    expect(RideStatus.delayed.isException, isTrue);
    expect(RideStatus.driverReplaced.isException, isTrue);
    expect(RideStatus.pickedUp.isException, isFalse);
  });
}
