import 'package:flutter/material.dart';

import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../utils/constants/app/app_constants.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../widgets/app_name.dart';
import '../view-models/more_tips_view_model.dart';
import '../widgets/tip_item.dart';

class MoreTipsView extends StatelessWidget {
  final MoreTipsViewModel moreTipsViewModel;

  const MoreTipsView({
    super.key,
    required this.moreTipsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Assets.image.icBgPng.image(
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      right: context.dynamicWidth(0.08),
                      left: context.dynamicWidth(0.08),
                      top: context.dynamicHeight(0.04),
                      bottom: context.dynamicHeight(0.01),
                    ),
                    itemCount: AppConstants.tips.length,
                    itemBuilder: (context, index) {
                      return TipItem(
                        index: index,
                      );
                    },
                  ),
                  const AppName(colored: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
