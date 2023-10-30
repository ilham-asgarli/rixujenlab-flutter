import 'package:flutter/material.dart';

class Background1 extends StatelessWidget {
  final Widget? child;

  const Background1({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      /*decoration: BoxDecoration(
        image: DecorationImage(
          image: ,
          fit: BoxFit.cover,
        ),
      ),*/
      child: child,
    );
  }
}
