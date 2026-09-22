// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkmen (`tk`).
class AppLocalizationsTk extends AppLocalizations {
  AppLocalizationsTk([String locale = 'tk']) : super(locale);

  @override
  String get appTitleParent => 'Child — ene-atalar üçin';

  @override
  String get appTitleDriver => 'Child — sürüji';

  @override
  String get appTitleDispatcher => 'Child — dispetçer';

  @override
  String flavorBadge(String flavor) {
    return 'Gurşaw: $flavor';
  }

  @override
  String get language => 'Dil';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageTk => 'Türkmen';

  @override
  String stubNotice(String sprint) {
    return 'Wagtlaýyn ekran. Mümkinçilikler $sprint sprintinde peýda bolar.';
  }

  @override
  String get serverStatusTitle => 'Serwer bilen aragatnaşyk';

  @override
  String get serverChecking => 'Barlanýar…';

  @override
  String serverOk(String version) {
    return 'Serwer işleýär (wersiýa $version)';
  }

  @override
  String get serverUnavailable => 'Serwer elýeterli däl';

  @override
  String get retry => 'Gaýtadan synanyş';

  @override
  String get parentTodayTitle => 'Şu gün';

  @override
  String get parentTodayEmpty => 'Şu gün üçin ýol ýok';

  @override
  String get driverTodayTitle => 'Günüň ugry';

  @override
  String get driverActionDeparted => 'Ýola çykdym';

  @override
  String get driverStubAction =>
      'Ýol tapgyrlarynyň düwmeleri S3 sprintinde işläp başlar';

  @override
  String get dispatcherBoardTitle => 'Günüň tagtasy';

  @override
  String get dispatcherBoardEmpty => 'Ýol ýok';

  @override
  String get rideStatusScheduled => 'Meýilleşdirildi';

  @override
  String get rideStatusConfirmed => 'Tassyklandy';

  @override
  String get rideStatusEnRoute => 'Sürüji ýola çykdy';

  @override
  String get rideStatusPickedUp => 'Çagany aldy';

  @override
  String get rideStatusInTransit => 'Ýolda';

  @override
  String get rideStatusArrived => 'Geldik';

  @override
  String get rideStatusHandedOver => 'Tabşyryldy';

  @override
  String get rideStatusDelayed => 'Gijikme';

  @override
  String get rideStatusCancelledByFamily => 'Maşgala ýatyrdy';

  @override
  String get rideStatusCancelledNoDriver => 'Ýatyryldy: sürüji ýok';

  @override
  String get rideStatusDriverReplaced => 'Sürüji çalşyldy';
}
