import 'package:flutter/material.dart';

import '../../../../../../utils/gen/assets.gen.dart';
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
              Assets.image.icBg5.svg(fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.dynamicWidth(0.01),
                ),
                child: Column(
                  children: [
                    context.dynamicVerticalSpace(0.04),
                    Text(
                      context.l10n.skincare,
                      style: TextStyle(
                        fontSize: 30,
                        height: 1.0,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: context.l10n.routines,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFFFF66C3),
                          height: 1.0,
                        ),
                        children: [
                          TextSpan(
                            text: context.l10n.steps,
                            style: const TextStyle(
                              color: Colors.black,
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
