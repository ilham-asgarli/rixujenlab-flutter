import 'package:fnv/fnv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../utils/helpers/json-serializable/timestamp_converter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class UserModel with _$UserModel {
  const UserModel._();

  @TimestampConverter()
  const factory UserModel({
    required String id,
    required String email,
    required String password,
    required String fullName,
    required String userName,
    required DateTime createdAt,
  }) = _UserModel;

  Id get isarId => fnv1_64_s(id);

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
