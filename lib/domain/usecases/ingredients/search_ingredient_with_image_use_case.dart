import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../../presentation/utils/extensions/list_extension.dart';
import '../../../utils/di/injectable.dart';
import '../../entities/ingredient_entity.dart';
import '../../repositories/ingredients/local/ingredients.local.repository.dart';
import '../../utils/usecase.dart';
import 'save_search_use_case.dart';

@LazySingleton()
class SearchIngredientWithImageUseCase extends UseCase<List<IngredientEntity>,
    SearchIngredientWithImageUseCaseParams> {
  final IngredientsLocalRepository ingredientsLocalRepository;

  const SearchIngredientWithImageUseCase({
    required this.ingredientsLocalRepository,
  });

  @override
  Future<Either<DataException, List<IngredientEntity>>> call(
    SearchIngredientWithImageUseCaseParams params,
  ) async {
    try {
      List<IngredientEntity> response = [];

      for (var element in params.search) {
        var ingredients = await ingredientsLocalRepository.getIngredients(
          search: element,
          limit: 1,
        );

        if (ingredients.isNotEmpty) {
          response.add(ingredients[0]);
        }
      }

      response = response.unique(
        (element) => element.id,
      );

      getIt<SaveSearchUseCase>()(SaveSearchUseCaseParams(
        image: params.image,
        results: response.map((e) => e.id).toList(),
      ));

      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class SearchIngredientWithImageUseCaseParams {
  final Uint8List image;
  final List<String> search;
  final int? limit;

  const SearchIngredientWithImageUseCaseParams({
    required this.image,
    this.search = const [],
    this.limit,
  });
}
