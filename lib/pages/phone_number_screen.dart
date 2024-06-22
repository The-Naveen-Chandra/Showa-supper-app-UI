import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';

import 'package:showa_supper_app/constants/utils.dart';
import 'package:showa_supper_app/pages/sign_up_screen.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/components/country_selector.dart';
import 'package:showa_supper_app/components/phone_number_textfield.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  CountryCode _selectedCountry = countryCodes[0];

  void _selectCountry() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountrySelector(
          initialSelectedCountry: _selectedCountry,
          onCountrySelected: (country) {
            setState(() {
              _selectedCountry = country;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      20, 20, 20, 0), // Adjust bottom padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ConstantColors.lightGrey,
                            ),
                            child: const Icon(
                              Icons.close_sharp,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        "Let's start with\nphone",
                        style: GoogleFonts.poppins(
                          height: 1.1,
                          fontSize: ConstantFontSize.extraExtraLarge,
                          fontWeight: ConstantFontWeight.bold,
                          color: ConstantColors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Don't have account? ",
                            style: GoogleFonts.poppins(
                              fontSize: ConstantFontSize.small,
                              fontWeight: ConstantFontWeight.normal,
                              color: ConstantColors.secondaryTextColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.poppins(
                                fontSize: ConstantFontSize.small,
                                fontWeight: ConstantFontWeight.bold,
                                color: ConstantColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: _selectCountry,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 2,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: ConstantColors.lightGrey,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  _selectedCountry.flagSrc,
                                  width: 24,
                                  height: 24,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${_selectedCountry.name} ",
                                      style: GoogleFonts.poppins(
                                        fontSize: ConstantFontSize.extraSmall,
                                      ),
                                    ),
                                    Text(
                                      "(${_selectedCountry.code})",
                                      style: GoogleFonts.poppins(
                                        fontSize: ConstantFontSize.extraSmall,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  CupertinoIcons.chevron_down,
                                  color: ConstantColors.secondaryTextColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const PhoneNumberTextField(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10), // Adjust padding as needed
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  text: "Next",
                  color: ConstantColors.primaryColor,
                  onPressed: () {},
                  verticalHeight: 12,
                  textColor: ConstantColors.whiteColor,
                  fontSize: ConstantFontSize.medium,
                  fontWeight: ConstantFontWeight.bold,
                  borderColor: ConstantColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
