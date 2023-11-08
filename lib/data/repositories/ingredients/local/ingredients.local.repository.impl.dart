import 'package:injectable/injectable.dart';

import '../../../../domain/entities/ingredients_entity.dart';
import '../../../../domain/repositories/ingredients/local/ingredients.local.repository.dart';
import '../../../datasources/ingredients/local/ingredients.local.datasource.dart';
import '../../../models/ingredients_model.dart';
import '../../../utils/exceptions/local/custom.exception.dart';

@LazySingleton(as: IngredientsLocalRepository)
class IngredientsLocalRepositoryImpl implements IngredientsLocalRepository {
  final IngredientsLocalDataSource ingredientsLocalDataSource;

  const IngredientsLocalRepositoryImpl({
    required this.ingredientsLocalDataSource,
  });

  @override
  Future<List<IngredientsEntity>> getIngredients({
    String? search,
    int? limit,
  }) async {
    List<IngredientsModel> ingredientModels =
        await ingredientsLocalDataSource.getIngredients(
      search: search,
      limit: limit,
    );

    return ingredientModels
        .map((e) => IngredientsEntity(name: e.name, description: e.description))
        .toList();
  }

  @override
  Future<void> putIngredients() async {
    try {
      await ingredientsLocalDataSource.putIngredients();
    } catch (e) {
      throw CustomLocalException(message: e.toString());
    }
  }
}
