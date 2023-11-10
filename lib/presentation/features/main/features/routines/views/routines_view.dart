import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../utils/constants/enums/app_enum.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../../../../../widgets/bg_app_name.dart';
import '../view-models/routines_view_model.dart';
import '../widgets/routine_item.dart';

class RoutinesView extends StatelessWidget {
  final RoutinesViewModel routinesViewModel;

  const RoutinesView({
    super.key,
    required this.routinesViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BgAppName(
          child: Stack(
            children: [
              Assets.image.icBg5Png.image(
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.dynamicWidth(0.01),
                ),
                child: Column(
                  children: [
                    context.dynamicVerticalSpace(0.04),
                    Text(
                      context.l10n.skincare,
                      style: const TextStyle(
                        fontFamily: FontFamily.bugakiRegular,
                        fontSize: 26.3,
                        height: 1.0,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${context.l10n.routines} ",
                        style: GoogleFonts.mrDafoe(
                          fontSize: 27,
                          color: const Color(0xFFFF66C3),
                          height: 1.0,
                        ),
                        children: [
                          TextSpan(
                            text: context.l10n.steps,
                            style: const TextStyle(
                              fontFamily: FontFamily.argentCF,
                              color: Colors.black,
                              fontSize: 26.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RoutineItem(
                          routinesSteps: RoutinesSteps.values[index],
                        );
                      },
                      itemCount: RoutinesSteps.values.length,
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
