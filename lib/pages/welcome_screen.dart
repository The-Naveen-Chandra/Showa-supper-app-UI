import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontSize_fontWeight.dart';
import 'package:showa_supper_app/pages/carousel_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    // Start the animation after a short delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _animate = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _animate ? 150 : 250,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/showa_logo_trans.png'),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _animate ? 1.0 : 0.0,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: _animate ? 260 : 360,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Showa Supper App',
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.big,
                        fontWeight: ConstantFontWeight.bold,
                        color: ConstantColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Read our ",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.small,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.secondaryTextColor,
                          ),
                        ),
                        Text(
                          "Privacy Policy.",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.small,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.tertiaryTextColor,
                          ),
                        ),
                        Text(
                          'Tap "Agree and',
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.small,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'continue" to accept the ',
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.small,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.secondaryTextColor,
                          ),
                        ),
                        Text(
                          'Terms of Service.',
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.small,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.tertiaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      verticalHeight: 12,
                      text: 'Agree & continue',
                      borderColor: ConstantColors.primaryColor,
                      color: ConstantColors.primaryColor,
                      textColor: ConstantColors.whiteColor,
                      fontSize: ConstantFontSize.medium,
                      fontWeight: ConstantFontWeight.bold,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CarouselScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.25,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: ConstantColors.lightGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            CupertinoIcons.globe,
                            color: ConstantColors.primaryColor,
                          ),
                          Text(
                            "English",
                            style: GoogleFonts.poppins(
                              fontSize: ConstantFontSize.small,
                              fontWeight: ConstantFontWeight.normal,
                              color: ConstantColors.primaryColor,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.chevron_down,
                            color: ConstantColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
