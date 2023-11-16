import 'package:flutter/material.dart';

import '../../utils/gen/fonts.gen.dart';
import '../utils/constants/colors/app_colors.dart';
import '../utils/extensions/context_extension.dart';

class AppName extends StatelessWidget {
  final bool colored;

  const AppName({
    super.key,
    required this.colored,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: context.dynamicHeight(0.06),
      color: colored ? AppColors.purple : null,
      child: Text(
        context.l10n.appName,
        style: const TextStyle(
          fontFamily: FontFamily.theSeasons,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
