import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../domain/entities/ingredient_search_history_entity.dart';
import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../utils/config/router/config_router.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../utils/extensions/date_time_extension.dart';

class SearchHistoryList extends StatelessWidget {
  final List<IngredientSearchHistoryEntity> ingredientSearchHistoryEntities;

  const SearchHistoryList({
    super.key,
    required this.ingredientSearchHistoryEntities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: ingredientSearchHistoryEntities.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            SearchIngredientsViewRoute(
                    $extra: ingredientSearchHistoryEntities[index].results)
                .push(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.dynamicHeight(0.01),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ingredientSearchHistoryEntities[index].image != null
                    ? Image.memory(
                        Uint8List.fromList(
                          ingredientSearchHistoryEntities[index].image!,
                        ),
                        width: context.dynamicWidth(0.3),
                        height: context.dynamicHeight(0.1),
                        fit: BoxFit.cover,
                      )
                    : SizedBox(
                        width: context.dynamicWidth(0.3),
                        height: context.dynamicHeight(0.1),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: context.dynamicHeight(0.02),
                          ),
                          child: Assets.image.icSearch.image(),
                        ),
                      ),
                context.dynamicHorizontalSpace(0.05),
                Expanded(
                  child: Text(
                    "${ingredientSearchHistoryEntities[index].createdAt.ddMMyyyy} - ${ingredientSearchHistoryEntities[index].createdAt.Hm}",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
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
