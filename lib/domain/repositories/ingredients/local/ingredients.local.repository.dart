import '../../../entities/ingredients_entity.dart';

abstract class IngredientsLocalRepository {
  Future<List<IngredientsEntity>> getIngredients({String? search, int? limit});
  Future<void> putIngredients();
}
