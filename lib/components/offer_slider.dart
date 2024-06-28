import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class OfferSlider extends StatelessWidget {
  const OfferSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width / 1.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ConstantColors.borderColor,
            width: 1.5,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2, // 2 parts of the total 3 parts
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/offer_image.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1, // 1 part of the total 3 parts
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      color: ConstantColors.whiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.discount_outlined,
                              color: ConstantColors.secondaryTextColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Basic Package",
                              style: GoogleFonts.poppins(
                                fontSize: ConstantFontSize.extraSmall,
                                fontWeight: ConstantFontWeight.normal,
                                color: ConstantColors.primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "1 washing machine, 1 sensor module",
                            style: GoogleFonts.poppins(
                              fontSize: ConstantFontSize.extraExtraExtraSmall,
                              fontWeight: ConstantFontWeight.normal,
                              color: ConstantColors.primaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: Container(
                width: MediaQuery.of(context).size.width / 7,
                height: MediaQuery.of(context).size.width / 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ConstantColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OFF",
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.extraExtraSmall,
                        fontWeight: ConstantFontWeight.bold,
                        color: ConstantColors.whiteColor,
                      ),
                    ),
                    Text(
                      "15%",
                      style: GoogleFonts.poppins(
                        fontSize: ConstantFontSize.medium,
                        fontWeight: ConstantFontWeight.semiBold,
                        color: ConstantColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
