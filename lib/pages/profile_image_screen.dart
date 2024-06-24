import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/components/primary_button.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/pages/face_id_screen.dart';

class ProfileImageScreen extends StatefulWidget {
  const ProfileImageScreen({super.key});

  @override
  State<ProfileImageScreen> createState() => _ProfileImageScreenState();
}

class _ProfileImageScreenState extends State<ProfileImageScreen> {
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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FaceIdScreen(),
                ),
              );
            },
            child: Text(
              "Skip",
              style: GoogleFonts.poppins(
                fontSize: ConstantFontSize.small,
                fontWeight: ConstantFontWeight.normal,
                color: ConstantColors.primaryTextColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add a photo",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraLarge + 2,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.primaryTextColor,
                          ),
                        ),
                        Text(
                          "User profile",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.extraLarge + 2,
                            fontWeight: ConstantFontWeight.bold,
                            color: ConstantColors.primaryTextColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Upload your own photo, which will help us to verify you.",
                          style: GoogleFonts.poppins(
                            fontSize: ConstantFontSize.medium,
                            fontWeight: ConstantFontWeight.normal,
                            color: ConstantColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ConstantColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.width / 6,
                      color: ConstantColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              text: "Next",
              color: ConstantColors.primaryColor,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: ConstantColors.whiteColor,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 3.8,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 34,
                            height: 6,
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: ConstantColors.disabledColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView(
                              children: const [
                                ProfileImageSelector(
                                  imagePath: 'assets/images/photos_image.png',
                                  title: 'Choose from camera roll',
                                ),
                                SizedBox(height: 14),
                                ProfileImageSelector(
                                  imagePath: 'assets/images/camera_image.png',
                                  title: 'Take Photo',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              verticalHeight: 12,
              textColor: ConstantColors.whiteColor,
              fontSize: ConstantFontSize.medium,
              fontWeight: ConstantFontWeight.semiBold,
              borderColor: ConstantColors.primaryColor,
              paddingRequired: false,
            ),

            const SizedBox(height: 20), // Add bottom padding
          ],
        ),
      ),
    );
  }
}

class ProfileImageSelector extends StatelessWidget {
  final String imagePath;
  final String title;

  const ProfileImageSelector({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ConstantColors.borderColor,
            ),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: ConstantFontSize.medium,
              fontWeight: ConstantFontWeight.normal,
              color: ConstantColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
