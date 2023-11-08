import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../repositories/security/remote/security.remote.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class SignInUseCase extends UseCase<bool, SignInUseCaseParams> {
  final SecurityRemoteRepository securityRemoteRepository;

  const SignInUseCase({
    required this.securityRemoteRepository,
  });

  @override
  Future<Either<DataException, bool>> call(SignInUseCaseParams params) async {
    try {
      var response = await securityRemoteRepository.signIn(
        email: params.email,
        password: params.password,
      );
      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class SignInUseCaseParams {
  final String email;
  final String password;

  const SignInUseCaseParams({
    required this.email,
    required this.password,
  });
}
