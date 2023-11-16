import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class IngredientModel with _$IngredientModel {
  const IngredientModel._();

  @DateTimeConverter()
  const factory IngredientModel({
    @Default(Isar.autoIncrement) Id isarId,
    required String name,
    required String description,
  }) = _IngredientModel;

  @override
  Id get isarId => Isar.autoIncrement;

  factory IngredientModel.fromJson(Map<String, Object?> json) =>
      _$IngredientModelFromJson(json);
}
