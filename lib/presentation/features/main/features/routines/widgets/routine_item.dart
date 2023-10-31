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
      height: context.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!routinesSteps.iconFirst) buildIndex(context),
          if (routinesSteps.iconFirst) buildIcon(context),
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
          if (routinesSteps.iconFirst) buildIndex(context),
        ],
      ),
    );
  }

  Widget buildIndex(BuildContext context) {
    return Expanded(
      flex: 15,
      child: Row(
        mainAxisAlignment: routinesSteps.iconFirst
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (routinesSteps.iconFirst) context.dynamicHorizontalSpace(0.03),
          Text(
            routinesSteps.myIndex,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          if (!routinesSteps.iconFirst) context.dynamicHorizontalSpace(0.03),
        ],
      ),
    );
  }

  Widget buildIcon(BuildContext context) {
    return Expanded(
      flex: 15,
      child: Align(
        alignment: routinesSteps.iconFirst
            ? AlignmentDirectional.centerEnd
            : AlignmentDirectional.centerStart,
        child: CircleAvatar(
          radius: double.infinity,
          backgroundColor: const Color(0xFFB1E6FA),
          child: routinesSteps.womanIcon.image(),
        ),
      ),
    );
  }
}
