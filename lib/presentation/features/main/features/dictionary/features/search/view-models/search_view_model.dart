import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../state/search_ingredients_bloc.dart';

@injectable
class SearchViewModel {
  void onChanged(BuildContext context, String search) {
    if (search.length >= 3) {
      BlocProvider.of<SearchIngredientsBloc>(context)
          .add(Search(search: search));
    }
  }
}
