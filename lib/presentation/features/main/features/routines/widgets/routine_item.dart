import 'package:flutter/material.dart';

import '../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../utils/constants/enums/app_enum.dart';
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
                    routinesSteps.title,
                    style: const TextStyle(
                      fontFamily: FontFamily.theSeasons,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Flexible(
                  child: Text(
                    routinesSteps.description,
                    style: const TextStyle(
                      fontFamily: FontFamily.theSeasons,
                      fontStyle: FontStyle.italic,
                      fontSize: 13,
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
              fontFamily: FontFamily.benedict,
              fontSize: 36,
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
