import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../repositories/skin-type/local/skin_type.local.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class DeleteTestResultUseCase
    extends UseCase<void, DeleteTestResultUseCaseParams> {
  final SkinTypeLocalRepository skinTypeLocalRepository;

  const DeleteTestResultUseCase({
    required this.skinTypeLocalRepository,
  });

  @override
  Future<Either<DataException, void>> call(
    DeleteTestResultUseCaseParams params,
  ) async {
    try {
      var response = await skinTypeLocalRepository.deleteTestResult(
        params.id,
      );
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class DeleteTestResultUseCaseParams {
  final int id;

  const DeleteTestResultUseCaseParams({
    required this.id,
  });
}
