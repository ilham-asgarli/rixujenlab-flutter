import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/utils/constants/enums/app_enum.dart';

part 'test_result_entity.freezed.dart';
part 'test_result_entity.g.dart';

@Freezed(copyWith: false, equal: false)
class TestResultEntity with _$TestResultEntity {
  const factory TestResultEntity({
    required int id,
    required SkinType skinType,
    required DateTime createdAt,
  }) = _TestResultEntity;

  factory TestResultEntity.fromJson(Map<String, Object?> json) =>
      _$TestResultEntityFromJson(json);
}
