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

  @override
  String get loginTitle => 'Girmek';

  @override
  String get loginPhoneLabel => 'Telefon belgisi';

  @override
  String get loginPhoneHint => '65 12-34-56';

  @override
  String get loginRequestCode => 'Kod almak';

  @override
  String get loginCodeLabel => 'SMS-dan kod';

  @override
  String get loginVerify => 'Gir';

  @override
  String get loginChangePhone => 'Belgini üýtget';

  @override
  String loginCodeSentTo(String phone) {
    return 'Kod $phone belgä iberildi';
  }

  @override
  String get loginHint =>
      'Belgini dispetçer hasaba alýar. Girip bilmeseňiz, oňa jaň ediň.';

  @override
  String get loginDevSeed => 'Synag maglumatlary bilen doldur';

  @override
  String get loginDevSeedDone =>
      'Taýýar. Dispetçer: 65 00-00-01, ene-ata: 65 20-00-01, sürüji: 65 10-00-01';

  @override
  String get errorUnknownPhone =>
      'Bu belgi hasaba alynmadyk. Dispetçere ýüz tutuň.';

  @override
  String get errorWrongCode => 'Kod nädogry';

  @override
  String get errorCodeExpired => 'Kodyň möhleti geçdi, täzesini soraň';

  @override
  String get errorTooManyAttempts => 'Synanyşyk köp boldy, täze kod soraň';

  @override
  String get errorCodeNotRequested => 'Ilki kod soraň';

  @override
  String get errorNetwork => 'Serwer bilen baglanyşyk ýok';

  @override
  String get logout => 'Çyk';

  @override
  String greeting(String name) {
    return 'Salam, $name';
  }

  @override
  String get save => 'Ýatda sakla';

  @override
  String get cancel => 'Goý bolsun';

  @override
  String get delete => 'Poz';

  @override
  String get add => 'Goş';

  @override
  String get edit => 'Üýtget';

  @override
  String get emptyList => 'Häzirlikçe boş';

  @override
  String get dispatcherTabFamilies => 'Maşgalalar';

  @override
  String get dispatcherTabChildren => 'Çagalar';

  @override
  String get dispatcherTabDrivers => 'Sürüjiler';

  @override
  String get dispatcherTabInstitutions => 'Edaralar';

  @override
  String get fieldName => 'Ady';

  @override
  String get fieldFamilyName => 'Maşgalanyň ady';

  @override
  String get fieldPhone => 'Telefon';

  @override
  String get fieldAddress => 'Salgy';

  @override
  String get fieldCarModel => 'Awtoulag';

  @override
  String get fieldCarPlate => 'Döwlet belgisi';

  @override
  String get fieldCodeWord => 'Kod sözi';

  @override
  String get fieldBirthYear => 'Doglan ýyly';

  @override
  String get fieldHandoverCode => 'Edaranyň kody';

  @override
  String get fieldType => 'Görnüşi';

  @override
  String get fieldFamily => 'Maşgala';

  @override
  String get fieldExperience => 'Tejribesi';

  @override
  String get fieldNeedsChildSeat => 'Çaga oturgyjy gerek';

  @override
  String get fieldIsFemaleDriver => 'Zenan sürüji';

  @override
  String get fieldSmsLevel => 'SMS habarnamalary';

  @override
  String get smsLevelAll => 'Ähli wakalar';

  @override
  String get smsLevelCritical => 'Diňe möhümleri';

  @override
  String get institutionKindergarten => 'Çagalar bagy';

  @override
  String get institutionSchool => 'Mekdep';

  @override
  String get institutionSection => 'Bölüm';

  @override
  String get institutionClub => 'Gurnak';

  @override
  String get vettingPending => 'Barlagda';

  @override
  String get vettingVerified => 'Barlanan';

  @override
  String get vettingRejected => 'Ret edilen';

  @override
  String get circlePrimary => 'Hemişelik sürüji';

  @override
  String get circleBackup1 => 'Ätiýaçlyk 1';

  @override
  String get circleBackup2 => 'Ätiýaçlyk 2';

  @override
  String get parentChildrenTitle => 'Meniň çagalarym';

  @override
  String get parentDriversTitle => 'Biziň sürüjimiz';

  @override
  String get driverProfileTitle => 'Meniň profilim';

  @override
  String get saved => 'Ýatda saklandy';

  @override
  String get requiredField => 'Meýdany dolduryň';

  @override
  String get dispatcherDirectories => 'Sanawlar';

  @override
  String get dispatcherCircleTitle => 'Maşgalanyň tegelegi';

  @override
  String get notSet => 'Bellenmedik';
}
