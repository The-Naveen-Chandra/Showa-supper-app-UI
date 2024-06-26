import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class CustomAddressField extends StatelessWidget {
  final String titleText;
  final String inputText;

  const CustomAddressField({
    super.key,
    required this.titleText,
    required this.inputText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: GoogleFonts.poppins(
            fontSize: ConstantFontSize.extraExtraExtraSmall,
            fontWeight: ConstantFontWeight.normal,
            color: ConstantColors.secondaryTextColor,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          inputText,
          style: GoogleFonts.poppins(
            fontSize: ConstantFontSize.medium,
            fontWeight: ConstantFontWeight.semiBold,
            color: ConstantColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
