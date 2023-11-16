import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../domain/usecases/ingredients/search_ingredient_with_image_use_case.dart';
import '../../../../../../utils/di/injectable.dart';
import '../../../../../utils/config/router/config_router.dart';
import '../../../../../utils/helpers/google-ml-kit/google_ml_kit_helper.dart';

@injectable
class DictionaryViewModel {
  void onImageSearch(File? file, context) async {
    if (file != null) {
      String text = await getIt<GoogleMlKitHelper>().readTextFromImage(file);

      text = text.replaceAll("\n", " ");

      List<String> words = text.split(RegExp(
        r'[^a-zA-Z\s]+',
        caseSensitive: false,
      ));

      words = words.map((e) => e.trim()).toList();

      var response = await getIt<SearchIngredientWithImageUseCase>()(
          SearchIngredientWithImageUseCaseParams(
        image: await file.readAsBytes(),
        search: words,
      ));

      response.fold(
        (l) {},
        (r) {
          SearchIngredientsViewRoute($extra: r).go(context);
        },
      );
    }
  }
}
