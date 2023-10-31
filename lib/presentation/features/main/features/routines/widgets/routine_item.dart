import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/enums/app_enum.dart';
import '../../../../../utils/constants/typography/app_typograpy.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../../../../../utils/extensions/routines_steps_extension.dart';

class RoutineItem extends StatelessWidget {
  final RoutinesSteps routinesSteps;

  const RoutineItem({
    super.key,
    required this.routinesSteps,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!routinesSteps.iconFirst) buildIndex(),
          if (routinesSteps.iconFirst) buildIcon(context),
          if (!routinesSteps.iconFirst) context.dynamicHorizontalSpace(0.01),
          Expanded(
            flex: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    routinesSteps.title.toUpperCase(),
                    style: AppTypography.hattonFont.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Flexible(
                  child: Text(
                    routinesSteps.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          if (!routinesSteps.iconFirst) buildIcon(context),
          if (routinesSteps.iconFirst) context.dynamicHorizontalSpace(0.01),
          if (routinesSteps.iconFirst) buildIndex(),
        ],
      ),
    );
  }

  Expanded buildIndex() {
    return Expanded(
      flex: 15,
      child: Text(
        routinesSteps.myIndex,
        style: TextStyle(
          fontSize: 30,
        ),
        textAlign: routinesSteps.iconFirst ? TextAlign.start : TextAlign.end,
      ),
    );
  }

  Widget buildIcon(BuildContext context) {
    return Expanded(
      flex: 15,
      child: Align(
        alignment: routinesSteps.iconFirst ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
        child: CircleAvatar(
          radius: context.height * 3,
          backgroundColor: Color(0xFFB1E6FA),
          child: routinesSteps.womanIcon.image(),
        ),
      ),
    );
  }
}
