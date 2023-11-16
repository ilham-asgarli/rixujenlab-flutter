import 'package:flutter/material.dart';

import '../../../../../utils/gen/fonts.gen.dart';
import '../../../../utils/constants/enums/app_enum.dart';
import '../../../../utils/extensions/context_extension.dart';
import '../../../../utils/extensions/main_drawer_extension.dart';

class DrawerItemButton extends StatelessWidget {
  final MainDrawer mainDrawer;

  const DrawerItemButton({
    super.key,
    required this.mainDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mainDrawer.visibility,
      child: SizedBox(
        height: context.dynamicHeight(0.05),
        child: InkWell(
          onTap: () {
            Scaffold.of(context).closeDrawer();
            mainDrawer.onTap(context);
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  mainDrawer.text,
                  style: const TextStyle(
                    fontFamily: FontFamily.dejaVuSerif,
                    fontSize: 16,
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
