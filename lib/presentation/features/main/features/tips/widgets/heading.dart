import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../utils/extensions/context_extension.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              context.l10n.skin,
              style: GoogleFonts.montserrat(
                fontSize: 31,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF3F23A6),
              ),
            ),
            context.dynamicHorizontalSpace(0.06),
            Transform.rotate(
              angle: pi / context.width * 50,
              child: Assets.image.icBulb1Svg.svg(height: context.height * 0.12),
            ),
          ],
        ),
        Text(
          context.l10n.careTips,
          style: GoogleFonts.montserrat(
            fontSize: 31,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF3F23A6),
          ),
        ),
      ],
    );
  }
}
