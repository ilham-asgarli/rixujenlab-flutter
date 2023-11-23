import 'package:injectable/injectable.dart';

import '../../../../domain/repositories/skin-type/remote/skin_type.remote.repository.dart';
import '../../../../presentation/utils/constants/enums/app_enum.dart';
import '../../../datasources/skin-type/remote/skin_type.remote.datasource.dart';

@LazySingleton(as: SkinTypeRemoteRepository)
class SkinTypeRemoteRepositoryImpl implements SkinTypeRemoteRepository {
  final SkinTypeRemoteDataSource skinTypeRemoteDataSource;

  const SkinTypeRemoteRepositoryImpl({
    required this.skinTypeRemoteDataSource,
  });

  @override
  Future<void> saveTestResults(String userId, SkinType skinType) async {
    await skinTypeRemoteDataSource.saveTestResult(userId, skinType);
  }
}
