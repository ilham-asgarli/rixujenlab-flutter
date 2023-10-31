import '../../../utils/di/injectable.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';

extension SignInFieldExtension on SignUpField {
  String get hintText => switch (this) {
        SignUpField.fullName => getIt<AppLocalizations>().fullName,
        SignUpField.userName => getIt<AppLocalizations>().userName,
        SignUpField.email => getIt<AppLocalizations>().email,
        SignUpField.password => getIt<AppLocalizations>().password,
      };
}