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
