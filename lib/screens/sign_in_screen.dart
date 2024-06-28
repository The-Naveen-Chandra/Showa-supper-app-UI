import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/screens/phone_number_screen.dart';
import 'package:showa_supper_app/screens/sign_in_with_email_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
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
      backgroundColor: ConstantColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: Image.asset(
                    "assets/images/showa_logo_trans.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Log in to Showa",
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.extraExtraLarge,
                  fontWeight: ConstantFontWeight.bold,
                  color: ConstantColors.primaryTextColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                "Log in with your registered phone number to get started. If you linked your account to any of the below services, you can also log in with one of those.",
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.small,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.secondaryTextColor,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              PrimaryButton(
                verticalHeight: 12,
                text: 'Log in with email address',
                borderColor: ConstantColors.primaryColor,
                color: ConstantColors.primaryColor,
                textColor: ConstantColors.whiteColor,
                fontSize: ConstantFontSize.small,
                fontWeight: ConstantFontWeight.normal,
                iconImage: "assets/images/mail.png",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInWithEmailScreen(),
                    ),
                  );
                },
              ),
              PrimaryButton(
                verticalHeight: 12,
                text: 'Log in with phone number',
                borderColor: ConstantColors.borderColor,
                color: ConstantColors.lightGrey,
                textColor: ConstantColors.blackColor,
                fontSize: ConstantFontSize.small,
                fontWeight: ConstantFontWeight.normal,
                iconImage: "assets/images/phone.png",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneNumberScreen(),
                    ),
                  );
                },
              ),
              PrimaryButton(
                verticalHeight: 12,
                text: 'Log in with Face ID',
                borderColor: ConstantColors.borderColor,
                color: ConstantColors.lightGrey,
                textColor: ConstantColors.blackColor,
                fontSize: ConstantFontSize.small,
                fontWeight: ConstantFontWeight.normal,
                iconImage: "assets/images/face_id_apple.png",
                onPressed: () {},
              ),
              PrimaryButton(
                verticalHeight: 12,
                text: 'Sign in with Apple ID',
                borderColor: ConstantColors.borderColor,
                color: ConstantColors.lightGrey,
                textColor: ConstantColors.blackColor,
                fontSize: ConstantFontSize.small,
                fontWeight: ConstantFontWeight.normal,
                iconImage: "assets/images/apple_logo.png",
                onPressed: () {},
              ),
              PrimaryButton(
                verticalHeight: 12,
                text: 'Continue with Google',
                borderColor: ConstantColors.borderColor,
                color: ConstantColors.lightGrey,
                textColor: ConstantColors.blackColor,
                fontSize: ConstantFontSize.small,
                fontWeight: ConstantFontWeight.normal,
                iconImage: "assets/images/google_logo.png",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
