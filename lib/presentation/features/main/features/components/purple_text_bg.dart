import 'package:flutter/material.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../utils/gen/fonts.gen.dart';
import '../../../../utils/constants/enums/app_enum.dart';
import '../../../../utils/extensions/context_extension.dart';
import '../../../../utils/extensions/skincare_dictionary_extension.dart';

class PurpleTextBg extends StatelessWidget {
  final SkincareDictionary skincareDictionary;

  const PurpleTextBg({
    super.key,
    required this.skincareDictionary,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Assets.image.icBgButton.svg(width: context.dynamicWidth(0.7)),
        SizedBox(
          width: context.dynamicWidth(0.7),
          child: Row(
            children: [
              Expanded(
                child: skincareDictionary.icon,
              ),
              Text(
                skincareDictionary.buttonText,
                style: const TextStyle(
                  fontFamily: FontFamily.hatton,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
