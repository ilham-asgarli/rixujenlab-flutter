import 'package:flutter/cupertino.dart';

import '../../../utils/di/injectable.dart';
import '../../../utils/gen/assets.gen.dart';
import '../constants/enums/app_enum.dart';
import '../l10n/gen/app_localizations.dart';
import 'context_extension.dart';

extension RoutinesStepsExtension on RoutinesSteps {
  String get title => switch (this) {
        RoutinesSteps.cleanser => getIt<AppLocalizations>().routinesStepCleanserTitle,
        RoutinesSteps.toner => getIt<AppLocalizations>().routinesStepTonerTitle,
        RoutinesSteps.faceSerum => getIt<AppLocalizations>().routinesStepFaceSerumTitle,
        RoutinesSteps.moisturizer => getIt<AppLocalizations>().routinesStepMoisturizerTitle,
        RoutinesSteps.eyeCream => getIt<AppLocalizations>().routinesStepEyeCreamTitle,
        RoutinesSteps.sunScreen => getIt<AppLocalizations>().routinesStepSunscreenTitle,
      };

  String get description => switch (this) {
        RoutinesSteps.cleanser => getIt<AppLocalizations>().routinesStepCleanserDescription,
        RoutinesSteps.toner => getIt<AppLocalizations>().routinesStepTonerDescription,
        RoutinesSteps.faceSerum => getIt<AppLocalizations>().routinesStepFaceSerumDescription,
        RoutinesSteps.moisturizer => getIt<AppLocalizations>().routinesStepMoisturizerDescription,
        RoutinesSteps.eyeCream => getIt<AppLocalizations>().routinesStepEyeCreamDescription,
        RoutinesSteps.sunScreen => getIt<AppLocalizations>().routinesStepSunscreenDescription,
      };

  String get myIndex => switch (this) {
        RoutinesSteps.cleanser => "1",
        RoutinesSteps.toner => "2",
        RoutinesSteps.faceSerum => "3",
        RoutinesSteps.moisturizer => "4",
        RoutinesSteps.eyeCream => "5",
        RoutinesSteps.sunScreen => "6",
      };

  AssetGenImage get womanIcon => switch (this) {
        RoutinesSteps.cleanser => Assets.image.icMakeUp1,
        RoutinesSteps.toner => Assets.image.icMakeUp2,
        RoutinesSteps.faceSerum => Assets.image.icMakeUp3,
        RoutinesSteps.moisturizer => Assets.image.icMakeUp4,
        RoutinesSteps.eyeCream => Assets.image.icMakeUp5,
        RoutinesSteps.sunScreen => Assets.image.icMakeUp6,
      };

  bool get iconFirst => switch (this) {
        RoutinesSteps.cleanser => true,
        RoutinesSteps.toner => false,
        RoutinesSteps.faceSerum => true,
        RoutinesSteps.moisturizer => false,
        RoutinesSteps.eyeCream => true,
        RoutinesSteps.sunScreen => false,
      };
}
