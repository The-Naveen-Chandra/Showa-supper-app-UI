import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/components/primary_textfield.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return emailRegex.hasMatch(email);
  }

  void _showResetPasswordDialog(String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: ConstantColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Password Reset Link Sent',
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.big,
                        fontWeight: ConstantFontWeight.bold,
                        color: ConstantColors.orangeColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Text(
                          'Successful password reset link sent to email: ',
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraExtraExtraSmall,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.secondaryTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          email,
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraExtraExtraSmall,
                            fontWeight: ConstantFontWeight.bold,
                            color: ConstantColors.primaryTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '. Please follow the email password reset instructions.',
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraExtraExtraSmall,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.secondaryTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PrimaryButton(
                        text: "OK",
                        color: ConstantColors.primaryColor,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        verticalHeight: 12,
                        textColor: ConstantColors.whiteColor,
                        fontSize: ConstantFontSize.small,
                        fontWeight: ConstantFontWeight.semiBold,
                        borderColor: ConstantColors.primaryColor,
                        paddingRequired: false,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -60,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ConstantColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: ConstantColors.yellowColor,
                      child: Image.asset(
                        "assets/images/mail_check_image.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
                        controller: _emailController,
                      ),
                      const SizedBox(height: 22),
                      PrimaryButton(
                        text: "Reset Password",
                        color: ConstantColors.primaryColor,
                        onPressed: () {
                          if (isValidEmail(_emailController.text)) {
                            _showResetPasswordDialog(_emailController.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please enter a valid email address'),
                              ),
                            );
                          }
                        },
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
