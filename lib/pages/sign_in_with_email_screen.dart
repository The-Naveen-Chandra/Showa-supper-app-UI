import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/components/primary_textfield.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/pages/reset_password_screen.dart';
import 'package:showa_supper_app/pages/sign_up_screen.dart';

class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({super.key});

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
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
                padding: const EdgeInsets.only(left: 6, top: 26),
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
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 34),
                                Text(
                                  "Welcome Back",
                                  style: GoogleFonts.poppins(
                                    fontSize: ConstantFontSize.extraExtraLarge,
                                    fontWeight: ConstantFontWeight.bold,
                                    color: ConstantColors.primaryTextColor,
                                  ),
                                ),
                                Text(
                                  "Enter your details below",
                                  style: GoogleFonts.poppins(
                                    fontSize: ConstantFontSize.small,
                                    fontWeight: ConstantFontWeight.normal,
                                    color: ConstantColors.secondaryTextColor,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                PrimaryTextfield(
                                  text: "Email Address",
                                  hintText: "Your email address",
                                  controller: TextEditingController(),
                                ),
                                PrimaryTextfield(
                                  text: "Password",
                                  hintText: "Your password",
                                  controller: TextEditingController(),
                                  isPassword: true,
                                ),
                                const SizedBox(height: 22),
                                PrimaryButton(
                                  text: "Sign In",
                                  color: ConstantColors.primaryColor,
                                  onPressed: () {},
                                  verticalHeight: 12,
                                  textColor: ConstantColors.whiteColor,
                                  fontSize: ConstantFontSize.small,
                                  fontWeight: ConstantFontWeight.semiBold,
                                  borderColor: ConstantColors.primaryColor,
                                  paddingRequired: false,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor:
                                              ConstantColors.primaryColor,
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Remember me!",
                                          style: GoogleFonts.poppins(
                                            fontSize:
                                                ConstantFontSize.extraSmall,
                                            fontWeight:
                                                ConstantFontWeight.normal,
                                            color: ConstantColors.darkGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ResetPasswordScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Forgot your password?",
                                          style: GoogleFonts.poppins(
                                            fontSize:
                                                ConstantFontSize.extraSmall,
                                            fontWeight:
                                                ConstantFontWeight.semiBold,
                                            color: ConstantColors.darkGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: GoogleFonts.poppins(
                                        fontSize: ConstantFontSize.extraSmall,
                                        fontWeight: ConstantFontWeight.semiBold,
                                        color: ConstantColors.darkGrey,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ConstantColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          "Sign Up",
                                          style: GoogleFonts.poppins(
                                            color: ConstantColors.whiteColor,
                                            fontSize:
                                                ConstantFontSize.extraSmall,
                                            fontWeight:
                                                ConstantFontWeight.semiBold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 58),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
