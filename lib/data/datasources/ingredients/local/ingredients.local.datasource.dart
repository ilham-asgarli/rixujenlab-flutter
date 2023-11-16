import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../utils/gen/assets.gen.dart';
import '../../../models/ingredient_model.dart';
import '../../../models/ingredient_search_history_model.dart';

@LazySingleton()
class IngredientsLocalDataSource {
  final Isar isar;

  const IngredientsLocalDataSource({
    required this.isar,
  });

  Future<void> putIngredients() async {
    if ((await isar.ingredientModels.count()) > 0) return;

    await isar.writeTxn(() async {
      await isar.ingredientModels.importJsonRaw(
          (await rootBundle.load(Assets.json.ingredients))
              .buffer
              .asUint8List());
    });
  }

  Future<List<IngredientModel>> getIngredientsWithIds({
    required List<int> ids,
  }) async {
    List<IngredientModel> ingredientModels = [];
    for (var id in ids) {
      var ingredientModel =
          await isar.ingredientModels.filter().isarIdEqualTo(id).findFirst();
      if (ingredientModel != null) ingredientModels.add(ingredientModel);
    }
    return ingredientModels;
  }

  Future<List<IngredientModel>> getIngredients({
    String? search,
    int? limit,
  }) async {
    var match = await isar.ingredientModels
        .filter()
        .nameMatches(
          search ?? "",
          caseSensitive: false,
        )
        .findFirst();

    var startWith = await isar.ingredientModels
        .filter()
        .nameStartsWith(
          search ?? "",
          caseSensitive: false,
        )
        .findFirst();

    var query = isar.ingredientModels
        .filter()
        .nameContains(
          search ?? "",
          caseSensitive: false,
        )
        .sortByName();

    List<IngredientModel> contains =
        await (limit != null ? query.limit(limit) : query).findAll();

    List<IngredientModel> ingredientModels = [];

    if (match != null) {
      ingredientModels.add(match);
      contains.removeWhere((element) => element.isarId == match.isarId);
    }

    if (startWith != null) {
      ingredientModels.add(startWith);
      contains.removeWhere((element) => element.isarId == startWith.isarId);
    }

    return ingredientModels..addAll(contains);
  }

  Future<void> saveSearchHistory({
    List<int>? image,
    required List<int> results,
  }) async {
    await isar.writeTxn(() async {
      await isar.ingredientSearchHistoryModels.put(
        IngredientSearchHistoryModel(
          image: image,
          results: results,
          createdAt: DateTime.now(),
        ),
      );
    });
  }

  Future<List<IngredientSearchHistoryModel>> getSearchHistory({
    int? limit,
  }) async {
    var query =
        isar.ingredientSearchHistoryModels.where().sortByCreatedAtDesc();
    var ingredientSearchHistoryModels =
        await (limit != null ? query.limit(limit) : query).findAll();

    return ingredientSearchHistoryModels;
  }
}
