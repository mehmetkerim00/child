import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_domain/core_domain.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:flutter/material.dart';

/// Надпись на большой кнопке текущего этапа.
String rideActionLabel(AppLocalizations l10n, RideAction action) =>
    switch (action) {
      RideAction.depart => l10n.actionDepart,
      RideAction.pickUp => l10n.actionPickUp,
      RideAction.startTransit => l10n.actionStartTransit,
      RideAction.arrive => l10n.actionArrive,
      RideAction.handOver => l10n.actionHandOver,
      RideAction.delay => l10n.actionDelay,
      RideAction.cancelNoDriver => l10n.driverDecline,
    };

/// Иконка этапа: водитель на солнце читает значки быстрее, чем текст.
IconData rideActionIcon(RideAction action) => switch (action) {
  RideAction.depart => Icons.directions_car,
  RideAction.pickUp => Icons.child_care,
  RideAction.startTransit => Icons.airline_seat_recline_normal,
  RideAction.arrive => Icons.place,
  RideAction.handOver => Icons.handshake,
  RideAction.delay => Icons.access_time,
  RideAction.cancelNoDriver => Icons.cancel,
};

/// Почему приложение не приняло нажатие (проверка до отправки).
String rideFlowErrorText(AppLocalizations l10n, RideTransitionError error) =>
    switch (error) {
      RideTransitionError.rideFinished => l10n.errorRideFinished,
      RideTransitionError.wrongOrder => l10n.errorWrongOrder,
      RideTransitionError.codeWordRequired => l10n.codeWordPrompt,
      RideTransitionError.handoverProofRequired => l10n.errorHandoverProof,
      RideTransitionError.reasonRequired => l10n.delayReasonField,
    };

/// Почему событие не принял сервер.
String rideFlowServerErrorText(
  AppLocalizations l10n,
  RideFlowException error,
) => switch (error.reason) {
  RideFlowError.rideFinished => l10n.errorRideFinished,
  RideFlowError.wrongOrder => l10n.errorWrongOrder,
  RideFlowError.wrongCodeWord => l10n.errorWrongCodeWordServer,
  RideFlowError.handoverProofRequired => l10n.errorHandoverProof,
  RideFlowError.reasonRequired => l10n.delayReasonField,
  RideFlowError.unsupportedEvent => l10n.errorWrongOrder,
};
