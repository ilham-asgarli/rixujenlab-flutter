import 'package:flutter/material.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../utils/extensions/context_extension.dart';

class Answers extends StatelessWidget {
  const Answers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: context.width * 0.5,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -context.height * 0.03,
              left: -context.width * 0.15,
              child:
                  Assets.image.icPurpleDot.svg(height: context.height * 0.05),
            ),
            Positioned(
              top: context.height * 0.07,
              left: -context.width * 0.12,
              child: Assets.image.icBlueDot.svg(height: context.height * 0.05),
            ),
            Positioned(
              top: context.height * 0.18,
              right: -context.width * 0.10,
              child: Assets.image.icPinkDot.svg(height: context.height * 0.05),
            ),
            Positioned(
              top: context.height * 0.11,
              right: -context.width * 0.14,
              child: Assets.image.icGreenDot.svg(height: context.height * 0.04),
            ),
            Positioned(
              top: context.height * 0.28,
              left: -context.width * 0.13,
              child:
                  Assets.image.icYellowDot.svg(height: context.height * 0.04),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: context.width * 0.01,
                  height: context.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xFF534E3C),
                      width: 2,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return context.dynamicVerticalSpace(0.015);
              },
            ),
          ],
        ),
      ),
    );
  }
}
