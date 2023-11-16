import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../domain/entities/ingredient_entity.dart';
import '../../../../../../../../domain/usecases/ingredients/search_ingredient_use_case.dart';
import '../../../../../../../../utils/di/injectable.dart';

part 'search_ingredients_event.dart';
part 'search_ingredients_state.dart';

class SearchIngredientsBloc
    extends Bloc<SearchIngredientsEvent, SearchIngredientsState> {
  SearchIngredientsBloc()
      : super(const SearchIngredientsState(ingredientEntities: [])) {
    on<Search>(onSearch);
  }

  void onSearch(Search event, Emitter<SearchIngredientsState> emit) async {
    var ingredientEntities = await getIt<SearchIngredientUseCase>()(
      SearchIngredientUseCaseParams(search: event.search),
    );

    ingredientEntities.fold((l) {}, (r) {
      emit(SearchIngredientsState(ingredientEntities: r));
    });
  }
}
