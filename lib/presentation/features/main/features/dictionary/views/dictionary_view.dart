import 'package:flutter/material.dart';

import '../../../../../../utils/gen/assets.gen.dart';
import '../../../../../../utils/gen/fonts.gen.dart';
import '../../../../../utils/constants/enums/app_enum.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../../../../../widgets/bg_app_name.dart';
import '../components/button/serach_type_item.dart';
import '../view-models/dictionary_view_model.dart';

class DictionaryView extends StatelessWidget {
  final DictionaryViewModel dictionaryViewModel;

  const DictionaryView({
    super.key,
    required this.dictionaryViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BgAppName(
          child: Stack(
            children: [
              Assets.image.icBg7Png.image(
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.dynamicWidth(0.10),
                  ),
                  child: Column(
                    children: [
                      context.dynamicVerticalSpace(0.11),
                      Text(
                        context.l10n.skincareDictionaryTitle,
                        style: const TextStyle(
                          fontFamily: FontFamily.kudryashevDisplaySans,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF2E3334),
                        ),
                      ),
                      Text(
                        context.l10n.skincareDictionaryDescription,
                        style: const TextStyle(
                          fontFamily: FontFamily.kudryashevDisplaySans,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF2E3334),
                          height: 1.0,
                        ),
                      ),
                      context.dynamicVerticalSpace(0.34),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: SkincareDictionary.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SearchTypeItem(
                            skincareDictionary:
                                SkincareDictionary.values[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return context.dynamicVerticalSpace(0.01);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
