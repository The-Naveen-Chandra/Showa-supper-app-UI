import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class PrimaryTextfield extends StatefulWidget {
  final String text;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const PrimaryTextfield({
    super.key,
    required this.text,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<PrimaryTextfield> createState() => _PrimaryTextfieldState();
}

class _PrimaryTextfieldState extends State<PrimaryTextfield> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: GoogleFonts.poppins(
              fontSize: ConstantFontSize.extraExtraSmall,
              fontWeight: ConstantFontWeight.normal,
              color: ConstantColors.secondaryTextColor,
            ),
          ),
          TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _isObscured : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(
                fontSize: ConstantFontSize.medium,
                fontWeight: ConstantFontWeight.normal,
                color: ConstantColors.secondaryTextColor,
              ),
              focusColor: ConstantColors.primaryTextColor,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isObscured
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: ConstantColors.secondaryTextColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
