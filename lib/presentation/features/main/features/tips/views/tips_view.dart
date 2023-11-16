import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../utils/config/router/config_router.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../../../../../widgets/back.dart';
import '../../../../../widgets/bg_app_name.dart';
import '../view-models/tips_view_model.dart';
import '../widgets/heading.dart';
import '../widgets/tips.dart';

class TipsView extends StatelessWidget {
  final TipsViewModel tipsViewModel;

  const TipsView({
    super.key,
    required this.tipsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Back(
        child: BgAppName(
          child: Stack(
            children: [
              Assets.image.icBg8Png.image(
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Column(
                  children: [
                    context.dynamicVerticalSpace(0.2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: context.dynamicWidth(0.04),
                          ),
                          child: const Heading(),
                        ),
                        const Tips(),
                      ],
                    ),
                    context.dynamicVerticalSpace(0.04),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(context.dynamicWidth(0.33),
                            context.dynamicHeight(0.035)),
                        maximumSize: Size(context.dynamicWidth(0.33),
                            context.dynamicHeight(0.035)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: const Color(0xFF8B7DCF),
                      ),
                      onPressed: () {
                        MoreTipsViewRoute().go(context);
                      },
                      child: Text(
                        context.l10n.readMore,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF150060),
                        ),
                      ),
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
