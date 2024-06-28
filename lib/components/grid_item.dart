import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/utils.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class GridItemWidget extends StatelessWidget {
  final GridItemModel item;

  const GridItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: ConstantColors.borderColor,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.imageUrl,
          ),
          const SizedBox(height: 8.0),
          Text(
            item.title,
            style: GoogleFonts.poppins(
              fontSize: ConstantFontSize.extraExtraExtraSmall,
              fontWeight: ConstantFontWeight.normal,
              color: ConstantColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
