import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../../presentation/utils/constants/cache/shared_preferences_constants.dart';
import '../../../presentation/utils/constants/enums/app_enum.dart';
import '../../../utils/di/injectable.dart';
import '../../repositories/skin-type/local/skin_type.local.repository.dart';
import '../../repositories/skin-type/remote/skin_type.remote.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class SaveTestResultUseCase extends UseCase<void, SaveTestResultUseCaseParams> {
  final SkinTypeLocalRepository skinTypeLocalRepository;
  final SkinTypeRemoteRepository skinTypeRemoteRepository;

  const SaveTestResultUseCase({
    required this.skinTypeLocalRepository,
    required this.skinTypeRemoteRepository,
  });

  @override
  Future<Either<DataException, void>> call(
    SaveTestResultUseCaseParams params,
  ) async {
    try {
      String? userId = getIt<SharedPreferences>().getString(
        SharedPreferencesConstants.userId,
      );

      if (userId != null) {
        skinTypeRemoteRepository.saveTestResults(
          userId,
          params.skinType,
        );
      }

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
