import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../entities/test_result_entity.dart';
import '../../repositories/skin-type/local/skin_type.local.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class GetTestResultsUseCase
    extends UseCase<List<TestResultEntity>, GetTestResultsUseCaseParams> {
  final SkinTypeLocalRepository skinTypeLocalRepository;

  const GetTestResultsUseCase({
    required this.skinTypeLocalRepository,
  });

  @override
  Future<Either<DataException, List<TestResultEntity>>> call(
      [GetTestResultsUseCaseParams? params]) async {
    try {
      var response = await skinTypeLocalRepository.getTestResults(
        limit: params?.limit,
      );
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class GetTestResultsUseCaseParams {
  final int? limit;

  const GetTestResultsUseCaseParams({
    this.limit,
  });
}
