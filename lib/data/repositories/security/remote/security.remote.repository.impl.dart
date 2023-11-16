import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/security/remote/security.remote.repository.dart';
import '../../../datasources/security/remote/security.remote.data.source.dart';
import '../../../models/user_model.dart';
import '../../../utils/exceptions/network/custom.exception.dart';
import '../../../utils/exceptions/network/not_found.exception.dart';

@LazySingleton(as: SecurityRemoteRepository)
class SecurityRemoteRepositoryImpl implements SecurityRemoteRepository {
  final SecurityRemoteDataSource securityRemoteDataSource;

  const SecurityRemoteRepositoryImpl({
    required this.securityRemoteDataSource,
  });

  @override
  Future<UserEntity> getUser({required String id}) async {
    try {
      UserModel? userModel = await securityRemoteDataSource.getUser(id);
      if (userModel == null) {
        throw NotFoundException();
      }

      return UserEntity(
        email: userModel.email,
        password: userModel.password,
        fullName: userModel.fullName,
        userName: userModel.userName,
      );
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await securityRemoteDataSource.signIn(
        email: email,
        password: password,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  }) async {
    await securityRemoteDataSource.signUp(
      email: email,
      password: password,
      fullName: fullName,
      userName: userName,
    );
  }
}
