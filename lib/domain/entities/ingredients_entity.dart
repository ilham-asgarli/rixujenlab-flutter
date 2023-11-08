import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredients_entity.freezed.dart';
part 'ingredients_entity.g.dart';

@Freezed(copyWith: false, equal: false)
class IngredientsEntity with _$IngredientsEntity {
  const factory IngredientsEntity({
    required String name,
    required String description,
  }) = _IngredientsEntity;

  factory IngredientsEntity.fromJson(Map<String, Object?> json) =>
      _$IngredientsEntityFromJson(json);
}
