import 'package:flutter/material.dart';

import '../../../../utils/gen/assets.gen.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../widgets/bg_app_name.dart';
import '../view-models/main_view_model.dart';
import '../widgets/menu_item.dart';

class MainView extends StatelessWidget {
  final MainViewModel mainViewModel;

  const MainView({
    super.key,
    required this.mainViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Stack(
          children: [
            Assets.image.icBgPng.image(
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: BgAppName(
              child: Stack(
                children: [
                  Assets.image.icBg2Png.image(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.01),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: context.dynamicWidth(0.03),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Assets.image.icUser.svg(
                                height: context.dynamicHeight(0.05),
                              ),
                            ),
                          ),
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return MenuItem(
                              mainMenu: MainMenu.values[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return context.dynamicVerticalSpace(0.01);
                          },
                          itemCount: MainMenu.values.length,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
