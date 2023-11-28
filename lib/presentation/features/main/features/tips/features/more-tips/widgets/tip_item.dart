import 'package:flutter/material.dart';

import '../../../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../../../utils/constants/app/app_constants.dart';
import '../../../../../../../utils/extensions/context_extension.dart';

class TipItem extends StatelessWidget {
  final int index;

  const TipItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.135),
      padding: EdgeInsets.symmetric(
        vertical: context.dynamicHeight(0.009),
        horizontal: context.dynamicWidth(0.03),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFE4C3FF),
          width: 5,
        ),
      ),
      child: Center(
        child: Text(
          AppConstants.tips[index],
          style: const TextStyle(
            fontFamily: FontFamily.montserratArabic,
            fontSize: 14,
            color: Color(0xFF3F23A6),
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
