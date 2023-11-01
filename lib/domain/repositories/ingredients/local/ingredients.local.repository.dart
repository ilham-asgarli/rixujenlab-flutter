import '../../../../data/models/ingredients_model.dart';

abstract class IngredientsLocalRepository {
  Future<List<IngredientsModel>> getIngredients({String? search, int? limit});
  Future<void> putIngredients();
}
