import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/di/injectable.dart';
import '../../../utils/gen/assets.gen.dart';
import '../../features/main/features/dictionary/view-models/dictionary_view_model.dart';
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

  Function onTap(context, DictionaryViewModel dictionaryViewModel) =>
      switch (this) {
        SkincareDictionary.takeAPhoto => () async {
            final file = await ImagePicker().pickImage(
              source: ImageSource.camera,
            );

            dictionaryViewModel.onImageSearch(
              file != null ? File(file.path) : null,
              context,
            );
          },
        SkincareDictionary.uploadPhoto => () async {
            final file = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );

            dictionaryViewModel.onImageSearch(
              file != null ? File(file.path) : null,
              context,
            );
          },
        SkincareDictionary.search => () {
            SearchViewRoute().go(context);
          },
      };
}
