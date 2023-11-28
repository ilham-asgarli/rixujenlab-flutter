import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/enums/app_enum.dart';
import '../../../../../../../utils/extensions/context_extension.dart';
import '../../../../../../../utils/extensions/type_feature_extension.dart';

class TypeFeatureItem extends StatelessWidget {
  final TypeFeature typeFeature;
  final SkinType myType;

  const TypeFeatureItem({
    super.key,
    required this.typeFeature,
    required this.myType,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaler: TextScaler.linear(
        context.textScaleFactor(baseWidth: 414),
      ),
      textAlign: TextAlign.center,
      text: TextSpan(
        text: typeFeature.title(myType),
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 15,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          color: Color(0xFF532B1C),
        ),
        children: [
          TextSpan(
            text: typeFeature.description(myType),
            style: const TextStyle(
              letterSpacing: 3,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xFF532B1C),
            ),
          ),
        ],
      ),
    );
  }
}
