import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../presentation/utils/constants/enums/app_enum.dart';
import '../../utils/helpers/json-serializable/timestamp_converter.dart';

part 'test_result_model.freezed.dart';
part 'test_result_model.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class TestResultModel with _$TestResultModel {
  const TestResultModel._();

  const factory TestResultModel({
    @Default(Isar.autoIncrement) Id isarId,
    @enumerated required SkinType skinType,
    required DateTime createdAt,
  }) = _TestResultModel;

  @TimestampConverter()
  @ignore
  const factory TestResultModel.online({
    required String userId,
    required SkinType skinType,
    required DateTime createdAt,
  }) = _TestResultModelOnline;

  @override
  Id get isarId => Isar.autoIncrement;

  factory TestResultModel.fromJson(Map<String, Object?> json) =>
      _$TestResultModelFromJson(json);
}
