// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitleParent => 'Child — for parents';

  @override
  String get appTitleDriver => 'Child — driver';

  @override
  String get appTitleDispatcher => 'Child — dispatcher';

  @override
  String flavorBadge(String flavor) {
    return 'Environment: $flavor';
  }

  @override
  String get language => 'Language';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageTk => 'Türkmen';

  @override
  String get languageEn => 'English';

  @override
  String stubNotice(String sprint) {
    return 'Placeholder screen. This will be built in sprint $sprint.';
  }

  @override
  String get serverStatusTitle => 'Server connection';

  @override
  String get serverChecking => 'Checking…';

  @override
  String serverOk(String version) {
    return 'Server is up (version $version)';
  }

  @override
  String get serverUnavailable => 'Server unavailable';

  @override
  String get retry => 'Retry';

  @override
  String get parentTodayTitle => 'Today';

  @override
  String get parentTodayEmpty => 'No rides today';

  @override
  String get driverTodayTitle => 'Today\'s route';

  @override
  String get driverActionDeparted => 'On my way';

  @override
  String get driverStubAction => 'Ride stage buttons will work in sprint S3';

  @override
  String get dispatcherBoardTitle => 'Today\'s board';

  @override
  String get dispatcherBoardEmpty => 'No rides';

  @override
  String get rideStatusScheduled => 'Scheduled';

  @override
  String get rideStatusConfirmed => 'Confirmed';

  @override
  String get rideStatusEnRoute => 'Driver on the way';

  @override
  String get rideStatusPickedUp => 'Child picked up';

  @override
  String get rideStatusInTransit => 'On the way';

  @override
  String get rideStatusArrived => 'Arrived';

  @override
  String get rideStatusHandedOver => 'Handed over';

  @override
  String get rideStatusDelayed => 'Delayed';

  @override
  String get rideStatusCancelledByFamily => 'Cancelled by family';

  @override
  String get rideStatusCancelledNoDriver => 'Cancelled: no driver';

  @override
  String get rideStatusDriverReplaced => 'Driver replaced';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get loginPhoneLabel => 'Phone number';

  @override
  String get loginPhoneHint => '65 12-34-56';

  @override
  String get loginRequestCode => 'Get code';

  @override
  String get loginCodeLabel => 'Code from SMS';

  @override
  String get loginVerify => 'Sign in';

  @override
  String get loginChangePhone => 'Change number';

  @override
  String loginCodeSentTo(String phone) {
    return 'Code sent to $phone';
  }

  @override
  String get loginHint =>
      'The dispatcher registers your number. If you cannot sign in, call them.';

  @override
  String get loginDevSeed => 'Fill with test data';

  @override
  String get loginDevSeedDone =>
      'Done. Dispatcher: 65 00-00-01, parent: 65 20-00-01, driver: 65 10-00-01';

  @override
  String get errorUnknownPhone =>
      'This number is not registered. Contact the dispatcher.';

  @override
  String get errorWrongCode => 'Wrong code';

  @override
  String get errorCodeExpired => 'The code has expired, request a new one';

  @override
  String get errorTooManyAttempts => 'Too many attempts, request a new code';

  @override
  String get errorCodeNotRequested => 'Request a code first';

  @override
  String get errorNetwork => 'No connection to the server';

  @override
  String get logout => 'Sign out';

  @override
  String greeting(String name) {
    return 'Hello, $name';
  }

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get add => 'Add';

  @override
  String get edit => 'Edit';

  @override
  String get emptyList => 'Nothing here yet';

  @override
  String get dispatcherTabFamilies => 'Families';

  @override
  String get dispatcherTabChildren => 'Children';

  @override
  String get dispatcherTabDrivers => 'Drivers';

  @override
  String get dispatcherTabInstitutions => 'Institutions';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldFamilyName => 'Family name';

  @override
  String get fieldPhone => 'Phone';

  @override
  String get fieldAddress => 'Address';

  @override
  String get fieldCarModel => 'Car';

  @override
  String get fieldCarPlate => 'Licence plate';

  @override
  String get fieldCodeWord => 'Code word';

  @override
  String get fieldBirthYear => 'Year of birth';

  @override
  String get fieldHandoverCode => 'Institution code';

  @override
  String get fieldType => 'Type';

  @override
  String get fieldFamily => 'Family';

  @override
  String get fieldExperience => 'Experience';

  @override
  String get fieldNeedsChildSeat => 'Child seat required';

  @override
  String get fieldIsFemaleDriver => 'Female driver';

  @override
  String get fieldSmsLevel => 'SMS notifications';

  @override
  String get smsLevelAll => 'All events';

  @override
  String get smsLevelCritical => 'Critical only';

  @override
  String get institutionKindergarten => 'Kindergarten';

  @override
  String get institutionSchool => 'School';

  @override
  String get institutionSection => 'Sports club';

  @override
  String get institutionClub => 'Activity club';

  @override
  String get vettingPending => 'Under review';

  @override
  String get vettingVerified => 'Verified';

  @override
  String get vettingRejected => 'Rejected';

  @override
  String get circlePrimary => 'Regular driver';

  @override
  String get circleBackup1 => 'Backup 1';

  @override
  String get circleBackup2 => 'Backup 2';

  @override
  String get parentChildrenTitle => 'My children';

  @override
  String get parentDriversTitle => 'Our driver';

  @override
  String get driverProfileTitle => 'My profile';

  @override
  String get saved => 'Saved';

  @override
  String get requiredField => 'Please fill in this field';

  @override
  String get dispatcherDirectories => 'Directories';

  @override
  String get dispatcherCircleTitle => 'Family circle';

  @override
  String get notSet => 'Not set';

  @override
  String get parentRoutesTitle => 'Routes';

  @override
  String get parentRequestRoute => 'Request a route';

  @override
  String get routeStatusPending => 'Awaiting dispatcher activation';

  @override
  String get routeStatusActive => 'Active';

  @override
  String get routeWeekdays => 'Days of the week';

  @override
  String get routePickupTime => 'Pickup time';

  @override
  String get routeFrom => 'From';

  @override
  String get routeTo => 'To';

  @override
  String get routeDirection => 'Direction';

  @override
  String get directionToInstitution => 'From home to institution';

  @override
  String get directionToHome => 'From institution to home';

  @override
  String get routeChild => 'Child';

  @override
  String get routePrice => 'Price per ride, manat';

  @override
  String get routeRequestSent => 'Request sent to the dispatcher';

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String get dispatcherTabRoutes => 'Routes';

  @override
  String get dispatcherPendingRoutes => 'Activation requests';

  @override
  String get dispatcherActivate => 'Activate';

  @override
  String get dispatcherDeactivate => 'Deactivate';

  @override
  String get dispatcherAssignDriver => 'Driver';

  @override
  String get dispatcherGenerateRides => 'Create rides';

  @override
  String dispatcherRidesCreated(int count) {
    return 'Rides created: $count';
  }

  @override
  String get driverTomorrowTitle => 'Tomorrow';

  @override
  String get driverConfirmDeadline => 'Confirm before 20:00';

  @override
  String get driverConfirm => 'I confirm';

  @override
  String get driverDecline => 'I cannot';

  @override
  String get driverDeclineReason => 'Reason';

  @override
  String get driverDeclineHint =>
      'The dispatcher will see the reason and find a replacement';

  @override
  String get driverConfirmed => 'Confirmed';

  @override
  String get driverNoRidesTomorrow => 'No rides tomorrow';

  @override
  String get ridesToday => 'Rides today';

  @override
  String rideAt(String time) {
    return 'at $time';
  }

  @override
  String get todayTab => 'Today';

  @override
  String get tomorrowTab => 'Tomorrow';

  @override
  String get dispatcherProblems => 'Problems';

  @override
  String get rideFlowTitle => 'Ride';

  @override
  String get actionDepart => 'On my way';

  @override
  String get actionPickUp => 'Picked up';

  @override
  String get actionStartTransit => 'Seated, driving';

  @override
  String get actionArrive => 'Arrived';

  @override
  String get actionHandOver => 'Handed over';

  @override
  String get actionDelay => 'Delay';

  @override
  String get codeWordPrompt =>
      'Say the family\'s code word and ask them to confirm it';

  @override
  String get codeWordField => 'Code word';

  @override
  String get handoverPrompt =>
      'Enter the institution code or ask for a signature';

  @override
  String get institutionCodeField => 'Institution code';

  @override
  String get signatureButton => 'Signature of the receiving adult';

  @override
  String get signatureDone => 'Signature captured';

  @override
  String get signatureClear => 'Clear';

  @override
  String get delayReasonField => 'Reason for the delay';

  @override
  String pendingEvents(int count) {
    return '$count events waiting to be sent';
  }

  @override
  String get allEventsSent => 'All events sent';

  @override
  String get retrySync => 'Send now';

  @override
  String get rideFinished => 'Ride finished';

  @override
  String get errorWrongCodeWordServer => 'The code word did not match';

  @override
  String get errorWrongOrder => 'This stage is not available yet';

  @override
  String get errorHandoverProof =>
      'An institution code or a signature is required';

  @override
  String get errorRideFinished => 'The ride is already finished';

  @override
  String get eventsTimeline => 'What happened';

  @override
  String get parentRideTitle => 'Child\'s ride';

  @override
  String get trackingOn => 'The parent can see where the car is';

  @override
  String get trackingOff => 'Location sharing is off';

  @override
  String get trackingDenied =>
      'No access to location: the parent will not see the car on the map';

  @override
  String get rideOnMap => 'Show on the map';

  @override
  String get parentNotificationsTitle => 'Notifications';

  @override
  String get notificationChannelPush => 'Push';

  @override
  String get notificationChannelSms => 'SMS';

  @override
  String get notificationQueued => 'Queued';

  @override
  String get notificationSent => 'Sent';

  @override
  String get notificationAcked => 'Delivered';

  @override
  String get notificationFailed => 'Not delivered';

  @override
  String get dispatcherTasksTitle => 'Tasks';

  @override
  String get dispatcherNoTasks => 'No tasks';

  @override
  String get taskResolve => 'Resolved';

  @override
  String get taskRideNotConfirmed => 'Ride not confirmed';

  @override
  String get taskDriverNotDeparted => 'Driver has not set off';

  @override
  String get taskNotificationUndelivered =>
      'Notification did not arrive — call';

  @override
  String get taskRideWithoutDriver => 'Ride without a driver';

  @override
  String get smsConsoleTitle => 'Send an SMS';

  @override
  String get smsConsoleSend => 'Send';

  @override
  String get smsConsoleBody => 'Message text';

  @override
  String get smsConsoleSent => 'SMS queued';

  @override
  String get parentBalanceTitle => 'Balance';

  @override
  String get balanceCurrent => 'Available';

  @override
  String get balancePending => 'Awaiting confirmation';

  @override
  String get balanceLowWarning => 'Less than three rides left — time to top up';

  @override
  String get balanceHowTo =>
      'How to top up: hand cash to the driver or the dispatcher. The driver records it in the app, the dispatcher confirms it — and the money appears on your balance.';

  @override
  String balanceManat(String amount) {
    return '$amount manat';
  }

  @override
  String get ledgerCashTopup => 'Cash top-up';

  @override
  String get ledgerRideCharge => 'Ride';

  @override
  String get ledgerAdjust => 'Adjustment';

  @override
  String get driverCashTitle => 'Cash';

  @override
  String get driverCashAccept => 'Accept a top-up';

  @override
  String get driverCashFamily => 'Family';

  @override
  String get driverCashAmount => 'Amount, manat';

  @override
  String get driverCashSignature => 'Parent\'s signature';

  @override
  String get driverCashPending => 'Awaiting dispatcher confirmation';

  @override
  String get driverCashConfirmed => 'Confirmed';

  @override
  String get driverCashRejected => 'Rejected';

  @override
  String get dispatcherTopUpsTitle => 'Top-ups';

  @override
  String get dispatcherConfirm => 'Confirm';

  @override
  String get dispatcherReject => 'Reject';

  @override
  String get dispatcherRejectReason => 'Reason for rejection';

  @override
  String get moneyTab => 'Money';

  @override
  String get onboardingTitle1 => 'A regular driver, not a random one';

  @override
  String get onboardingText1 =>
      'The same person drives your child every day, and you meet them beforehand. If they cannot come, the dispatcher offers a backup from your circle — someone you also know.';

  @override
  String get onboardingTitle2 => 'Handed over from adult to adult';

  @override
  String get onboardingText2 =>
      'The driver says your family\'s code word when picking the child up, and confirms the handover with the institution code or the teacher\'s signature. The child confirms nothing — only adults do.';

  @override
  String get onboardingTitle3 => 'You will know even without internet';

  @override
  String get onboardingText3 =>
      'For the events that matter — picked up, handed over, cancelled — an SMS arrives even when push does not. You can see the ride on the map while the car is moving.';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingStart => 'Start';

  @override
  String get offlineBanner =>
      'No connection to the server. The data may be out of date.';

  @override
  String get poolTitle => 'Pool: children in one car';

  @override
  String get poolCandidates => 'Can be combined';

  @override
  String get poolMerge => 'Combine into a pool';

  @override
  String poolSeatsLeft(int seats, int childSeats) {
    return 'Free seats: $seats, child seats: $childSeats';
  }

  @override
  String poolChildrenInCar(int count) {
    return 'Children in the car: $count';
  }

  @override
  String get poolNoCandidates => 'No matching rides';

  @override
  String poolTimeDiff(int minutes) {
    return '$minutes min apart';
  }

  @override
  String get poolNeedsChildSeat => 'child seat required';

  @override
  String get seatPickUp => 'Pick up';

  @override
  String get seatHandOver => 'Hand over';

  @override
  String get seatPickedUp => 'In the car';

  @override
  String get seatHandedOver => 'Handed over';

  @override
  String get seatWaiting => 'Waiting';

  @override
  String get seatWhichChild => 'Who are we picking up';

  @override
  String get chatTitle => 'Messages';

  @override
  String get chatHint =>
      'Write to the driver right here — phone numbers are never revealed';

  @override
  String get chatSend => 'Send';

  @override
  String get chatPlaceholder => 'Message';

  @override
  String get chatEmpty => 'No messages yet';

  @override
  String get chatQuickPhrases => 'Quick phrases';

  @override
  String get phraseComingOut => 'Coming out';

  @override
  String get phraseDelayFive => 'We are five minutes late';

  @override
  String get phraseChildSick => 'The child is ill, cancel today';

  @override
  String get phraseWaitingEntrance => 'Waiting at the entrance';

  @override
  String get phraseArrivedCallChild => 'I have arrived, please call the child';

  @override
  String get phraseAllGood => 'All good';

  @override
  String get emergencyCall => 'Call the dispatcher';

  @override
  String get emergencyHint =>
      'For anything urgent call the dispatcher — they will reach the driver';

  @override
  String get institutionAccessTitle => 'Link for the institution';

  @override
  String get institutionAccessIssue => 'Issue a link';

  @override
  String get institutionAccessIssuedTo => 'Issued to (teacher\'s name)';

  @override
  String get institutionAccessCopy =>
      'Copy and pass it on — it is shown only once';

  @override
  String get institutionAccessRevoke => 'Revoke';

  @override
  String get institutionAccessRevoked => 'Revoked';

  @override
  String get institutionAccessActive => 'Active';

  @override
  String get absenceTitle => 'Not riding today';

  @override
  String get absenceReason => 'Reason';

  @override
  String get absenceHint =>
      'The driver and the institution will see this immediately';

  @override
  String get absenceDone => 'Noted: not riding today';

  @override
  String get trainingTitle => 'Training';

  @override
  String get trainingIntro =>
      'Short lessons and a test on the child handover protocol. Until the test is passed, no routes are assigned.';

  @override
  String get trainingStart => 'Take the test';

  @override
  String get trainingPassed => 'Test passed';

  @override
  String trainingFailed(int correct, int total) {
    return 'Test not passed: $correct out of $total. Try again';
  }

  @override
  String trainingResult(int correct, int total) {
    return '$correct out of $total';
  }

  @override
  String get trainingNext => 'Next';

  @override
  String get trainingFinish => 'Finish the test';

  @override
  String trainingQuestion(int number, int total) {
    return 'Question $number of $total';
  }

  @override
  String get hiringTitle => 'Candidates';

  @override
  String get hiringChecklist => 'Checks';

  @override
  String get hiringHire => 'Hire';

  @override
  String get hiringReject => 'Reject';

  @override
  String get hiringRejectReason => 'Reason for rejection';

  @override
  String get hiringStatusSubmitted => 'Application submitted';

  @override
  String get hiringStatusDocuments => 'Documents';

  @override
  String get hiringStatusInterview => 'Interview';

  @override
  String get hiringStatusCarCheck => 'Car inspection';

  @override
  String get hiringStatusTraining => 'Training';

  @override
  String get hiringStatusHired => 'Hired';

  @override
  String get hiringStatusRejected => 'Rejected';

  @override
  String get checkPassport => 'Passport';

  @override
  String get checkLicense => 'Driving licence';

  @override
  String get checkCarDocs => 'Car documents';

  @override
  String get checkCriminal => 'Criminal record certificate';

  @override
  String get checkInterview => 'Interview';

  @override
  String get checkChildSeat => 'Demonstrated child seat installation';

  @override
  String get checkReferences => 'References';

  @override
  String get incidentsTitle => 'Incidents';

  @override
  String get incidentLog => 'Record';

  @override
  String get incidentResolution => 'Resolution';

  @override
  String get incidentSeverityNote => 'Note';

  @override
  String get incidentSeveritySerious => 'Serious';

  @override
  String get incidentSeverityCritical => 'Critical';

  @override
  String get payoutsTitle => 'Payouts';

  @override
  String payoutBlocks(int blocks) {
    return 'Blocks: $blocks';
  }

  @override
  String get payoutTotal => 'To be paid';

  @override
  String get payoutMarkPaid => 'Paid';

  @override
  String get trainingQ1 =>
      'The parent has not come out, the child is standing alone at the entrance. What do you do?';

  @override
  String get trainingQ1a =>
      'Put the child in the car and drive, so as not to be late';

  @override
  String get trainingQ1b => 'Call the dispatcher and wait for an adult';

  @override
  String get trainingQ1c => 'Mark “Picked up” and call later';

  @override
  String get trainingQ2 => 'The family\'s code word exists so that:';

  @override
  String get trainingQ2a => 'You can report to the dispatcher';

  @override
  String get trainingQ2b => 'The parent can be sure it is our driver who came';

  @override
  String get trainingQ2c => 'You can open the app';

  @override
  String get trainingQ3 => 'Who marks the ride stages in the app?';

  @override
  String get trainingQ3a => 'The child';

  @override
  String get trainingQ3b => 'The driver';

  @override
  String get trainingQ3c => 'The parent';

  @override
  String get trainingQ4 =>
      'The school has no institution code. How do you confirm the handover?';

  @override
  String get trainingQ4a => 'Skip the confirmation';

  @override
  String get trainingQ4b =>
      'Take the receiving adult\'s signature on the screen';

  @override
  String get trainingQ4c => 'Mark “Handed over” with nothing';

  @override
  String get trainingQ5 =>
      'The internet is gone in the middle of a ride. What do you do?';

  @override
  String get trainingQ5a => 'Mark nothing until the end of the day';

  @override
  String get trainingQ5b =>
      'Mark the stages as usual: they will be sent on their own';

  @override
  String get trainingQ5c => 'Call the parent';

  @override
  String get trainingQ6 => 'You are ten minutes late. The correct action:';

  @override
  String get trainingQ6a =>
      'Drive without saying anything and make up the time on the way';

  @override
  String get trainingQ6b => 'Mark the delay with a reason';

  @override
  String get trainingQ6c => 'Tell the parent after the ride';

  @override
  String get trainingQ7 =>
      'A stranger asks you to hand the child over to them:';

  @override
  String get trainingQ7a => 'Hand the child over if he says he is the uncle';

  @override
  String get trainingQ7b =>
      'Do not hand the child over and call the dispatcher';

  @override
  String get trainingQ7c => 'Hand the child over if the child recognised him';

  @override
  String get trainingQ8 =>
      'There are three children from different families in the car. The code word:';

  @override
  String get trainingQ8a => 'One for the whole car';

  @override
  String get trainingQ8b => 'Each family has its own';

  @override
  String get trainingQ8c => 'Not needed if they ride together';

  @override
  String get trainingQ9 => 'The driver confirms tomorrow\'s rides:';

  @override
  String get trainingQ9a => 'In the morning before setting off';

  @override
  String get trainingQ9b => 'By 20:00 the day before';

  @override
  String get trainingQ9c => 'Does not confirm them';

  @override
  String get trainingQ10 =>
      'A child needs a child seat, but there is no free seat:';

  @override
  String get trainingQ10a => 'Drive carefully without a seat';

  @override
  String get trainingQ10b => 'Tell the dispatcher: the ride cannot go ahead';

  @override
  String get trainingQ10c => 'Seat the child on an adult\'s lap';

  @override
  String get ownerTitle => 'Reports';

  @override
  String get ownerToday => 'Today';

  @override
  String get ownerWeek => 'Week';

  @override
  String get ownerMonth => 'Month';

  @override
  String get ownerRides => 'Rides';

  @override
  String get ownerCompleted => 'Delivered';

  @override
  String get ownerCancelled => 'Failed';

  @override
  String get ownerCompletion => 'Completion rate';

  @override
  String get ownerRevenue => 'Revenue';

  @override
  String get ownerSmsCost => 'SMS';

  @override
  String get ownerDriverPay => 'To drivers';

  @override
  String get ownerMargin => 'Gross margin';

  @override
  String get ownerDriverLoad => 'Driver load';

  @override
  String get ownerRouteEconomics => 'Route economics';

  @override
  String get ownerEmptyHours => 'Empty hours';

  @override
  String get ownerNoEmptyHours => 'No empty hours';

  @override
  String get ownerBalances => 'Family balances';

  @override
  String ownerInDebt(int count) {
    return 'In debt: $count';
  }

  @override
  String get ownerRidesPerBlock => 'Rides per block';

  @override
  String get ownerExport => 'Export a table';

  @override
  String get ownerExportHint =>
      'The link works once and only for 15 minutes. Open it on a computer — the file opens in Excel.';

  @override
  String get ownerExportCopy => 'Copy the link';

  @override
  String get ownerRates => 'Calculation rates';

  @override
  String get ownerSmsPrice => 'SMS, tenge';

  @override
  String get ownerBlockPay => 'Block pay';

  @override
  String get ownerPerRide => 'Ride, tenge';

  @override
  String get ownerLossMaking => 'Loss-making route';

  @override
  String get taskSystemDegraded => 'Service failure';

  @override
  String get ownerRouteSum => 'Routes total';

  @override
  String get ownerRouteSumHint => 'Without the guaranteed block pay';

  @override
  String get ownerTotalWithBlocks => 'Total including block cost';
}
