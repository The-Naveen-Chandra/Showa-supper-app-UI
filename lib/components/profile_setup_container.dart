import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class ProfileSetupContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String number;
  final bool iconVisible;
  final bool isCompleted;
  final bool isDisabled;
  final VoidCallback onTap;

  const ProfileSetupContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.number,
    required this.iconVisible,
    this.isCompleted = false,
    this.isDisabled = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 20,
        top: 20,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isCompleted
                  ? ConstantColors.lightGreenColor
                  : ConstantColors.backgroundWhiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 2,
                color: isCompleted
                    ? ConstantColors.successColor
                    : isDisabled
                        ? ConstantColors.disabledColor
                        : ConstantColors.primaryColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 28,
                horizontal: 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.small,
                          fontWeight: ConstantFontWeight.bold,
                          color: isCompleted
                              ? ConstantColors.successColor
                              : ConstantColors.primaryTextColor,
                        ),
                      ),
                      InkWell(
                        onTap: onTap,
                        child: iconVisible
                            ? Icon(
                                Icons.lock_person_outlined,
                                color: ConstantColors.disabledColor,
                              )
                            : Text(
                                isCompleted ? "Completed" : "Start",
                                style: GoogleFonts.poppins(
                                  fontSize: isCompleted
                                      ? ConstantFontSize.extraSmall
                                      : ConstantFontSize.small,
                                  fontWeight: isCompleted
                                      ? ConstantFontWeight.normal
                                      : ConstantFontWeight.bold,
                                  color: isCompleted
                                      ? ConstantColors.successColor
                                      : ConstantColors.primaryTextColor,
                                ),
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subTitle,
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.normal,
                      color: isCompleted
                          ? ConstantColors.successColor
                          : ConstantColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -20, // Adjust as needed to center the circle on the border
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: isCompleted
                        ? ConstantColors.successColor
                        : isDisabled
                            ? ConstantColors.disabledColor
                            : ConstantColors.primaryColor,
                  ),
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? ConstantColors.successColor
                      : ConstantColors.whiteColor,
                ),
                child: Center(
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          color: ConstantColors.whiteColor,
                        )
                      : Text(
                          number,
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraSmall,
                            fontWeight: ConstantFontWeight.bold,
                            color: isDisabled
                                ? ConstantColors.disabledColor
                                : ConstantColors.primaryColor,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
