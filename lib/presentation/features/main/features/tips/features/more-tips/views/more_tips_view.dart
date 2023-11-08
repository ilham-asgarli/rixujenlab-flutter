import 'package:flutter/material.dart';

import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../view-models/more_tips_view_model.dart';

class MoreTipsView extends StatelessWidget {
  final MoreTipsViewModel moreTipsViewModel;

  const MoreTipsView({
    super.key,
    required this.moreTipsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Assets.image.icBg.svg(fit: BoxFit.fill),
            ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.08),
                vertical: context.dynamicHeight(0.03),
              ),
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  height: context.height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xFFE4C3FF),
                      width: 5,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
