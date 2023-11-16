import '../../../entities/ingredient_entity.dart';
import '../../../entities/ingredient_search_history_entity.dart';

abstract class IngredientsLocalRepository {
  Future<List<IngredientEntity>> getIngredientsWithIds({
    required List<int> ids,
  });
  Future<List<IngredientEntity>> getIngredients({String? search, int? limit});
  Future<void> putIngredients();
  Future<void> saveSearchHistory({
    List<int>? image,
    required List<int> results,
  });
  Future<List<IngredientSearchHistoryEntity>> getSearchHistory({int? limit});
}
