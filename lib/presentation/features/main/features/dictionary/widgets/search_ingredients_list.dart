import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../domain/entities/ingredient_entity.dart';
import '../../../../../../domain/usecases/ingredients/save_search_use_case.dart';
import '../../../../../../utils/di/injectable.dart';
import '../../../../../utils/config/router/config_router.dart';
import '../../../../../utils/extensions/context_extension.dart';

class SearchIngredientsList extends StatelessWidget {
  final List<IngredientEntity> ingredientEntities;
  final bool save;

  const SearchIngredientsList({
    super.key,
    required this.ingredientEntities,
    this.save = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: ingredientEntities.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (save) {
              getIt<SaveSearchUseCase>()(SaveSearchUseCaseParams(
                results: ingredientEntities.map((e) => e.id).toList(),
              ));
            }
            SearchIngredientDetailsViewRoute(
              $extra: ingredientEntities[index],
            ).push(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.dynamicHeight(0.01),
              horizontal: context.dynamicWidth(0.1),
            ),
            child: Text(
              ingredientEntities[index].name,
              style: GoogleFonts.openSans(
                fontSize: 17,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
          color: Colors.yellow,
          height: 0,
        );
      },
    );
  }
}
