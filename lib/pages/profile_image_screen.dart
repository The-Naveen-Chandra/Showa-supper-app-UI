import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/pages/face_id_screen.dart';

class ProfileImageScreen extends StatelessWidget {
  const ProfileImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ConstantColors.primaryTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FaceIdScreen(),
                ),
              );
            },
            child: Text(
              "Skip",
              style: GoogleFonts.poppins(
                fontSize: ConstantFontSize.small,
                fontWeight: ConstantFontWeight.normal,
                color: ConstantColors.primaryTextColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add a photo",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraLarge + 2,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.primaryTextColor,
                          ),
                        ),
                        Text(
                          "User profile",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraLarge + 2,
                            fontWeight: ConstantFontWeight.bold,
                            color: ConstantColors.primaryTextColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Upload your own photo, which will help us to verify you.",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.medium,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ConstantColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.width / 6,
                      color: ConstantColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              text: "Next",
              color: ConstantColors.primaryColor,
              onPressed: () {},
              verticalHeight: 12,
              textColor: ConstantColors.whiteColor,
              fontSize: ConstantFontSize.medium,
              fontWeight: ConstantFontWeight.semiBold,
              borderColor: ConstantColors.primaryColor,
              paddingRequired: false,
            ),

            const SizedBox(height: 20), // Add bottom padding
          ],
        ),
      ),
    );
  }
}
