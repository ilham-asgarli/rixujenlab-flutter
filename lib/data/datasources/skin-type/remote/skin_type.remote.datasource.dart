import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../presentation/utils/constants/enums/app_enum.dart';
import '../../../models/test_result_model.dart';

@LazySingleton()
class SkinTypeRemoteDataSource {
  final testResultsRef = FirebaseFirestore.instance
      .collection('test-results')
      .withConverter<TestResultModel>(
        fromFirestore: (snapshots, _) =>
            TestResultModel.fromJson(snapshots.data()!),
        toFirestore: (model, _) => model.toJson()..remove("runtimeType"),
      );

  Future<void> saveTestResult(String userId, SkinType skinType) async {
    await testResultsRef.add(TestResultModel.online(
      userId: userId,
      skinType: skinType,
      createdAt: DateTime.now(),
    ));
  }
}
