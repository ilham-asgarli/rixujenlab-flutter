import 'package:flutter/material.dart';

class AnimateToPosition extends StatefulWidget {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? startRight;
  final double? startLeft;
  final double? startTop;
  final double? startBottom;
  final double? width;
  final double? height;
  final Duration duration;
  final Widget child;

  const AnimateToPosition({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.startRight,
    this.startLeft,
    this.startTop,
    this.startBottom,
    this.width,
    this.height,
    this.duration = const Duration(seconds: 1),
    required this.child,
  });

  @override
  State<AnimateToPosition> createState() => _AnimateToPositionState();
}

class _AnimateToPositionState extends State<AnimateToPosition> {
  late double? right;
  late double? left;
  late double? top;
  late double? bottom;

  @override
  void initState() {
    right = widget.startRight;
    left = widget.startLeft;
    top = widget.startTop;
    bottom = widget.startBottom;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        right = widget.right;
        left = widget.left;
        top = widget.top;
        bottom = widget.bottom;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      right: right,
      bottom: bottom,
      left: left,
      top: top,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
