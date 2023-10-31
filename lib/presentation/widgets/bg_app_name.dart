import 'package:flutter/material.dart';

import '../utils/extensions/context_extension.dart';
import 'app_name.dart';

class BgAppName extends StatelessWidget {
  final Widget? child;

  const BgAppName({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? const SizedBox.shrink(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: context.dynamicHeight(0.06),
          child: const AppName(
            colored: false,
          ),
        ),
      ],
    );
  }
}
