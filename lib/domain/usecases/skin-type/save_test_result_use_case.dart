import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../../presentation/utils/constants/enums/app_enum.dart';
import '../../repositories/skin-type/local/skin_type.local.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class SaveTestResultUseCase extends UseCase<void, SaveTestResultUseCaseParams> {
  final SkinTypeLocalRepository skinTypeLocalRepository;

  const SaveTestResultUseCase({
    required this.skinTypeLocalRepository,
  });

  @override
  Future<Either<DataException, void>> call(
    SaveTestResultUseCaseParams params,
  ) async {
    try {
      var response = await skinTypeLocalRepository.saveTestResults(
        params.skinType,
      );
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class SaveTestResultUseCaseParams {
  final SkinType skinType;

  const SaveTestResultUseCaseParams({
    required this.skinType,
  });
}
