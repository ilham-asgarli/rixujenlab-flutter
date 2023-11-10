import 'package:flutter/widgets.dart';

import '../../../utils/di/injectable.dart';
import '../../features/sign-in/view-models/sign_in_view_model.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';

extension SignInFieldExtension on SignInField {
  String get hintText => switch (this) {
        SignInField.email => getIt<AppLocalizations>().email,
        SignInField.password => getIt<AppLocalizations>().password,
      };

  bool get obscureText => switch (this) {
        SignInField.email => false,
        SignInField.password => true,
      };

  TextInputType get keyboardType => switch (this) {
        SignInField.email => TextInputType.emailAddress,
        SignInField.password => TextInputType.text,
      };

  TextEditingController controller(SignInViewModel signInViewModel) =>
      switch (this) {
        SignInField.email => signInViewModel.emailController,
        SignInField.password => signInViewModel.passwordController,
      };
}
