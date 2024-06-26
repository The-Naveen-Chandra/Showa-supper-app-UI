import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 10, top: 16, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ConstantColors.errorColor,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: ConstantColors.greenColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: ConstantColors.greenColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "New Task Assignment",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.bold,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
              Text(
                "23 min",
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.extraSmall,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width:
                  66, // Adjust the width to align properly with the circle and icon above
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Congratulation you have been assign with new task. check it out",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.normal,
                      color: ConstantColors.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Text(
                        "Mark as read",
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.extraSmall,
                          fontWeight: ConstantFontWeight.semiBold,
                          color: ConstantColors.greenColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstantColors.borderColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "View",
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.extraSmall,
                          fontWeight: ConstantFontWeight.semiBold,
                          color: ConstantColors.greenColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Divider(
          height: 4,
          color: ConstantColors.borderColor,
        ),
      ],
    );
  }
}
