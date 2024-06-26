import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/notification_card.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final bool isNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.whiteColor,
        shadowColor: ConstantColors.blackColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ConstantColors.primaryTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: ConstantFontSize.big,
            fontWeight: ConstantFontWeight.semiBold,
            color: ConstantColors.primaryTextColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: ConstantColors.primaryTextColor,
            ),
          ),
        ],
      ),
      body: isNotification
          ? const NotificationCard()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstantColors.lightPink,
                        ),
                        child: Image.asset(
                          'assets/images/happy_notification_image.png',
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        "You're all caught up",
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.big,
                          fontWeight: ConstantFontWeight.bold,
                          color: ConstantColors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Come back later for Reminders, Trips,\nmoments notifications',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.small,
                          fontWeight: ConstantFontWeight.normal,
                          color: ConstantColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
              ],
            ),
    );
  }
}
