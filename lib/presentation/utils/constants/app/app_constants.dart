import 'package:flutter/material.dart';

import '../../../../utils/di/injectable.dart';
import '../../l10n/gen/app_localizations.dart';

abstract class AppConstants {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final List<String> tips = [
    getIt<AppLocalizations>().tip1,
    getIt<AppLocalizations>().tip2,
    getIt<AppLocalizations>().tip3,
    getIt<AppLocalizations>().tip4,
    getIt<AppLocalizations>().tip5,
  ];
}
