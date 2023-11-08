import 'package:flutter/material.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../view-models/learn_type_view_model.dart';
import '../widgets/answers.dart';

class LearnTypeView extends StatelessWidget {
  final LearnTypeViewModel learnTypeViewModel;

  const LearnTypeView({
    super.key,
    required this.learnTypeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Assets.image.icBg6.svg(fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.18),
              ),
              child: Column(
                children: [
                  context.dynamicVerticalSpace(0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 10; i++)
                        Image.asset(
                          i == 1
                              ? Assets.image.icSelected.path
                              : Assets.image.icUnselected.path,
                          width: context.width * 0.06,
                        ),
                    ],
                  ),
                  context.dynamicVerticalSpace(0.07),
                  SizedBox(
                    width: context.width * 0.5,
                    child: Text(
                      textAlign: TextAlign.center,
                      "How resistant is your skin to the sun?",
                      style: TextStyle(
                        fontFamily: FontFamily.theSeasons,
                        fontSize: 26.3,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF3D6923),
                        height: 1.0,
                      ),
                    ),
                  ),
                  context.dynamicVerticalSpace(0.05),
                  const Answers(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
