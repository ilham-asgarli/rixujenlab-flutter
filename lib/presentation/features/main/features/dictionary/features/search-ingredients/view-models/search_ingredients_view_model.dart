import 'package:injectable/injectable.dart';

import '../../../../../../../../domain/usecases/ingredients/get_ingredients_with_ids_use_case.dart';
import '../../../../../../../../utils/di/injectable.dart';

@injectable
class SearchIngredientsViewModel {
  Future getIngredients(ingredientEntities) =>
      getIt<GetIngredientsWithIdsUseCase>()(GetIngredientsWithIdsUseCaseParams(
        ids: ingredientEntities as List<int>,
      ));
}
