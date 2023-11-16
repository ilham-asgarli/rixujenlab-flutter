import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'ingredient_search_history_model.freezed.dart';
part 'ingredient_search_history_model.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class IngredientSearchHistoryModel with _$IngredientSearchHistoryModel {
  const IngredientSearchHistoryModel._();

  @DateTimeConverter()
  const factory IngredientSearchHistoryModel({
    @Default(Isar.autoIncrement) Id isarId,
    List<int>? image,
    required List<int> results,
    required DateTime createdAt,
  }) = _IngredientSearchHistoryModel;

  @override
  Id get isarId => Isar.autoIncrement;

  factory IngredientSearchHistoryModel.fromJson(Map<String, Object?> json) =>
      _$IngredientSearchHistoryModelFromJson(json);
}
