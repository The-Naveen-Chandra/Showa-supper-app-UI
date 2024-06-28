import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class DashboardSlider extends StatefulWidget {
  const DashboardSlider({super.key});

  @override
  State<DashboardSlider> createState() => _DashboardSliderState();
}

class _DashboardSliderState extends State<DashboardSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 0.19,
          child: Stack(
            children: [
              PageView(
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: [
                  _buildCarouselItem(
                    context,
                    "Showa Co. Ltd",
                    "Continue to create the things that don't\nexist in the world",
                    "assets/images/showa_dashboard_image.png",
                  ),
                  _buildCarouselItem(
                    context,
                    "Innovation Hub",
                    "Empowering innovative solutions\nfor a better future",
                    "assets/images/showa_dashboard_image.png",
                  ),
                  _buildCarouselItem(
                    context,
                    "Sustainability",
                    "Fostering sustainable practices\nfor the environment",
                    "assets/images/showa_dashboard_image.png",
                  ),
                ],
              ),

              // Indicator dots row
              Positioned(
                bottom: 10,
                right: 20,
                child: Row(
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentIndex == index ? 22 : 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? ConstantColors.whiteColor
                            : ConstantColors.secondaryTextColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, String title, String subtitle, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.big,
                  fontWeight: ConstantFontWeight.bold,
                  color: ConstantColors.whiteColor,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: ConstantFontSize.extraExtraSmall,
                  fontWeight: ConstantFontWeight.normal,
                  color: ConstantColors.whiteColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.048,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: ConstantColors.primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  "Get started",
                  style: GoogleFonts.poppins(
                    fontSize: ConstantFontSize.small,
                    fontWeight: ConstantFontWeight.normal,
                    color: ConstantColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
