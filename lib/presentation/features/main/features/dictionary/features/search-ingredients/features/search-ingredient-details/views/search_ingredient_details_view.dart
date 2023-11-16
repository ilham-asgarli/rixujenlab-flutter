import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../../../domain/entities/ingredient_entity.dart';
import '../../../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../../../widgets/back.dart';
import '../../../../../../../../../widgets/bg_app_name.dart';
import '../view-models/search_ingredient_details_view_model.dart';

class SearchIngredientDetailsView extends StatelessWidget {
  final IngredientEntity ingredientEntity;
  final SearchIngredientDetailsViewModel searchIngredientDetailsViewModel;

  const SearchIngredientDetailsView({
    super.key,
    required this.searchIngredientDetailsViewModel,
    required this.ingredientEntity,
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
                  child: Column(
                    children: [
                      Text(
                        ingredientEntity.name,
                        style: GoogleFonts.openSans(
                          fontSize: 19,
                        ),
                      ),
                      context.dynamicVerticalSpace(0.01),
                      const Divider(
                        thickness: 2,
                        color: Colors.yellow,
                        height: 0,
                      ),
                      context.dynamicVerticalSpace(0.03),
                      Text(
                        ingredientEntity.description,
                        style: GoogleFonts.openSans(
                          fontSize: 17,
                        ),
                      ),
                    ],
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
