import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../../presentation/utils/constants/cache/shared_preferences_constants.dart';
import '../../../utils/di/injectable.dart';
import '../../entities/user_entity.dart';
import '../../repositories/security/remote/security.remote.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class SignUpUseCase extends UseCase<UserEntity, SignUpUseCaseParams> {
  final SecurityRemoteRepository securityRemoteRepository;

  const SignUpUseCase({
    required this.securityRemoteRepository,
  });

  @override
  Future<Either<DataException, UserEntity>> call(
    SignUpUseCaseParams params,
  ) async {
    try {
      var response = await securityRemoteRepository.signUp(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
        userName: params.userName,
      );

      await getIt<SharedPreferences>().setString(
        SharedPreferencesConstants.userId,
        response.id,
      );
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class SignUpUseCaseParams {
  final String email;
  final String password;
  final String fullName;
  final String userName;

  const SignUpUseCaseParams({
    required this.email,
    required this.password,
    required this.fullName,
    required this.userName,
  });
}
