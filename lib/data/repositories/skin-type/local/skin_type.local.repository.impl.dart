import 'package:injectable/injectable.dart';

import '../../../../domain/entities/test_result_entity.dart';
import '../../../../domain/repositories/skin-type/local/skin_type.local.repository.dart';
import '../../../../presentation/utils/constants/enums/app_enum.dart';
import '../../../datasources/skin-type/local/skin_type.local.datasource.dart';
import '../../../models/test_result_model.dart';

@LazySingleton(as: SkinTypeLocalRepository)
class SkinTypeLocalRepositoryImpl implements SkinTypeLocalRepository {
  final SkinTypeLocalDataSource skinTypeLocalDataSource;

  const SkinTypeLocalRepositoryImpl({
    required this.skinTypeLocalDataSource,
  });

  @override
  Future<List<TestResultEntity>> getTestResults({int? limit}) async {
    List<TestResultModel> testResultModels =
        await skinTypeLocalDataSource.getTestResults(
      limit: limit,
    );

    return testResultModels
        .map((e) => TestResultEntity(
              id: e.isarId,
              skinType: e.skinType,
              createdAt: e.createdAt,
            ))
        .toList();
  }

  @override
  Future<void> saveTestResults(SkinType skinType) async {
    await skinTypeLocalDataSource.saveTestResult(skinType);
  }

  @override
  Future<void> deleteTestResult(int id) async {
    await skinTypeLocalDataSource.deleteTestResult(id);
  }
}
