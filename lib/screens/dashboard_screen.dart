import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/constants/utils.dart';

import 'package:showa_supper_app/screens/search_screen.dart';
import 'package:showa_supper_app/screens/notification_screen.dart';
import 'package:showa_supper_app/components/appbar_icon_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                  left: 10, right: 10, top: 50, bottom: 20),
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
                              builder: (context) => const SearchScreen(),
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
          Expanded(
            child: dashboardPages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(
                  CupertinoIcons.home,
                  size: 26,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(
                  CupertinoIcons.bolt,
                  size: 26,
                ),
              ),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(
                  Icons.chat_bubble_outline,
                  size: 26,
                ),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(
                  CupertinoIcons.person,
                  size: 26,
                ),
              ),
              label: 'Profile',
            ),
          ],
          elevation: 10,
          backgroundColor: ConstantColors.whiteColor,
          currentIndex: _selectedIndex,
          selectedItemColor: ConstantColors.primaryColor,
          unselectedItemColor: ConstantColors.secondaryTextColor,
          onTap: _onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.poppins(
              fontSize: ConstantFontSize.extraSmall,
              fontWeight: ConstantFontWeight.bold),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: ConstantFontSize.extraSmall,
            fontWeight: ConstantFontWeight.normal,
          ),
        ),
      ),
    );
  }
}
