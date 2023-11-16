import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../presentation/utils/constants/enums/app_enum.dart';
import '../../../models/test_result_model.dart';

@LazySingleton()
class SkinTypeLocalDataSource {
  final Isar isar;

  const SkinTypeLocalDataSource({
    required this.isar,
  });

  Future<void> saveTestResult(SkinType skinType) async {
    await isar.writeTxn(() async {
      await isar.testResultModels.put(
        TestResultModel(
          skinType: skinType,
          createdAt: DateTime.now(),
        ),
      );
    });
  }

  Future<List<TestResultModel>> getTestResults({int? limit}) async {
    var query = isar.testResultModels.where().sortByCreatedAtDesc();
    var testResultModels =
        await (limit != null ? query.limit(limit) : query).findAll();

    return testResultModels;
  }

  Future<void> deleteTestResult(int id) async {
    await isar.writeTxn(() async {
      await isar.testResultModels.delete(id);
    });
  }
}
