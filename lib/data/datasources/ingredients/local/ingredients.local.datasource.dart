import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../utils/constants/di/isar_constants.dart';
import '../../../../utils/gen/assets.gen.dart';
import '../../../models/ingredients_model.dart';

@LazySingleton()
class IngredientsLocalDataSource {
  final Isar isar;

  const IngredientsLocalDataSource({
    @Named(IsarConstants.ingredients) required this.isar,
  });

  Future<void> putIngredients() async {
    await isar.writeTxn(() async {
      await isar.ingredientsModels.importJsonRaw(
          (await rootBundle.load(Assets.json.ingredients))
              .buffer
              .asUint8List());
    });
  }

  Future<List<IngredientsModel>> getIngredients(
      {String? search, int? limit}) async {
    var query = isar.ingredientsModels
        .filter()
        .nameContains(
          search ?? "",
          caseSensitive: false,
        )
        .sortByName();

    List<IngredientsModel> ingredientsModels =
        await (limit != null ? query.limit(limit) : query).findAll();

    return ingredientsModels;
  }
}
