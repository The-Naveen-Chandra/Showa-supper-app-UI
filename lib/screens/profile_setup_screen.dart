import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/components/profile_setup_container.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/screens/dashboard_screen.dart';
import 'package:showa_supper_app/screens/profile_address_screen.dart';
import 'package:showa_supper_app/screens/profile_info_screen.dart';

class ProfileSetupScreen extends StatelessWidget {
  final bool isPersonalInfoCompleted;
  final bool isAddressCompleted;

  const ProfileSetupScreen({
    super.key,
    required this.isPersonalInfoCompleted,
    required this.isAddressCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantColors.backgroundWhiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.close_sharp,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Image.asset(
                          "assets/images/iot_image.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    Text(
                      "Welcome to the Showa App! Let`s complete your profile",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.extraLarge,
                        fontWeight: ConstantFontWeight.bold,
                        color: ConstantColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: ConstantColors.borderColor,
                  child: Column(
                    children: [
                      ProfileSetupContainer(
                        title: "Personal Info",
                        subTitle:
                            "Name, age, and other\nidentifying information",
                        number: "1",
                        iconVisible: false,
                        isDisabled: false,
                        isCompleted: isPersonalInfoCompleted,
                        onTap: () {
                          if (!isPersonalInfoCompleted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileInfoScreen(),
                              ),
                            );
                          }
                        },
                      ),
                      ProfileSetupContainer(
                        title: "Address",
                        subTitle:
                            "The location, including\nprefecture, city, street",
                        number: "2",
                        iconVisible: !isPersonalInfoCompleted,
                        isDisabled: !isPersonalInfoCompleted,
                        isCompleted: isAddressCompleted,
                        onTap: () {
                          if (isPersonalInfoCompleted && !isAddressCompleted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileAddressScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10, // Adjust the bottom padding as needed
            left: 20,
            right: 20,
            child: PrimaryButton(
              disabled: !isAddressCompleted || !isPersonalInfoCompleted,
              text: "Sign Up",
              color: ConstantColors.primaryColor,
              onPressed: () {
                if (isAddressCompleted || isPersonalInfoCompleted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              verticalHeight: 12,
              textColor: ConstantColors.whiteColor,
              fontSize: ConstantFontSize.medium,
              fontWeight: ConstantFontWeight.semiBold,
              borderColor: ConstantColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
