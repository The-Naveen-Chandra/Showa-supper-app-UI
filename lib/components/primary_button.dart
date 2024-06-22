import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  final double verticalHeight;
  final double fontSize;
  final FontWeight fontWeight;
  final Color borderColor;
  final String iconImage;
  final bool paddingRequired;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.verticalHeight,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.borderColor,
    this.iconImage = "",
    this.paddingRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingRequired ? 20 : 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalHeight,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
            ),
            child: iconImage.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        iconImage,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        text,
                        style: GoogleFonts.poppins(
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: textColor,
                        ),
                      ),
                    ],
                  )
                : Text(
                    textAlign: TextAlign.center,
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
