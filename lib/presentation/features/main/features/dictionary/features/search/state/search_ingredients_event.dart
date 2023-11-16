part of 'search_ingredients_bloc.dart';

@immutable
abstract class SearchIngredientsEvent {
  const SearchIngredientsEvent();
}

class Search extends SearchIngredientsEvent {
  final String search;

  const Search({
    required this.search,
  });
}
