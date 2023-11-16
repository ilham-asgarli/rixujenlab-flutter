part of 'search_ingredients_bloc.dart';

@immutable
class SearchIngredientsState {
  final List<IngredientEntity> ingredientEntities;

  const SearchIngredientsState({
    required this.ingredientEntities,
  });
}
