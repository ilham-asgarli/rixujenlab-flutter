import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              top: -context.height * 0.02,
              left: -context.width * 0.15,
              child: Assets.image.icPurpleDot.svg(width: context.width * 0.15),
            ),
            Positioned(
              top: context.height * 0.08,
              left: -context.width * 0.14,
              child: Assets.image.icBlueDot.svg(width: context.width * 0.15),
            ),
            Positioned(
              top: context.height * 0.12,
              right: -context.width * 0.15,
              child: Assets.image.icGreenDot.svg(width: context.width * 0.15),
            ),
            Positioned(
              top: context.height * 0.18,
              right: -context.width * 0.12,
              child: Assets.image.icPinkDot.svg(width: context.width * 0.12),
            ),
            Positioned(
              top: context.height * 0.3,
              left: -context.width * 0.12,
              child: Assets.image.icYellowDot.svg(width: context.width * 0.12),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<LearnTypeBloc>(context).add(GetNewQuestion(
                      answer: ["A", "B", "C", "D", "E"][index],
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: context.dynamicWidth(0.01),
                    height: context.dynamicHeight(0.055),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.01),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
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
                        height: 0.9,
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
