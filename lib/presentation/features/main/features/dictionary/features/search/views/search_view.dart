import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../utils/constants/colors/app_colors.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../widgets/back.dart';
import '../../../../../../../widgets/bg_app_name.dart';
import '../../../widgets/search_ingredients_list.dart';
import '../state/search_ingredients_bloc.dart';
import '../view-models/search_view_model.dart';

class SearchView extends StatelessWidget {
  final SearchViewModel searchViewModel;

  const SearchView({
    super.key,
    required this.searchViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchIngredientsBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Back(
                child: BgAppName(
                  child: Stack(
                    children: [
                      Assets.image.icBg8Png.image(
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: context.dynamicHeight(0.1),
                          horizontal: context.dynamicWidth(0.15),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: -context.dynamicWidth(0.08),
                                  top: context.dynamicHeight(0.06),
                                  child: Transform.rotate(
                                    angle: -pi / 2,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(pi),
                                      child: Assets.image.icPinkDot.svg(
                                        height: context.height * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.dynamicWidth(0.05),
                                  ),
                                  height: context.dynamicHeight(0.06),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.black.shade0),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.white,
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: context.l10n.search,
                                    ),
                                    onChanged: (value) {
                                      searchViewModel.onChanged(context, value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SearchIngredientsList(
                                ingredientEntities: context
                                    .watch<SearchIngredientsBloc>()
                                    .state
                                    .ingredientEntities,
                                save: true,
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
        },
      ),
    );
  }
}
