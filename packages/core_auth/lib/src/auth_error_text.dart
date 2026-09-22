import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';

/// Текст ошибки входа на языке интерфейса.
String authErrorText(AppLocalizations l10n, Object error) {
  if (error is AuthException) {
    return switch (error.reason) {
      AuthFailureReason.unknownPhone => l10n.errorUnknownPhone,
      AuthFailureReason.wrongCode => l10n.errorWrongCode,
      AuthFailureReason.codeExpired => l10n.errorCodeExpired,
      AuthFailureReason.tooManyAttempts => l10n.errorTooManyAttempts,
      AuthFailureReason.codeNotRequested => l10n.errorCodeNotRequested,
    };
  }
  return l10n.errorNetwork;
}
