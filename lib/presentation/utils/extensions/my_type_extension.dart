import '../../../utils/di/injectable.dart';
import '../../../utils/gen/assets.gen.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';

extension MyTypeExtension on SkinType {
  String get title => switch (this) {
        SkinType.sensitive => getIt<AppLocalizations>().sensitive,
        SkinType.dry => getIt<AppLocalizations>().dry,
        SkinType.oily => getIt<AppLocalizations>().oily,
        SkinType.combination => getIt<AppLocalizations>().combination,
        SkinType.normal => getIt<AppLocalizations>().normal,
      };

  String get icon => switch (this) {
        SkinType.sensitive => Assets.image.icSensitiveSkin.path,
        SkinType.dry => Assets.image.icDrySkin.path,
        SkinType.oily => Assets.image.icOilySkin.path,
        SkinType.combination => Assets.image.icCombinationSkin.path,
        SkinType.normal => Assets.image.icNormalSkin.path,
      };

  String get care => switch (this) {
        SkinType.sensitive => getIt<AppLocalizations>().sensitiveCare,
        SkinType.dry => getIt<AppLocalizations>().dryCare,
        SkinType.oily => getIt<AppLocalizations>().oilyCare,
        SkinType.combination => getIt<AppLocalizations>().combinationCare,
        SkinType.normal => getIt<AppLocalizations>().normalCare,
      };

  String get definition => switch (this) {
        SkinType.sensitive => getIt<AppLocalizations>().sensitiveDefinition,
        SkinType.dry => getIt<AppLocalizations>().dryDefinition,
        SkinType.oily => getIt<AppLocalizations>().oilyDefinition,
        SkinType.combination => getIt<AppLocalizations>().combinationDefinition,
        SkinType.normal => getIt<AppLocalizations>().normalDefinition,
      };

  String get nutrition => switch (this) {
        SkinType.sensitive => getIt<AppLocalizations>().sensitiveNutrition,
        SkinType.dry => getIt<AppLocalizations>().dryNutrition,
        SkinType.oily => getIt<AppLocalizations>().oilyNutrition,
        SkinType.combination => getIt<AppLocalizations>().combinationNutrition,
        SkinType.normal => getIt<AppLocalizations>().normalNutrition,
      };
}
