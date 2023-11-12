import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/gen/assets.gen.dart';
import '../utils/extensions/context_extension.dart';

class Back extends StatelessWidget {
  final Widget? child;

  const Back({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? const SizedBox.shrink(),
        Positioned(
          left: context.dynamicWidth(0.08),
          bottom: context.dynamicHeight(0.06),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Assets.image.icBack.svg(
              width: context.dynamicWidth(0.08),
            ),
          ),
        ),
      ],
    );
  }
}
