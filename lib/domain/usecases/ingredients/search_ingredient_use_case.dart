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
class SearchIngredientUseCase
    extends UseCase<List<IngredientEntity>, SearchIngredientUseCaseParams> {
  final IngredientsLocalRepository ingredientsLocalRepository;

  const SearchIngredientUseCase({
    required this.ingredientsLocalRepository,
  });

  @override
  Future<Either<DataException, List<IngredientEntity>>> call(
      [SearchIngredientUseCaseParams? params]) async {
    try {
      var response = await ingredientsLocalRepository.getIngredients(
        search: params?.search,
        limit: params?.limit,
      );

      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class SearchIngredientUseCaseParams {
  final String? search;
  final int? limit;

  const SearchIngredientUseCaseParams({
    this.search,
    this.limit,
  });
}
