import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../entities/ingredient_entity.dart';
import '../../repositories/ingredients/local/ingredients.local.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class GetIngredientsWithIdsUseCase extends UseCase<List<IngredientEntity>,
    GetIngredientsWithIdsUseCaseParams> {
  final IngredientsLocalRepository ingredientsLocalRepository;

  const GetIngredientsWithIdsUseCase({
    required this.ingredientsLocalRepository,
  });

  @override
  Future<Either<DataException, List<IngredientEntity>>> call(
    GetIngredientsWithIdsUseCaseParams params,
  ) async {
    try {
      var response = await ingredientsLocalRepository.getIngredientsWithIds(
        ids: params.ids,
      );
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class GetIngredientsWithIdsUseCaseParams {
  final List<int> ids;

  const GetIngredientsWithIdsUseCaseParams({
    required this.ids,
  });
}
