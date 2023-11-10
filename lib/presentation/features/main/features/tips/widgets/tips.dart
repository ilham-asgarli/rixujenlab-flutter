import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../../utils/extensions/context_extension.dart';

class Tips extends StatelessWidget {
  const Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: AppConstants.shortTips.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "• ",
                style: TextStyle(
                  fontSize: 25,
                  height: 1,
                  color: Color(0xFF3F23A6),
                ),
              ),
              Expanded(
                child: Text(
                  AppConstants.shortTips[index],
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xFF3F23A6),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
