import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/constants/utils.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({super.key});

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % items.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: items.asMap().entries.map((item) {
            int index = item.key;
            return AnimatedOpacity(
              opacity: _currentIndex == index ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        item.value.imgSrc,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.value.title,
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.large,
                        fontWeight: ConstantFontWeight.bold,
                        color: ConstantColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.value.description,
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
            );
          }).toList(),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.map((url) {
            int index = items.indexOf(url);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: MediaQuery.of(context).size.width / 60,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? ConstantColors.primaryColor
                    : ConstantColors.primaryColor.withOpacity(0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
