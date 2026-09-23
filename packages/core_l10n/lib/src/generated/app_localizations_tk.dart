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

  @override
  String get parentRoutesTitle => 'Ugurlar';

  @override
  String get parentRequestRoute => 'Ugur üçin arza';

  @override
  String get routeStatusPending => 'Dispetçeriň tassyklamasyna garaşýar';

  @override
  String get routeStatusActive => 'Işjeň';

  @override
  String get routeWeekdays => 'Hepdäniň günleri';

  @override
  String get routePickupTime => 'Gelmeli wagty';

  @override
  String get routeFrom => 'Nireden';

  @override
  String get routeTo => 'Nirä';

  @override
  String get routeDirection => 'Ugur';

  @override
  String get directionToInstitution => 'Öýden edara';

  @override
  String get directionToHome => 'Edaradan öýe';

  @override
  String get routeChild => 'Çaga';

  @override
  String get routePrice => 'Bir ýoluň bahasy, manat';

  @override
  String get routeRequestSent => 'Arza dispetçere iberildi';

  @override
  String get weekdayMon => 'Duş';

  @override
  String get weekdayTue => 'Siş';

  @override
  String get weekdayWed => 'Çar';

  @override
  String get weekdayThu => 'Pen';

  @override
  String get weekdayFri => 'Ann';

  @override
  String get weekdaySat => 'Şen';

  @override
  String get weekdaySun => 'Ýek';

  @override
  String get dispatcherTabRoutes => 'Ugurlar';

  @override
  String get dispatcherPendingRoutes => 'Tassyklanmaly arzalar';

  @override
  String get dispatcherActivate => 'Işjeňleşdir';

  @override
  String get dispatcherDeactivate => 'Öçür';

  @override
  String get dispatcherAssignDriver => 'Sürüji';

  @override
  String get dispatcherGenerateRides => 'Ýollary döret';

  @override
  String dispatcherRidesCreated(int count) {
    return 'Döredilen ýollar: $count';
  }

  @override
  String get driverTomorrowTitle => 'Ertir';

  @override
  String get driverConfirmDeadline => 'Sagat 20:00-a çenli tassyklaň';

  @override
  String get driverConfirm => 'Tassyklaýaryn';

  @override
  String get driverDecline => 'Bilemok';

  @override
  String get driverDeclineReason => 'Sebäbi';

  @override
  String get driverDeclineHint => 'Dispetçer sebäbi görer we çalyşma tapar';

  @override
  String get driverConfirmed => 'Tassyklandy';

  @override
  String get driverNoRidesTomorrow => 'Ertire ýol ýok';

  @override
  String get ridesToday => 'Şu günki ýollar';

  @override
  String rideAt(String time) {
    return 'sagat $time';
  }

  @override
  String get todayTab => 'Şu gün';

  @override
  String get tomorrowTab => 'Ertir';

  @override
  String get dispatcherProblems => 'Meseleler';

  @override
  String get rideFlowTitle => 'Ýol';

  @override
  String get actionDepart => 'Ýola çykdym';

  @override
  String get actionPickUp => 'Aldym';

  @override
  String get actionStartTransit => 'Mündürdim, barýarys';

  @override
  String get actionArrive => 'Geldik';

  @override
  String get actionHandOver => 'Tabşyrdym';

  @override
  String get actionDelay => 'Gijikme';

  @override
  String get codeWordPrompt =>
      'Maşgalanyň kod sözüni aýdyň we tassyklamagy soraň';

  @override
  String get codeWordField => 'Kod sözi';

  @override
  String get handoverPrompt =>
      'Edaranyň kodyny giriziň ýa-da gol çekmegi soraň';

  @override
  String get institutionCodeField => 'Edaranyň kody';

  @override
  String get signatureButton => 'Kabul edeniň goly';

  @override
  String get signatureDone => 'Gol alyndy';

  @override
  String get signatureClear => 'Poz';

  @override
  String get delayReasonField => 'Gijikmäniň sebäbi';

  @override
  String pendingEvents(int count) {
    return '$count waka ibermäge garaşýar';
  }

  @override
  String get allEventsSent => 'Ähli wakalar iberildi';

  @override
  String get retrySync => 'Häzir iber';

  @override
  String get rideFinished => 'Ýol tamamlandy';

  @override
  String get errorWrongCodeWordServer => 'Kod sözi gabat gelmedi';

  @override
  String get errorWrongOrder => 'Bu tapgyr häzir elýeterli däl';

  @override
  String get errorHandoverProof => 'Edaranyň kody ýa-da gol gerek';

  @override
  String get errorRideFinished => 'Ýol eýýäm tamamlandy';

  @override
  String get eventsTimeline => 'Näme boldy';

  @override
  String get parentRideTitle => 'Çaganyň ýoly';

  @override
  String get trackingOn => 'Ene-ata awtoulagyň nirededigini görýär';

  @override
  String get trackingOff => 'Geolokasiýa öçürildi';

  @override
  String get trackingDenied =>
      'Geolokasiýa rugsat ýok: ene-ata awtoulagy kartada görmez';

  @override
  String get rideOnMap => 'Kartada görkez';

  @override
  String get parentNotificationsTitle => 'Habarnamalar';

  @override
  String get notificationChannelPush => 'Push';

  @override
  String get notificationChannelSms => 'SMS';

  @override
  String get notificationQueued => 'Nobatda';

  @override
  String get notificationSent => 'Iberildi';

  @override
  String get notificationAcked => 'Gowşuryldy';

  @override
  String get notificationFailed => 'Gowşurylmady';

  @override
  String get dispatcherTasksTitle => 'Meseleler';

  @override
  String get dispatcherNoTasks => 'Mesele ýok';

  @override
  String get taskResolve => 'Çözüldi';

  @override
  String get taskRideNotConfirmed => 'Ýol tassyklanmady';

  @override
  String get taskDriverNotDeparted => 'Sürüji ýola çykmady';

  @override
  String get taskNotificationUndelivered => 'Habar gowşmady — jaň etmeli';

  @override
  String get taskRideWithoutDriver => 'Ýol sürüjisiz';

  @override
  String get smsConsoleTitle => 'SMS ibermek';

  @override
  String get smsConsoleSend => 'Iber';

  @override
  String get smsConsoleBody => 'Habaryň teksti';

  @override
  String get smsConsoleSent => 'SMS nobata goýuldy';

  @override
  String get parentBalanceTitle => 'Balans';

  @override
  String get balanceCurrent => 'Galyndy';

  @override
  String get balancePending => 'Tassyklanmagyna garaşýar';

  @override
  String get balanceLowWarning => 'Üç ýoldan az pul galdy — doldurmaly';

  @override
  String get balanceHowTo =>
      'Nädip doldurmaly: nagt puly sürüjä ýa-da dispetçere beriň. Sürüji kabul edenini belleýär, dispetçer tassyklaýar — pul balansda peýda bolýar.';

  @override
  String balanceManat(String amount) {
    return '$amount manat';
  }

  @override
  String get ledgerCashTopup => 'Nagt bilen doldurmak';

  @override
  String get ledgerRideCharge => 'Ýol';

  @override
  String get ledgerAdjust => 'Düzediş';

  @override
  String get driverCashTitle => 'Nagt pul';

  @override
  String get driverCashAccept => 'Doldurmany kabul et';

  @override
  String get driverCashFamily => 'Maşgala';

  @override
  String get driverCashAmount => 'Möçberi, manat';

  @override
  String get driverCashSignature => 'Ene-atanyň goly';

  @override
  String get driverCashPending => 'Dispetçeriň tassyklamasyna garaşýar';

  @override
  String get driverCashConfirmed => 'Tassyklandy';

  @override
  String get driverCashRejected => 'Ret edildi';

  @override
  String get dispatcherTopUpsTitle => 'Doldurmalar';

  @override
  String get dispatcherConfirm => 'Tassykla';

  @override
  String get dispatcherReject => 'Ret et';

  @override
  String get dispatcherRejectReason => 'Ret etmegiň sebäbi';

  @override
  String get moneyTab => 'Pul';

  @override
  String get onboardingTitle1 => 'Hemişelik sürüji, tötänleýin däl';

  @override
  String get onboardingText1 =>
      'Çagaňyzy öňünden görkezilen bir adam gatnadýar. Ol çykyp bilmese, dispetçer siziň tegelegiňizden ätiýaçlyk sürüjini hödürlär — ol hem tanyş.';

  @override
  String get onboardingTitle2 => 'Elden ele tabşyrmak';

  @override
  String get onboardingText2 =>
      'Sürüji çagany alanda maşgalanyň kod sözüni aýdýar, tabşyranda bolsa edaranyň kody ýa-da terbiýeçiniň goly bilen tassyklaýar. Çaga hiç zat tassyklamaýar — diňe ulular.';

  @override
  String get onboardingTitle3 => 'Internet bolmasa-da habarly bolarsyňyz';

  @override
  String get onboardingText3 =>
      'Esasy wakalar — «aldy», «tabşyrdy», ýatyryldy — push gelmese-de SMS bilen gelýär. Awtoulag ýoldaka kartada görünýär.';

  @override
  String get onboardingNext => 'Indiki';

  @override
  String get onboardingStart => 'Başla';

  @override
  String get offlineBanner =>
      'Serwer bilen baglanyşyk ýok. Maglumatlar köne bolup biler.';

  @override
  String get poolTitle => 'Pul: bir awtoulagda çagalar';

  @override
  String get poolCandidates => 'Birleşdirip bolar';

  @override
  String get poolMerge => 'Pula birleşdir';

  @override
  String poolSeatsLeft(int seats, int childSeats) {
    return 'Boş orun: $seats, oturgyç: $childSeats';
  }

  @override
  String poolChildrenInCar(int count) {
    return 'Awtoulagda çaga: $count';
  }

  @override
  String get poolNoCandidates => 'Laýyk ýol ýok';

  @override
  String poolTimeDiff(int minutes) {
    return 'tapawut $minutes min';
  }

  @override
  String get poolNeedsChildSeat => 'oturgyç gerek';

  @override
  String get seatPickUp => 'Al';

  @override
  String get seatHandOver => 'Tabşyr';

  @override
  String get seatPickedUp => 'Awtoulagda';

  @override
  String get seatHandedOver => 'Tabşyryldy';

  @override
  String get seatWaiting => 'Garaşýar';

  @override
  String get seatWhichChild => 'Kimi alýarys';

  @override
  String get chatTitle => 'Habarlar';

  @override
  String get chatHint => 'Sürüjä şu ýerde ýazyň — telefon belgileri açylmaýar';

  @override
  String get chatSend => 'Iber';

  @override
  String get chatPlaceholder => 'Habar';

  @override
  String get chatEmpty => 'Häzirlikçe habar ýok';

  @override
  String get chatQuickPhrases => 'Taýýar jümleler';

  @override
  String get phraseComingOut => 'Çykýarys';

  @override
  String get phraseDelayFive => '5 minut gijikýäris';

  @override
  String get phraseChildSick => 'Çaga syrkaw, şu güni ýatyryň';

  @override
  String get phraseWaitingEntrance => 'Girelgede garaşýarys';

  @override
  String get phraseArrivedCallChild => 'Geldim, çagany çagyryň';

  @override
  String get phraseAllGood => 'Hemme zat gowy';

  @override
  String get emergencyCall => 'Dispetçere jaň et';

  @override
  String get emergencyHint =>
      'Gyssagly sorag — dispetçere jaň ediň, ol sürüji bilen habarlaşar';

  @override
  String get institutionAccessTitle => 'Edara üçin salgy';

  @override
  String get institutionAccessIssue => 'Salgy ber';

  @override
  String get institutionAccessIssuedTo => 'Kime berilýär (terbiýeçiniň ady)';

  @override
  String get institutionAccessCopy =>
      'Göçüriň we beriň — ol bir gezek görkezilýär';

  @override
  String get institutionAccessRevoke => 'Yzyna al';

  @override
  String get institutionAccessRevoked => 'Yzyna alnan';

  @override
  String get institutionAccessActive => 'Hereket edýär';

  @override
  String get absenceTitle => 'Şu gün gitmeýäris';

  @override
  String get absenceReason => 'Sebäbi';

  @override
  String get absenceHint => 'Sürüji we edara muny bada görer';

  @override
  String get absenceDone => 'Bellendi: şu gün gitmeýäris';
}
