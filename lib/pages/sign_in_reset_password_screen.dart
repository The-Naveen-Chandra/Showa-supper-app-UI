import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/components/primary_textfield.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class SignInResetPasswordScreen extends StatefulWidget {
  const SignInResetPasswordScreen({super.key});

  @override
  State<SignInResetPasswordScreen> createState() =>
      _SignInResetPasswordScreenState();
}

class _SignInResetPasswordScreenState extends State<SignInResetPasswordScreen> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/buildings_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  ConstantColors.linearColor,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ConstantColors.whiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/showa_logo_red_white.png",
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: ConstantColors.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        "Reset password",
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.extraExtraLarge,
                          fontWeight: ConstantFontWeight.bold,
                          color: ConstantColors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 40),
                      PrimaryTextfield(
                        text: "Email Address",
                        hintText: "Your email address",
                        controller: TextEditingController(),
                      ),
                      const SizedBox(height: 22),
                      PrimaryButton(
                        text: "Reset Password",
                        color: ConstantColors.primaryColor,
                        onPressed: () {},
                        verticalHeight: 12,
                        textColor: ConstantColors.whiteColor,
                        fontSize: ConstantFontSize.small,
                        fontWeight: ConstantFontWeight.semiBold,
                        borderColor: ConstantColors.primaryColor,
                        paddingRequired: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
