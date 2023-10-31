import 'package:flutter/material.dart';

import '../../utils/extensions/context_extension.dart';

class SignTextField extends StatelessWidget {
  final String hintText;

  const SignTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05), vertical: context.dynamicHeight(0.004)),
      margin: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.13)),
      decoration: BoxDecoration(
        color: Color(0xFFE3E3E6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(
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
