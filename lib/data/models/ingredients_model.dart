import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'ingredients_model.freezed.dart';
part 'ingredients_model.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class IngredientsModel with _$IngredientsModel {
  const IngredientsModel._();

  @DateTimeConverter()
  const factory IngredientsModel({
    required String name,
    required String description,
  }) = _IngredientsModel;

  Id get isarId => Isar.autoIncrement;

  factory IngredientsModel.fromJson(Map<String, Object?> json) =>
      _$IngredientsModelFromJson(json);
}
