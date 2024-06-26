import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/screens/profile_setup_screen.dart';

class FaceIdScreen extends StatelessWidget {
  const FaceIdScreen({super.key});

  void _navigateToProfileSetup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileSetupScreen(
          isPersonalInfoCompleted: true,
          isAddressCompleted: false,
        ),
      ),
    );
  }

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/images/face_id_image.png"),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Face ID",
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.big,
                        fontWeight: ConstantFontWeight.bold,
                        color: ConstantColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please set up your Face ID to access Showa account.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.small,
                        fontWeight: ConstantFontWeight.normal,
                        color: ConstantColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Continue",
                  color: ConstantColors.primaryColor,
                  onPressed: () {},
                  verticalHeight: 12,
                  textColor: ConstantColors.whiteColor,
                  fontSize: ConstantFontSize.medium,
                  fontWeight: ConstantFontWeight.semiBold,
                  borderColor: ConstantColors.primaryColor,
                  paddingRequired: false,
                ),
                const SizedBox(height: 10), // Add space between the buttons
                PrimaryButton(
                  text: "Skip",
                  color: ConstantColors.whiteColor,
                  onPressed: () {
                    _navigateToProfileSetup(context);
                  },
                  verticalHeight: 12,
                  textColor: ConstantColors.blackColor,
                  fontSize: ConstantFontSize.medium,
                  fontWeight: ConstantFontWeight.semiBold,
                  borderColor: ConstantColors.borderColor,
                ),
                const SizedBox(height: 10), // Add bottom padding
              ],
            ),
          ],
        ),
      ),
    );
  }
}
