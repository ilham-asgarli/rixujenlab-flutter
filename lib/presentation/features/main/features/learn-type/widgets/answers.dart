import 'package:flutter/material.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../state/learn_type_bloc.dart';
import '../view-models/learn_type_view_model.dart';

class Answers extends StatelessWidget {
  final LearnTypeViewModel learnTypeViewModel;
  final List<String> answers;

  const Answers({
    super.key,
    required this.answers,
    required this.learnTypeViewModel,
  });

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
              itemCount: answers.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    learnTypeViewModel.learnTypeBloc.add(GetNewQuestion(
                      answer: ["A", "B", "C", "D", "E"][index],
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: context.dynamicWidth(0.01),
                    height: context.dynamicHeight(0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xFF534E3C),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      answers[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: FontFamily.abiah,
                        fontSize: 15,
                      ),
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
