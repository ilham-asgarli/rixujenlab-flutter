import 'package:flutter/material.dart';

import '../../../utils/di/injectable.dart';
import '../../../utils/gen/assets.gen.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';
import 'context_extension.dart';

extension MainMenuExtension on MainMenu {
  String get title => switch (this) {
        MainMenu.skinType => getIt<AppLocalizations>().mainMenuSkinTypeTitle,
        MainMenu.dictionary =>
          getIt<AppLocalizations>().mainMenuDictionaryTitle,
        MainMenu.tips => getIt<AppLocalizations>().mainMenuTipsTitle,
        MainMenu.routine => getIt<AppLocalizations>().mainMenuRoutineTitle,
      };

  String get description => switch (this) {
        MainMenu.skinType =>
          getIt<AppLocalizations>().mainMenuSkinTypeDescription,
        MainMenu.dictionary =>
          getIt<AppLocalizations>().mainMenuDictionaryDescription,
        MainMenu.tips => getIt<AppLocalizations>().mainMenuTipsDescription,
        MainMenu.routine =>
          getIt<AppLocalizations>().mainMenuRoutineDescription,
      };

  Color get borderColor => switch (this) {
        MainMenu.skinType => const Color(0xFFFADE3F),
        MainMenu.dictionary => const Color(0xFFFF66C4),
        MainMenu.tips => const Color(0xFF5CE1E6),
        MainMenu.routine => const Color(0xFFBDFE5A),
      };

  Widget get icon => switch (this) {
        MainMenu.skinType => Assets.image.icTime.image(
            height: getIt<BuildContext>().dynamicHeight(0.07),
          ),
        MainMenu.dictionary => Assets.image.icSearch1.image(
            height: getIt<BuildContext>().dynamicHeight(0.06),
          ),
        MainMenu.tips => Assets.image.icBulb2.image(
            height: getIt<BuildContext>().dynamicHeight(0.09),
          ),
        MainMenu.routine => Assets.image.icNaturalChemicals.image(
            height: getIt<BuildContext>().dynamicHeight(0.08),
          ),
      };

  AssetGenImage get womanIcon => switch (this) {
        MainMenu.skinType => Assets.image.icWoman1,
        MainMenu.dictionary => Assets.image.icWoman2,
        MainMenu.tips => Assets.image.icWoman3,
        MainMenu.routine => Assets.image.icWoman4,
      };

  bool get iconFirst => switch (this) {
        MainMenu.skinType => false,
        MainMenu.dictionary => true,
        MainMenu.tips => false,
        MainMenu.routine => true,
      };
}
