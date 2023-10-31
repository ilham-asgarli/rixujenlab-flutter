import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/gen/assets.gen.dart';
import 'bg_1.dart';

class Bg2 extends StatelessWidget {
  final Widget? child;

  const Bg2({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            var height = constraints.biggest.height;

            return Bg1(
              child: Stack(
                children: [
                  Positioned(
                    top: height * 0.3,
                    left: -height * 0.07,
                    height: height * 0.4,
                    child: Transform.rotate(
                      angle: pi * 15 / 180,
                      child: Assets.image.icGreen.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -height * 0.36,
                    right: -height * 0.25,
                    height: height * 0.6,
                    child: Transform.rotate(
                      angle: 0,
                      child: Assets.image.icBrown.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -height * 0.15,
                    right: -height * 0.12,
                    height: height * 0.5,
                    child: Transform.rotate(
                      angle: -pi * 120 / 180,
                      child: Assets.image.icPurple.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: -height * 0.04,
                    height: height * 0.4,
                    child: Assets.image.icFlowerBlack.image(
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: -height * 0.05,
                    left: -height * 0.083,
                    height: height * 0.3,
                    child: Transform.rotate(
                      angle: pi / 8,
                      child: Assets.image.icFlowerBlack.image(
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (child != null) child!,
      ],
    );
  }
}
