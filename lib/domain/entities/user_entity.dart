import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@Freezed(copyWith: false, equal: false)
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);
}
