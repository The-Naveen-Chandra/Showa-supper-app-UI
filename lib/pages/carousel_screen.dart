import 'package:flutter/material.dart';
import 'package:showa_supper_app/components/carousel_with_indicator.dart';
import 'package:showa_supper_app/components/primary_button.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/pages/join_us_screen.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: CarouselWithIndicator(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.28,
                ),
                child: PrimaryButton(
                  text: "Get Started",
                  borderColor: ConstantColors.primaryColor,
                  color: ConstantColors.primaryColor,
                  textColor: ConstantColors.whiteColor,
                  fontSize: ConstantFontSize.small,
                  fontWeight: ConstantFontWeight.bold,
                  verticalHeight: 10,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinUsScreen(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
