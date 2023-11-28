import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../../../utils/constants/enums/app_enum.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../utils/extensions/my_type_extension.dart';
import '../../../../../../../widgets/app_name.dart';
import '../../../../../../../widgets/back.dart';
import '../view-models/my_type_view_model.dart';
import '../widgets/type_feature_item.dart';

class MyTypeView extends StatelessWidget {
  final MyTypeViewModel myTypeViewModel;
  final SkinType myType;

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
            Assets.image.icBg1Png.image(
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
              opacity: const AlwaysStoppedAnimation<double>(0.5),
            ),
            Column(
              children: [
                Expanded(
                  child: Back(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          context.dynamicVerticalSpace(0.08),
                          RichText(
                            textScaler: TextScaler.linear(
                              context.textScaleFactor(baseWidth: 414),
                            ),
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: myType.title,
                              style: const TextStyle(
                                fontFamily: FontFamily.hatton,
                                fontSize: 30,
                                letterSpacing: 10,
                                color: Color(0xFF532B1C),
                                height: 1.0,
                              ),
                              children: [
                                TextSpan(
                                  text: "\n${context.l10n.skin.toUpperCase()}",
                                  style: GoogleFonts.poppins(
                                    letterSpacing: 10,
                                    fontSize: 15,
                                    color: const Color(0xFF532B1C),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          context.dynamicVerticalSpace(0.06),
                          Image.asset(
                            myType.icon,
                            height: context.height * 0.18,
                          ),
                          context.dynamicVerticalSpace(0.06),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.dynamicWidth(0.1),
                            ),
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: TypeFeature.values.length,
                              itemBuilder: (context, index) {
                                return TypeFeatureItem(
                                  myType: myType,
                                  typeFeature: TypeFeature.values[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  context.dynamicVerticalSpace(0.02),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const AppName(colored: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
