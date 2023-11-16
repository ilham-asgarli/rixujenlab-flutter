import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/di/injectable.dart';
import '../config/router/config_router.dart';
import '../constants/cache/shared_preferences_constants.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';

extension MainDrawerExtension on MainDrawer {
  bool get visibility => switch (this) {
        MainDrawer.signIn => !(getIt<SharedPreferences>()
                .getBool(SharedPreferencesConstants.signedIn) ??
            false),
        MainDrawer.signUp => !(getIt<SharedPreferences>()
                .getBool(SharedPreferencesConstants.signedIn) ??
            false),
        MainDrawer.testResults => true,
      };

  String get text => switch (this) {
        MainDrawer.signIn => getIt<AppLocalizations>().signIn,
        MainDrawer.signUp => getIt<AppLocalizations>().signUp,
        MainDrawer.testResults => getIt<AppLocalizations>().testResults,
      };

  void onTap(BuildContext context) => switch (this) {
        MainDrawer.signIn => SignInViewRoute().push(context),
        MainDrawer.signUp => SignUpViewRoute().push(context),
        MainDrawer.testResults => TestResultsViewRoute().go(context),
      };
}
