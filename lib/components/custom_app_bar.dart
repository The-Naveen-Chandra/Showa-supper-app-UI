import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final String subtitle;
  final VoidCallback onActionTap;
  final bool isActionVisible;
  final bool isActionDisabled;
  final IconData leadingIcon;

  const CustomAppBar({
    super.key,
    required this.appBar,
    required this.title,
    this.subtitle = "",
    required this.leadingIcon,
    required this.isActionVisible,
    required this.onActionTap,
    this.isActionDisabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ConstantColors.backgroundColor,
      leading: IconButton(
        icon: Icon(
          leadingIcon,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: subtitle.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: ConstantFontSize.big,
                    fontWeight: ConstantFontWeight.bold,
                    color: ConstantColors.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: ConstantFontSize.extraSmall,
                    fontWeight: ConstantFontWeight.normal,
                    color: ConstantColors.secondaryTextColor,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: ConstantFontSize.big,
                fontWeight: ConstantFontWeight.bold,
                color: ConstantColors.primaryTextColor,
              ),
            ),
      actions: [
        isActionVisible
            ? IconButton(
                icon: Icon(
                  Icons.check_sharp,
                  size: 30,
                  color: isActionDisabled
                      ? ConstantColors.disabledColor
                      : ConstantColors.primaryColor,
                ),
                onPressed: isActionDisabled ? () {} : onActionTap,
              )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
