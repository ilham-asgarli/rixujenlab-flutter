import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../utils/config/router/config_router.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../view-models/tips_view_model.dart';

class TipsView extends StatelessWidget {
  final TipsViewModel tipsViewModel;

  const TipsView({
    super.key,
    required this.tipsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.image.icBg8.svg(fit: BoxFit.fill),
          Column(
            children: [
              context.dynamicVerticalSpace(0.2),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Skin",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF3F23A6),
                          ),
                        ),
                        context.dynamicHorizontalSpace(0.06),
                        Transform.rotate(
                          angle: pi / context.width * 50,
                          child: Assets.image.icBulb1Svg
                              .svg(height: context.height * 0.12),
                        ),
                      ],
                    ),
                    const Text(
                      "Care Tips",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF3F23A6),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.width * 0.7,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: AppConstants.tips.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ",
                          style: TextStyle(
                            fontSize: 25,
                            height: 1,
                            color: Color(0xFF3F23A6),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${AppConstants.tips[index]}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF3F23A6),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              context.dynamicVerticalSpace(0.04),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(
                      context.dynamicWidth(0.33), context.dynamicHeight(0.035)),
                  maximumSize: Size(
                      context.dynamicWidth(0.33), context.dynamicHeight(0.035)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  backgroundColor: Color(0xFF8B7DCF),
                ),
                onPressed: () {
                  MoreTipsViewRoute().go(context);
                },
                child: Text(
                  "READ MORE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF150060),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
