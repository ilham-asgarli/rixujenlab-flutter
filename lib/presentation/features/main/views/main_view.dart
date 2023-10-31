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
      body: SafeArea(
        child: BgAppName(
          child: Stack(
            children: [
              Assets.image.icBg2.svg(fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.dynamicWidth(0.01),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
