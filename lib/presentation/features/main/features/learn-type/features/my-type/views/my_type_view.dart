import 'package:flutter/material.dart';

import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../../../utils/constants/enums/app_enum.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../view-models/my_type_view_model.dart';

class MyTypeView extends StatelessWidget {
  final MyTypeViewModel myTypeViewModel;
  final MyType myType;

  const MyTypeView({
    super.key,
    required this.myTypeViewModel,
    required this.myType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Assets.image.icBg1.svg(fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.10),
              ),
              child: Center(
                child: Column(
                  children: [
                    context.dynamicVerticalSpace(0.1),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'SENSITIVE',
                        style: TextStyle(
                          fontFamily: FontFamily.hatton,
                          fontSize: 30,
                          letterSpacing: 10,
                          color: Color(0xFF532B1C),
                        ),
                        children: [
                          TextSpan(
                            text: '\nSKIN',
                            style: TextStyle(
                              letterSpacing: 10,
                              fontSize: 15,
                              color: Color(0xFF532B1C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    context.dynamicVerticalSpace(0.08),
                    Assets.image.icSensitiveSkin
                        .image(height: context.height * 0.2),
                    context.dynamicVerticalSpace(0.08),
                    RichText(
                      text: const TextSpan(
                        text: 'Sensitive Skin Definition:',
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF532B1C),
                        ),
                        children: [
                          TextSpan(
                            text: ' Tends to overreact to various',
                            style: TextStyle(
                              letterSpacing: 3,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color(0xFF532B1C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
