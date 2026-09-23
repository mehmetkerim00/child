import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';

/// Названия значений справочников на языке интерфейса.
extension DirectoryLabels on AppLocalizations {
  String institutionType(InstitutionType type) => switch (type) {
    InstitutionType.kindergarten => institutionKindergarten,
    InstitutionType.school => institutionSchool,
    InstitutionType.section => institutionSection,
    InstitutionType.club => institutionClub,
  };

  String vettingStatus(VettingStatus status) => switch (status) {
    VettingStatus.pending => vettingPending,
    VettingStatus.verified => vettingVerified,
    VettingStatus.rejected => vettingRejected,
  };

  String circleRank(CircleRank rank) => switch (rank) {
    CircleRank.primary => circlePrimary,
    CircleRank.backup1 => circleBackup1,
    CircleRank.backup2 => circleBackup2,
  };

  String smsLevelLabel(SmsLevel level) => switch (level) {
    SmsLevel.all => smsLevelAll,
    SmsLevel.critical => smsLevelCritical,
  };
}

/// Названия этапов найма, проверок и инцидентов.
extension HiringLabels on AppLocalizations {
  String applicationStatus(ApplicationStatus status) => switch (status) {
    ApplicationStatus.submitted => hiringStatusSubmitted,
    ApplicationStatus.documents => hiringStatusDocuments,
    ApplicationStatus.interview => hiringStatusInterview,
    ApplicationStatus.carCheck => hiringStatusCarCheck,
    ApplicationStatus.training => hiringStatusTraining,
    ApplicationStatus.hired => hiringStatusHired,
    ApplicationStatus.rejected => hiringStatusRejected,
  };

  String checkKind(CheckKind kind) => switch (kind) {
    CheckKind.passport => checkPassport,
    CheckKind.drivingLicense => checkLicense,
    CheckKind.carDocuments => checkCarDocs,
    CheckKind.criminalRecord => checkCriminal,
    CheckKind.interview => checkInterview,
    CheckKind.childSeatDemo => checkChildSeat,
    CheckKind.references => checkReferences,
  };

  String incidentSeverity(IncidentSeverity severity) => switch (severity) {
    IncidentSeverity.note => incidentSeverityNote,
    IncidentSeverity.serious => incidentSeveritySerious,
    IncidentSeverity.critical => incidentSeverityCritical,
  };
}

/// Название языка семьи — на самом этом языке.
///
/// Не `localeName`: так называется свойство самого AppLocalizations.
///
/// Диспетчер выбирает язык SMS для семьи: «Türkmen» он узнает и не зная
/// туркменского, а «туркменский» ничего не говорит самой семье.
extension LocaleLabels on AppLocalizations {
  String familyLanguage(String locale) => switch (locale) {
    'tk' => languageTk,
    'en' => languageEn,
    _ => languageRu,
  };
}
