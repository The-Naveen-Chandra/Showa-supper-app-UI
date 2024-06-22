import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    super.key,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_formatInput);
  }

  @override
  void dispose() {
    _controller.removeListener(_formatInput);
    _controller.dispose();
    super.dispose();
  }

  void _formatInput() {
    String text = _controller.text;
    // Remove any non-digit characters
    text = text.replaceAll(RegExp(r'\D'), '');

    if (text.length > 10) {
      text = text.substring(0, 10); // Limit to 10 digits
    }

    String formatted = '';
    if (text.length > 2) {
      formatted += '${text.substring(0, 2)}-';
      if (text.length > 6) {
        formatted += '${text.substring(2, 6)}-';
        formatted += text.substring(6);
      } else if (text.length > 2) {
        formatted += text.substring(2);
      }
    } else {
      formatted = text;
    }

    _controller.value = _controller.value.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only digits
      ],
      style: GoogleFonts.poppins(
        fontSize: ConstantFontSize.extraLarge,
        color: ConstantColors.primaryTextColor,
        fontWeight: ConstantFontWeight.bold,
      ),
      cursorColor: ConstantColors.borderColor,
      decoration: InputDecoration(
        hintText: "Enter",
        hintStyle: GoogleFonts.poppins(
          fontSize: ConstantFontSize.extraLarge,
          color: ConstantColors.borderColor,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
