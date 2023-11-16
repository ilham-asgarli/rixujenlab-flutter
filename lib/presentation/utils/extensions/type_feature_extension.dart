import '../../../utils/di/injectable.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';
import 'my_type_extension.dart';
import 'string_extension.dart';

extension TypeFeatureExtension on TypeFeature {
  String title(SkinType myType) => switch (this) {
        TypeFeature.definition =>
          '${myType.title.toFirstLetterCapitalized} ${getIt<AppLocalizations>().definition}: ',
        TypeFeature.care => "${getIt<AppLocalizations>().care}: ",
        TypeFeature.nutrition => "${getIt<AppLocalizations>().nutrition}: ",
      };

  String description(SkinType myType) => switch (this) {
        TypeFeature.definition => myType.definition,
        TypeFeature.care => myType.care,
        TypeFeature.nutrition => myType.nutrition,
      };
}
