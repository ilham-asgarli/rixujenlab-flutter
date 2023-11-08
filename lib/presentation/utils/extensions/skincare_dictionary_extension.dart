import 'package:flutter/material.dart';

import '../../../utils/di/injectable.dart';
import '../../../utils/gen/assets.gen.dart';
import '../config/router/config_router.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';
import 'context_extension.dart';

extension MainMenuExtension on SkincareDictionary {
  String get buttonText => switch (this) {
        SkincareDictionary.takeAPhoto =>
          getIt<AppLocalizations>().skincareDictionaryPhoto,
        SkincareDictionary.uploadPhoto =>
          getIt<AppLocalizations>().skincareDictionaryUpload,
        SkincareDictionary.searchManually =>
          getIt<AppLocalizations>().skincareDictionarySearch,
      };

  Widget get icon => switch (this) {
        SkincareDictionary.takeAPhoto => Assets.image.icCamera.image(
            height: getIt<BuildContext>().dynamicHeight(0.04),
          ),
        SkincareDictionary.uploadPhoto => Assets.image.icUpload.image(
            height: getIt<BuildContext>().dynamicHeight(0.04),
          ),
        SkincareDictionary.searchManually => Assets.image.icSearch2.image(
            height: getIt<BuildContext>().dynamicHeight(0.04),
          ),
      };

  void onTap(context) => switch (this) {
        SkincareDictionary.takeAPhoto => LearnTypeViewRoute().go(context),
        SkincareDictionary.uploadPhoto => DictionaryViewRoute().go(context),
        SkincareDictionary.searchManually => TipsViewRoute().go(context),
      };
}
