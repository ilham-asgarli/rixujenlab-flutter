import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../repositories/ingredients/local/ingredients.local.repository.dart';
import '../../utils/no_params.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class PutIngredientsUseCase extends UseCase<void, NoParams> {
  final IngredientsLocalRepository ingredientsLocalRepository;

  const PutIngredientsUseCase({
    required this.ingredientsLocalRepository,
  });

  @override
  Future<Either<DataException, void>> call(NoParams params) async {
    try {
      var response = await ingredientsLocalRepository.putIngredients();
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}
