import 'package:injectable/injectable.dart';

import '../../../../domain/entities/ingredient_entity.dart';
import '../../../../domain/entities/ingredient_search_history_entity.dart';
import '../../../../domain/repositories/ingredients/local/ingredients.local.repository.dart';
import '../../../datasources/ingredients/local/ingredients.local.datasource.dart';
import '../../../models/ingredient_model.dart';
import '../../../models/ingredient_search_history_model.dart';

@LazySingleton(as: IngredientsLocalRepository)
class IngredientsLocalRepositoryImpl implements IngredientsLocalRepository {
  final IngredientsLocalDataSource ingredientsLocalDataSource;

  const IngredientsLocalRepositoryImpl({
    required this.ingredientsLocalDataSource,
  });

  @override
  Future<List<IngredientEntity>> getIngredients({
    String? search,
    int? limit,
  }) async {
    List<IngredientModel> ingredientModels =
        await ingredientsLocalDataSource.getIngredients(
      search: search,
      limit: limit,
    );

    return ingredientModels
        .map((e) => IngredientEntity(
              id: e.isarId,
              name: e.name,
              description: e.description,
            ))
        .toList();
  }

  @override
  Future<void> putIngredients() async {
    await ingredientsLocalDataSource.putIngredients();
  }

  @override
  Future<List<IngredientSearchHistoryEntity>> getSearchHistory({
    int? limit,
  }) async {
    List<IngredientSearchHistoryModel> ingredientSearchHistoryModels =
        await ingredientsLocalDataSource.getSearchHistory(
      limit: limit,
    );

    return ingredientSearchHistoryModels
        .map((e) => IngredientSearchHistoryEntity(
              id: e.isarId,
              image: e.image,
              results: e.results,
              createdAt: e.createdAt,
            ))
        .toList();
  }

  @override
  Future<void> saveSearchHistory({
    List<int>? image,
    required List<int> results,
  }) async {
    await ingredientsLocalDataSource.saveSearchHistory(
      image: image,
      results: results,
    );
  }

  @override
  Future<List<IngredientEntity>> getIngredientsWithIds({
    required List<int> ids,
  }) async {
    List<IngredientModel> ingredientModels =
        await ingredientsLocalDataSource.getIngredientsWithIds(ids: ids);

    return ingredientModels
        .map((e) => IngredientEntity(
              id: e.isarId,
              name: e.name,
              description: e.description,
            ))
        .toList();
  }
}
