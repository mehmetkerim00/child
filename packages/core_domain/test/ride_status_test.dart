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

  test('исключения — всё, что вне основного пути', () {
    expect(RideStatus.delayed.isException, isTrue);
    expect(RideStatus.driverReplaced.isException, isTrue);
    expect(RideStatus.pickedUp.isException, isFalse);
  });
}
