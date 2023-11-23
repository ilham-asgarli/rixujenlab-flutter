import '../../../../presentation/utils/constants/enums/app_enum.dart';

abstract class SkinTypeRemoteRepository {
  Future<void> saveTestResults(String userId, SkinType skinType);
}
