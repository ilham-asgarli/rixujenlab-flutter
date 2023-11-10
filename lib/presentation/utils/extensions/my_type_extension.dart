import '../../../utils/di/injectable.dart';
import '../../../utils/gen/assets.gen.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';

extension MyTypeExtension on MyType {
  String get title => switch (this) {
        MyType.sensitive => getIt<AppLocalizations>().sensitive,
        MyType.dry => getIt<AppLocalizations>().dry,
        MyType.oily => getIt<AppLocalizations>().oily,
        MyType.combination => getIt<AppLocalizations>().combination,
        MyType.normal => getIt<AppLocalizations>().normal,
      };

  String get icon => switch (this) {
        MyType.sensitive => Assets.image.icSensitiveSkin.path,
        MyType.dry => Assets.image.icDrySkin.path,
        MyType.oily => Assets.image.icOilySkin.path,
        MyType.combination => Assets.image.icCombinationSkin.path,
        MyType.normal => Assets.image.icNormalSkin.path,
      };

  String get care => switch (this) {
        MyType.sensitive => getIt<AppLocalizations>().sensitiveCare,
        MyType.dry => getIt<AppLocalizations>().dryCare,
        MyType.oily => getIt<AppLocalizations>().oilyCare,
        MyType.combination => getIt<AppLocalizations>().combinationCare,
        MyType.normal => getIt<AppLocalizations>().normalCare,
      };

  String get definition => switch (this) {
        MyType.sensitive => getIt<AppLocalizations>().sensitiveDefinition,
        MyType.dry => getIt<AppLocalizations>().dryDefinition,
        MyType.oily => getIt<AppLocalizations>().oilyDefinition,
        MyType.combination => getIt<AppLocalizations>().combinationDefinition,
        MyType.normal => getIt<AppLocalizations>().normalDefinition,
      };

  String get nutrition => switch (this) {
        MyType.sensitive => getIt<AppLocalizations>().sensitiveNutrition,
        MyType.dry => getIt<AppLocalizations>().dryNutrition,
        MyType.oily => getIt<AppLocalizations>().oilyNutrition,
        MyType.combination => getIt<AppLocalizations>().combinationNutrition,
        MyType.normal => getIt<AppLocalizations>().normalNutrition,
      };
}
