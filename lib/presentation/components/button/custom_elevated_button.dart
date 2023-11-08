import 'package:flutter/material.dart';

import '../../utils/extensions/context_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool progress;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.progress = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(
          context.dynamicWidth(0.33),
          context.dynamicHeight(0.035),
        ),
        maximumSize: Size(
          context.dynamicWidth(0.33),
          context.dynamicHeight(0.035),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: const Color(0xFF8B7DCF),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: progress
          ? SizedBox(
              height: context.dynamicHeight(0.02),
              width: context.dynamicHeight(0.02),
              child: const CircularProgressIndicator(
                color: Color(0xFF150060),
              ),
            )
          : Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF150060),
              ),
            ),
    );
  }
}
