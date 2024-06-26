import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/screens/sign_in_screen.dart';

class JoinUsScreen extends StatelessWidget {
  const JoinUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/showa_logo_only.png",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Anything & Everything",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraLarge,
                      fontWeight: ConstantFontWeight.bold,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Combining IoT and Modern Data\nScience for Efficient Service",
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
            PrimaryButton(
              text: "Log in",
              borderColor: ConstantColors.primaryColor,
              color: ConstantColors.primaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              verticalHeight: 12,
              textColor: ConstantColors.whiteColor,
              fontSize: ConstantFontSize.medium,
              fontWeight: ConstantFontWeight.bold,
            ),
            PrimaryButton(
              text: "I'm new, Sign me up",
              color: ConstantColors.lightGrey,
              onPressed: () {},
              verticalHeight: 12,
              borderColor: ConstantColors.borderColor,
              textColor: ConstantColors.primaryColor,
              fontSize: ConstantFontSize.medium,
              fontWeight: ConstantFontWeight.bold,
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
