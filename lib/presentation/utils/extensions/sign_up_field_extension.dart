import 'package:flutter/widgets.dart';

import '../../../utils/di/injectable.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';

extension SignUpFieldExtension on SignUpField {
  String get hintText => switch (this) {
        SignUpField.fullName => getIt<AppLocalizations>().fullName,
        SignUpField.userName => getIt<AppLocalizations>().userName,
        SignUpField.email => getIt<AppLocalizations>().email,
        SignUpField.password => getIt<AppLocalizations>().password,
      };

  bool get obscureText => switch (this) {
        SignUpField.fullName => false,
        SignUpField.userName => false,
        SignUpField.email => false,
        SignUpField.password => true,
      };

  TextInputType get keyboardType => switch (this) {
        SignUpField.fullName => TextInputType.text,
        SignUpField.userName => TextInputType.text,
        SignUpField.email => TextInputType.emailAddress,
        SignUpField.password => TextInputType.text,
      };
}
