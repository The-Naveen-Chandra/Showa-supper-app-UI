import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/pages/search_screen.dart';
import 'package:showa_supper_app/pages/notification_screen.dart';
import 'package:showa_supper_app/components/appbar_icon_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      body: Column(
        children: [
          Container(
            color: ConstantColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 9,
                        width: MediaQuery.of(context).size.width / 9,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/avatar_image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Naveen!',
                            style: GoogleFonts.poppins(
                              fontSize: ConstantFontSize.small,
                              color: ConstantColors.whiteColor,
                              fontWeight: ConstantFontWeight.normal,
                            ),
                          ),
                          Text(
                            'Mon Jun 25',
                            style: GoogleFonts.poppins(
                              fontSize: ConstantFontSize.small,
                              color: ConstantColors.whiteColor,
                              fontWeight: ConstantFontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.width / 11,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: ConstantColors.primaryDarkColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.currency_yen,
                                color: ConstantColors.whiteColor,
                              ),
                              Text(
                                '50,000',
                                style: GoogleFonts.poppins(
                                  fontSize: ConstantFontSize.small,
                                  color: ConstantColors.whiteColor,
                                  fontWeight: ConstantFontWeight.normal,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      AppBarIconButton(
                        icon: CupertinoIcons.search,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppBarIconButton(
                        icon: CupertinoIcons.bell,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
