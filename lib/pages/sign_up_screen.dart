import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/components/primary_textfield.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = true;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's create",
                                style: GoogleFonts.poppins(
                                  fontSize: ConstantFontSize.extraLarge + 2,
                                  fontWeight: ConstantFontWeight.normal,
                                  color: ConstantColors.primaryTextColor,
                                ),
                              ),
                              Text(
                                "Your Account",
                                style: GoogleFonts.poppins(
                                  fontSize: ConstantFontSize.extraLarge + 2,
                                  fontWeight: ConstantFontWeight.bold,
                                  color: ConstantColors.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
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
                        PrimaryTextfield(
                          text: "Confirm Password",
                          hintText: "Type again",
                          controller: TextEditingController(),
                          isPassword: true,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: ConstantColors.primaryColor,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Read our ",
                                        style: GoogleFonts.poppins(
                                          fontSize: ConstantFontSize.extraSmall,
                                          fontWeight: ConstantFontWeight.normal,
                                          color:
                                              ConstantColors.secondaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        "Privacy Policy. ",
                                        style: GoogleFonts.poppins(
                                          fontSize: ConstantFontSize.extraSmall,
                                          fontWeight:
                                              ConstantFontWeight.semiBold,
                                          color:
                                              ConstantColors.tertiaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Tap "Agree and',
                                        style: GoogleFonts.poppins(
                                          fontSize: ConstantFontSize.extraSmall,
                                          fontWeight: ConstantFontWeight.normal,
                                          color:
                                              ConstantColors.secondaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'continue" to accept the ',
                                        style: GoogleFonts.poppins(
                                          fontSize: ConstantFontSize.extraSmall,
                                          fontWeight: ConstantFontWeight.normal,
                                          color:
                                              ConstantColors.secondaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Terms of Service.',
                                        style: GoogleFonts.poppins(
                                          fontSize: ConstantFontSize.extraSmall,
                                          fontWeight:
                                              ConstantFontWeight.semiBold,
                                          color:
                                              ConstantColors.tertiaryTextColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        PrimaryButton(
                          text: "Agree and continue",
                          color: ConstantColors.primaryColor,
                          onPressed: () {},
                          verticalHeight: 12,
                          textColor: ConstantColors.whiteColor,
                          fontSize: ConstantFontSize.medium,
                          fontWeight: ConstantFontWeight.bold,
                          borderColor: ConstantColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
