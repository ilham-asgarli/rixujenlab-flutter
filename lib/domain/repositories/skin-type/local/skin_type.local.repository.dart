import '../../../../presentation/utils/constants/enums/app_enum.dart';
import '../../../entities/test_result_entity.dart';

abstract class SkinTypeLocalRepository {
  Future<List<TestResultEntity>> getTestResults({int? limit});
  Future<void> saveTestResults(SkinType skinType);
  Future<void> deleteTestResult(int id);
}
