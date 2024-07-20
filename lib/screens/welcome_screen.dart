import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontSize_fontWeight.dart';
import 'package:showa_supper_app/screens/carousel_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _animate = false;
  String _selectedLanguage = 'English';

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
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: ConstantColors.whiteColor,
                            builder: (context) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 34,
                                      height: 6,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      decoration: BoxDecoration(
                                        color: ConstantColors.disabledColor,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    Text(
                                      "App language",
                                      style: GoogleFonts.poppins(
                                        fontSize: ConstantFontSize.medium,
                                        fontWeight: ConstantFontWeight.bold,
                                        color: ConstantColors.primaryTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Divider(
                                      color: ConstantColors.borderColor,
                                      height: 1,
                                    ),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: ListView(
                                        children: [
                                          _buildLanguageOption(
                                            'assets/images/flags/JP_flag.png',
                                            '日本語',
                                            "Japan",
                                          ),
                                          _buildLanguageOption(
                                            'assets/images/flags/US_flag.png',
                                            'English',
                                            'US',
                                          ),
                                          // Add more language options here
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              CupertinoIcons.globe,
                              color: ConstantColors.primaryColor,
                            ),
                            Text(
                              _selectedLanguage,
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

  Widget _buildLanguageOption(String imagePath, String title, String subtitle) {
    return RadioListTile<String>(
      value: title,
      groupValue: _selectedLanguage,
      onChanged: (value) {
        setState(() {
          _selectedLanguage = value!;
        });
        Navigator.pop(context);
      },
      title: Row(
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.medium,
                  fontWeight: ConstantFontWeight.bold,
                  color: ConstantColors.primaryTextColor,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.small,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
