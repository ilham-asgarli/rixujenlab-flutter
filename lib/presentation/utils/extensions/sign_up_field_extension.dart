import '../../../utils/di/injectable.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';

extension SignUpFieldExtension on SignInField {
  String get hintText => switch (this) {
        SignInField.email => getIt<AppLocalizations>().email,
        SignInField.password => getIt<AppLocalizations>().password,
      };
}
