import 'package:core_domain/core_domain.dart';

import 'ride_card.dart';

/// Цветовая окраска статуса поездки: зелёный — идёт по плану,
/// жёлтый — внимание, красный — сбой.
RideTone rideToneFor(RideStatus status) => switch (status) {
  RideStatus.scheduled => RideTone.neutral,
  RideStatus.confirmed ||
  RideStatus.enRoute ||
  RideStatus.pickedUp ||
  RideStatus.inTransit ||
  RideStatus.arrived => RideTone.neutral,
  RideStatus.handedOver => RideTone.good,
  RideStatus.delayed || RideStatus.driverReplaced => RideTone.warning,
  RideStatus.cancelledByFamily ||
  RideStatus.cancelledNoDriver => RideTone.danger,
};
