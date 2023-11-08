import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../repositories/security/remote/security.remote.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class SignUpUseCase extends UseCase<void, SignUpUseCaseParams> {
  final SecurityRemoteRepository securityRemoteRepository;

  const SignUpUseCase({
    required this.securityRemoteRepository,
  });

  @override
  Future<Either<DataException, void>> call(SignUpUseCaseParams params) async {
    try {
      var response = await securityRemoteRepository.signUp(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
        userName: params.userName,
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
