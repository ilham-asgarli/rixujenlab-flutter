import 'package:flutter/material.dart';

import '../../../../utils/gen/assets.gen.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../components/button/drawer_item_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Stack(
          children: [
            Assets.image.icBgPng.image(
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.dynamicHeight(0.03),
                horizontal: context.dynamicWidth(0.05),
              ),
              child: ListView.builder(
                itemCount: MainDrawer.values.length,
                itemBuilder: (context, index) {
                  return DrawerItemButton(
                    mainDrawer: MainDrawer.values[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
