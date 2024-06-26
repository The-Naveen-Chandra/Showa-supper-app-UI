import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/components/primary_textfield.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/screens/profile_setup_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool passwordNotMatch = false;
  bool passwordInvalid = false;
  bool isChecked = false;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePasswords);
    _confirmPasswordController.addListener(_validatePasswords);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    setState(() {
      passwordNotMatch =
          _passwordController.text != _confirmPasswordController.text;
      passwordInvalid = !_isPasswordValid(_passwordController.text);
      _updateButtonState();
    });
  }

  bool _isPasswordValid(String password) {
    // Check if password has at least 8 characters, contains letters, numbers, and symbols
    if (password.length < 8) return false;

    bool hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
    bool hasDigit = password.contains(RegExp(r'\d'));
    bool hasSpecialCharacter =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasLetter && hasDigit && hasSpecialCharacter;
  }

  void _updateButtonState() {
    isButtonEnabled = !passwordNotMatch &&
        !passwordInvalid &&
        isChecked &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty;
  }

  void _onPressed() {
    if (isButtonEnabled) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileSetupScreen(
            isPersonalInfoCompleted: false,
            isAddressCompleted: false,
          ),
        ),
      );
    }
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
                          controller: _emailController,
                        ),
                        PrimaryTextfield(
                          text: "Password",
                          hintText: "Your password",
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        if (passwordInvalid)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Password must be at least 8 characters long and include letters, numbers, and symbols.",
                              style: GoogleFonts.poppins(
                                fontSize: ConstantFontSize.extraExtraExtraSmall,
                                fontWeight: ConstantFontWeight.normal,
                                color: ConstantColors.errorColor,
                              ),
                            ),
                          ),

                        PrimaryTextfield(
                          text: "Confirm Password",
                          hintText: "Type again",
                          controller: _confirmPasswordController,
                          isPassword: true,
                        ),
                        if (passwordInvalid)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Password must be at least 8 characters long and include letters, numbers, and symbols.",
                              style: GoogleFonts.poppins(
                                fontSize: ConstantFontSize.extraExtraExtraSmall,
                                fontWeight: ConstantFontWeight.normal,
                                color: ConstantColors.errorColor,
                              ),
                            ),
                          ),

                        // Password not match
                        if (passwordInvalid == false && passwordNotMatch)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Passwords do not match!",
                              style: GoogleFonts.poppins(
                                fontSize: ConstantFontSize.extraExtraExtraSmall,
                                fontWeight: ConstantFontWeight.normal,
                                color: ConstantColors.errorColor,
                              ),
                            ),
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
                                  _updateButtonState();
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
                          onPressed: _onPressed,
                          verticalHeight: 12,
                          textColor: ConstantColors.whiteColor,
                          fontSize: ConstantFontSize.medium,
                          fontWeight: ConstantFontWeight.bold,
                          borderColor: ConstantColors.primaryColor,
                          disabled: !isButtonEnabled,
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
