import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/di/injectable.dart';
import '../../../../../utils/gen/fonts.gen.dart';
import '../../../../utils/constants/enums/app_enum.dart';
import '../../../../utils/extensions/context_extension.dart';
import '../../../../utils/extensions/entry_extension.dart';
import '../../../../utils/helpers/theme/theme_helper.dart';
import '../../../../widgets/fade_in_transition.dart';
import '../../../my-app/state/cubit/theme/theme_cubit.dart';

class EntryButton extends StatelessWidget {
  final Entry entry;

  const EntryButton({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getIt<ThemeHelper>().setSystemUIOverlayStyleWithAppTheme(
          context.read<ThemeCubit>().state.appTheme,
        );
        entry.onTap(context);
      },
      child: FadeInTransition(
        duration: entry.fadeDuration,
        child: Container(
          alignment: Alignment.center,
          height: context.dynamicHeight(0.045),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orangeAccent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFFee8cd1),
          ),
          child: Text(
            entry.text,
            style: const TextStyle(
              fontFamily: FontFamily.dejaVuSerif,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
