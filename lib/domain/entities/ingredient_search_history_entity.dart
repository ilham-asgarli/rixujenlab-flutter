import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_search_history_entity.freezed.dart';
part 'ingredient_search_history_entity.g.dart';

@Freezed(copyWith: false, equal: false)
class IngredientSearchHistoryEntity with _$IngredientSearchHistoryEntity {
  const factory IngredientSearchHistoryEntity({
    required int id,
    List<int>? image,
    required List<int> results,
    required DateTime createdAt,
  }) = _IngredientSearchHistoryEntity;

  factory IngredientSearchHistoryEntity.fromJson(Map<String, Object?> json) =>
      _$IngredientSearchHistoryEntityFromJson(json);
}
