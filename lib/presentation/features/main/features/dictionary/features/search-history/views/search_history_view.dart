import 'package:flutter/material.dart';

import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../widgets/back.dart';
import '../../../../../../../widgets/bg_app_name.dart';
import '../view-models/search_history_view_model.dart';
import '../widgets/search_histort_list.dart';

class SearchHistoryView extends StatelessWidget {
  final SearchHistoryViewModel searchHistoryViewModel;

  const SearchHistoryView({
    super.key,
    required this.searchHistoryViewModel,
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
                  top: context.dynamicHeight(0.23),
                  child: FutureBuilder(
                    future: searchHistoryViewModel.getIngredientSearchHistory,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!.fold(
                          (l) => const SizedBox(),
                          (r) => SearchHistoryList(
                            ingredientSearchHistoryEntities: r,
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
