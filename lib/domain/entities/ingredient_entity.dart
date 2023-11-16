import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_entity.freezed.dart';
part 'ingredient_entity.g.dart';

@Freezed(copyWith: false, equal: false)
class IngredientEntity with _$IngredientEntity {
  const factory IngredientEntity({
    required int id,
    required String name,
    required String description,
  }) = _IngredientEntity;

  factory IngredientEntity.fromJson(Map<String, Object?> json) =>
      _$IngredientEntityFromJson(json);
}
