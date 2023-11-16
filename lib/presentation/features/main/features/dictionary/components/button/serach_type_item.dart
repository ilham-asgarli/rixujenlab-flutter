import 'package:flutter/material.dart';

import '../../../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../../utils/constants/enums/app_enum.dart';
import '../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../utils/extensions/skincare_dictionary_extension.dart';
import '../../view-models/dictionary_view_model.dart';

class SearchTypeItem extends StatelessWidget {
  final DictionaryViewModel dictionaryViewModel;
  final SkincareDictionary skincareDictionary;

  const SearchTypeItem({
    super.key,
    required this.skincareDictionary,
    required this.dictionaryViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        skincareDictionary.onTap(context, dictionaryViewModel)();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Assets.image.icBgButton.svg(
            width: context.dynamicWidth(0.7),
          ),
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
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
