import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/gen/assets.gen.dart';
import '../../../../utils/gen/fonts.gen.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../widgets/animate_to_position.dart';
import '../../../widgets/bg_app_name.dart';
import '../../../widgets/fade_in_transition.dart';
import '../components/button/entry_button.dart';
import '../view-models/cover_view_model.dart';

class CoverView extends StatelessWidget {
  final CoverViewModel coverViewModel;

  const CoverView({
    super.key,
    required this.coverViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color(0xFFB9FFB0),
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFB9FFB0),
        body: BgAppName(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                left: context.dynamicWidth(0.08),
                right: context.dynamicWidth(0.08),
                top: context.dynamicHeight(0.12),
                bottom: context.dynamicHeight(0.12),
                child: FadeInTransition(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -context.dynamicWidth(0.7),
                top: -context.dynamicHeight(0.07),
                child: FadeInTransition(
                  child: Assets.image.icLeafs.image(),
                ),
              ),
              Positioned(
                right: -context.dynamicWidth(0.1),
                top: context.dynamicHeight(0.03),
                child: FadeInTransition(
                  child: Assets.image.icLeafs.image(
                    width: context.dynamicWidth(0.45),
                  ),
                ),
              ),
              Positioned(
                left: -context.dynamicWidth(0.3),
                bottom: context.dynamicHeight(0.03),
                child: FadeInTransition(
                  duration: const Duration(seconds: 2),
                  child: Transform.rotate(
                    angle: pi,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Assets.image.icLeafs.image(
                        width: context.dynamicWidth(0.6),
                      ),
                    ),
                  ),
                ),
              ),
              AnimateToPosition(
                startRight: -context.dynamicWidth(0.6),
                right: -context.dynamicWidth(0.42),
                bottom: context.dynamicHeight(0.0),
                duration: const Duration(seconds: 4),
                child: FadeInTransition(
                  duration: const Duration(
                    seconds: 1,
                    milliseconds: 500,
                  ),
                  child: Transform.rotate(
                    angle: pi / 36,
                    child: Assets.image.icLeafs.image(
                      width: context.dynamicWidth(0.9),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                left: context.dynamicWidth(0.08),
                right: context.dynamicWidth(0.08),
                top: context.dynamicHeight(0.12),
                bottom: context.dynamicHeight(0.12),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.dynamicHeight(0.05),
                  ),
                  child: Column(
                    children: [
                      FadeInTransition(
                        duration: const Duration(
                          seconds: 1,
                          milliseconds: 100,
                        ),
                        child: Assets.image.icRx.image(
                          width: context.dynamicWidth(0.3),
                        ),
                      ),
                      context.dynamicVerticalSpace(0.01),
                      FadeInTransition(
                        duration: const Duration(
                          seconds: 1,
                          milliseconds: 200,
                        ),
                        child: Text(
                          context.l10n.lab,
                          style: const TextStyle(
                            fontFamily: FontFamily.dejaVuSerif,
                            fontSize: 23,
                            color: Color(0xFF2F4334),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                      FadeInTransition(
                        duration: const Duration(
                          seconds: 1,
                          milliseconds: 300,
                        ),
                        child: Text(
                          context.l10n.skincare,
                          style: const TextStyle(
                            fontFamily: FontFamily.versailles,
                            fontSize: 41,
                          ),
                        ),
                      ),
                      FadeInTransition(
                        duration: const Duration(
                          seconds: 1,
                          milliseconds: 400,
                        ),
                        child: Text(
                          context.l10n.skincareDictionaryDescription
                              .toUpperCase(),
                          style: const TextStyle(
                            fontFamily: FontFamily.versailles,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.2),
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Entry.values.length,
                        itemBuilder: (context, index) {
                          return EntryButton(
                            entry: Entry.values[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return context.dynamicVerticalSpace(0.02);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
