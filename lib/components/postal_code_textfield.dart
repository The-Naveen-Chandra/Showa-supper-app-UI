import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class PostalCodeTextfield extends StatefulWidget {
  final String title;
  final String hintText;
  final bool disabled;
  final TextEditingController controller;
  final VoidCallback onTap;

  const PostalCodeTextfield({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.disabled = true,
    required this.onTap,
  });

  @override
  State<PostalCodeTextfield> createState() => _PostalCodeTextfieldState();
}

class _PostalCodeTextfieldState extends State<PostalCodeTextfield> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_formatText);
  }

  void _formatText() {
    String text = widget.controller.text;
    String newText = text;
    if (text.length > 3 && !text.contains('-')) {
      newText = '${text.substring(0, 3)}-${text.substring(3)}';
    }
    if (text != newText) {
      widget.controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newText.length),
        ),
      );
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_formatText);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: ConstantFontSize.extraExtraSmall,
            fontWeight: ConstantFontWeight.normal,
            color: ConstantColors.secondaryTextColor,
          ),
        ),
        TextField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
            PostalCodeInputFormatter(),
          ],
          style: GoogleFonts.poppins(
            fontSize: ConstantFontSize.medium,
            fontWeight: ConstantFontWeight.semiBold,
            color: ConstantColors.primaryTextColor,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: ConstantFontSize.medium,
              fontWeight: ConstantFontWeight.normal,
              color: ConstantColors.secondaryTextColor,
            ),
            focusColor: ConstantColors.primaryTextColor,
            suffix: widget.disabled
                ? Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: 30,
                    decoration: BoxDecoration(
                      color: ConstantColors.disabledColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "Search",
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.extraExtraExtraSmall,
                          fontWeight: ConstantFontWeight.semiBold,
                          color: ConstantColors.backgroundWhiteColor,
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
                      decoration: BoxDecoration(
                        color: ConstantColors.primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "Search",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraExtraExtraSmall,
                            fontWeight: ConstantFontWeight.semiBold,
                            color: ConstantColors.backgroundWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class PostalCodeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.length > 3 && !newText.contains('-')) {
      newText = '${newText.substring(0, 3)}-${newText.substring(3)}';
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      ),
    );
  }
}
