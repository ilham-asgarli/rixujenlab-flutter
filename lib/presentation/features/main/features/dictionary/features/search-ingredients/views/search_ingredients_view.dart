import 'package:flutter/material.dart';

import '../../../../../../../../domain/entities/ingredient_entity.dart';
import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../widgets/back.dart';
import '../../../../../../../widgets/bg_app_name.dart';
import '../../../widgets/search_ingredients_list.dart';
import '../view-models/search_ingredients_view_model.dart';

class SearchIngredientsView extends StatelessWidget {
  final List<dynamic> ingredientEntities;
  final SearchIngredientsViewModel searchIngredientsViewModel;

  const SearchIngredientsView({
    super.key,
    required this.searchIngredientsViewModel,
    required this.ingredientEntities,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Back(
          child: BgAppName(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Assets.image.icBg8Png.image(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: context.dynamicHeight(0.05),
                  child: Assets.image.icChemicals.image(
                    width: context.dynamicWidth(0.4),
                  ),
                ),
                Positioned(
                  left: context.dynamicWidth(0.1),
                  right: context.dynamicWidth(0.1),
                  bottom: context.dynamicHeight(0.08),
                  top: context.dynamicHeight(0.25),
                  child: ingredientEntities is List<IngredientEntity>
                      ? SearchIngredientsList(
                          ingredientEntities:
                              ingredientEntities as List<IngredientEntity>,
                        )
                      : FutureBuilder(
                          future: searchIngredientsViewModel
                              .getIngredients(ingredientEntities),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return snapshot.data!.fold(
                                (l) => const SizedBox(),
                                (r) => SearchIngredientsList(
                                  ingredientEntities: r,
                                ),
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
