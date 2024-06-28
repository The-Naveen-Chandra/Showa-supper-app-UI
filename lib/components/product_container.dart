import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width / 3.6,
      decoration: BoxDecoration(
        color: ConstantColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: ConstantColors.borderColor,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Center(
                child: Image.asset(
                  "assets/images/top_selling_image.png",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 6, right: 6, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Selling Item",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraExtraExtraSmall,
                      fontWeight: ConstantFontWeight.bold,
                      color: ConstantColors.blackColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "¥299,99",
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.extraExtraExtraSmall,
                          fontWeight: ConstantFontWeight.bold,
                          color: ConstantColors.primaryColor,
                        ),
                      ),
                      Text(
                        "¥299,99",
                        style: GoogleFonts.poppins(
                          fontSize: ConstantFontSize.extraExtraExtraSmall - 2,
                          fontWeight: ConstantFontWeight.normal,
                          color: ConstantColors.secondaryTextColor,
                          decoration: TextDecoration.lineThrough,
                        ),
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
