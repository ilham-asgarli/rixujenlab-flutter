import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/di/injectable.dart';
import '../../../utils/gen/assets.gen.dart';
import '../config/router/config_router.dart';
import '../constants/enums/app_enum.dart';
import '../helpers/google-ml-kit/google_ml_kit_helper.dart';
import '../l10n/gen/app_localizations.dart';
import 'context_extension.dart';

extension MainMenuExtension on SkincareDictionary {
  String get buttonText => switch (this) {
        SkincareDictionary.takeAPhoto =>
          getIt<AppLocalizations>().skincareDictionaryPhoto,
        SkincareDictionary.uploadPhoto =>
          getIt<AppLocalizations>().skincareDictionaryUpload,
        SkincareDictionary.search =>
          getIt<AppLocalizations>().search.toUpperCase(),
      };

  Widget get icon => switch (this) {
        SkincareDictionary.takeAPhoto => Assets.image.icCamera.image(
            height: getIt<BuildContext>().dynamicHeight(0.04),
          ),
        SkincareDictionary.uploadPhoto => Assets.image.icUpload.image(
            height: getIt<BuildContext>().dynamicHeight(0.04),
          ),
        SkincareDictionary.search => Assets.image.icSearch2.image(
            height: getIt<BuildContext>().dynamicHeight(0.04),
          ),
      };

  Function onTap(context) => switch (this) {
        SkincareDictionary.takeAPhoto => () async {
            final file = await ImagePicker().pickImage(
              source: ImageSource.camera,
            );

            if (file != null) {
              String text = await getIt<GoogleMlKitHelper>()
                  .readTextFromImage(File(file.path));
            }
          },
        SkincareDictionary.uploadPhoto => () async {
            final file = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );

            if (file != null) {
              String text = await getIt<GoogleMlKitHelper>()
                  .readTextFromImage(File(file.path));
            }
          },
        SkincareDictionary.search => () {
            SearchViewRoute().go(context);
          },
      };
}
