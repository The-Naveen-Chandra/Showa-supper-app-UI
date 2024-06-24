import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class SelectorTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final String inputText;
  final VoidCallback onTap;

  const SelectorTextField({
    super.key,
    required this.onTap,
    required this.title,
    required this.hintText,
    this.inputText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: ConstantFontSize.extraExtraSmall,
              fontWeight: ConstantFontWeight.normal,
              color: ConstantColors.secondaryTextColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: onTap,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  inputText.isNotEmpty ? inputText : hintText,
                  style: GoogleFonts.poppins(
                    fontSize: ConstantFontSize.medium,
                    fontWeight: ConstantFontWeight.normal,
                    color: inputText.isNotEmpty
                        ? ConstantColors.primaryTextColor
                        : ConstantColors.secondaryTextColor,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ConstantColors.secondaryTextColor,
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 1.5,
            color: ConstantColors.textFieldColor,
          )
        ],
      ),
    );
  }
}
