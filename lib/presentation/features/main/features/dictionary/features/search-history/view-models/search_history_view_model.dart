import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../data/utils/exceptions/data.exception.dart';
import '../../../../../../../../domain/entities/ingredient_search_history_entity.dart';
import '../../../../../../../../domain/usecases/ingredients/get_ingredient_search_history_use_case.dart';
import '../../../../../../../../utils/di/injectable.dart';

@injectable
class SearchHistoryViewModel {
  final Future<Either<DataException, List<IngredientSearchHistoryEntity>>>
      getIngredientSearchHistory = getIt<GetIngredientSearchHistoryUseCase>()(
    const GetIngredientSearchHistoryUseCaseParams(),
  );
}
