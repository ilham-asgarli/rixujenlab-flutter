import '../../../entities/user_entity.dart';

abstract class SecurityRemoteRepository {
  Future<UserEntity> getUser({required String id});

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  });

  Future<bool> signIn({
    required String email,
    required String password,
  });
}
