import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/constants/typography/app_typograpy.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/extensions/main_menu_extension.dart';

class MenuItem extends StatelessWidget {
  final MainMenu mainMenu;

  const MenuItem({
    super.key,
    required this.mainMenu,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        mainMenu.onTap(context);
      },
      child: Container(
        height: context.height * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 5,
            color: mainMenu.borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (mainMenu.iconFirst) buildIcon(context),
            if (!mainMenu.iconFirst) context.dynamicHorizontalSpace(0.01),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.dynamicVerticalSpace(0.02),
                  Text(
                    mainMenu.title.toUpperCase(),
                    style: AppTypography.hattonFont.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    mainMenu.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Align(
                        child: mainMenu.icon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!mainMenu.iconFirst) buildIcon(context),
            if (mainMenu.iconFirst) context.dynamicHorizontalSpace(0.01),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Align(
        alignment: mainMenu.iconFirst
            ? AlignmentDirectional.centerEnd
            : AlignmentDirectional.centerStart,
        child: mainMenu.womanIcon.image(
          height: context.height * 0.16,
        ),
      ),
    );
  }
}
