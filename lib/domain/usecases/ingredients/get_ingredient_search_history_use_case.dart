import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../entities/ingredient_search_history_entity.dart';
import '../../repositories/ingredients/local/ingredients.local.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class GetIngredientSearchHistoryUseCase extends UseCase<
    List<IngredientSearchHistoryEntity>,
    GetIngredientSearchHistoryUseCaseParams> {
  final IngredientsLocalRepository ingredientsLocalRepository;

  const GetIngredientSearchHistoryUseCase({
    required this.ingredientsLocalRepository,
  });

  @override
  Future<Either<DataException, List<IngredientSearchHistoryEntity>>> call(
    GetIngredientSearchHistoryUseCaseParams params,
  ) async {
    try {
      var response = await ingredientsLocalRepository.getSearchHistory(
        limit: params.limit,
      );
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class GetIngredientSearchHistoryUseCaseParams {
  final int? limit;

  const GetIngredientSearchHistoryUseCaseParams({
    this.limit,
  });
}
