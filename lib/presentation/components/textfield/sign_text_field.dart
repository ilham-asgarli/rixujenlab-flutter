import 'package:flutter/material.dart';

import '../../utils/extensions/context_extension.dart';

class SignTextField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  const SignTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.05),
        vertical: context.dynamicHeight(0.004),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.13),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE3E3E6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.zero,
          hintStyle: const TextStyle(
            color: Color(
              0xFF818181,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
