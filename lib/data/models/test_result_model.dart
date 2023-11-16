import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../presentation/utils/constants/enums/app_enum.dart';
import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'test_result_model.freezed.dart';
part 'test_result_model.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class TestResultModel with _$TestResultModel {
  const TestResultModel._();

  @DateTimeConverter()
  const factory TestResultModel({
    @Default(Isar.autoIncrement) Id isarId,
    @enumerated required SkinType skinType,
    required DateTime createdAt,
  }) = _TestResultModel;

  @override
  Id get isarId => Isar.autoIncrement;

  factory TestResultModel.fromJson(Map<String, Object?> json) =>
      _$TestResultModelFromJson(json);
}
