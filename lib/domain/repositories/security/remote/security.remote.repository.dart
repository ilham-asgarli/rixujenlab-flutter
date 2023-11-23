import '../../../entities/user_entity.dart';

abstract class SecurityRemoteRepository {
  Future<UserEntity> getUser({required String id});

  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  });

  Future<UserEntity?> signIn({
    required String email,
    required String password,
  });
}
