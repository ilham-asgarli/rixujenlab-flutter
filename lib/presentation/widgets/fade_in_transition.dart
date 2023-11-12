import 'package:flutter/material.dart';

class FadeInTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeInTransition({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<FadeInTransition> createState() => _FadeInTransitionState();
}

class _FadeInTransitionState extends State<FadeInTransition>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
