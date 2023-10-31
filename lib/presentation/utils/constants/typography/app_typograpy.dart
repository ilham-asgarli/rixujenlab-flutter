import 'package:flutter/material.dart';

import '../../../../utils/gen/fonts.gen.dart';

abstract class AppTypography {
  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const example = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const hattonFont = TextStyle(fontFamily: FontFamily.hatton);
}
