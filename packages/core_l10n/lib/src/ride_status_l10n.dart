import 'package:core_domain/core_domain.dart';

import 'generated/app_localizations.dart';

/// Названия статусов поездки для UI.
extension RideStatusL10n on AppLocalizations {
  String rideStatus(RideStatus status) => switch (status) {
        RideStatus.scheduled => rideStatusScheduled,
        RideStatus.confirmed => rideStatusConfirmed,
        RideStatus.enRoute => rideStatusEnRoute,
        RideStatus.pickedUp => rideStatusPickedUp,
        RideStatus.inTransit => rideStatusInTransit,
        RideStatus.arrived => rideStatusArrived,
        RideStatus.handedOver => rideStatusHandedOver,
        RideStatus.delayed => rideStatusDelayed,
        RideStatus.cancelledByFamily => rideStatusCancelledByFamily,
        RideStatus.cancelledNoDriver => rideStatusCancelledNoDriver,
        RideStatus.driverReplaced => rideStatusDriverReplaced,
      };
}
