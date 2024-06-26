import 'package:flutter/material.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AppBarIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      radius: 30,
      child: Container(
        height: MediaQuery.of(context).size.width / 11,
        width: MediaQuery.of(context).size.width / 11,
        decoration: BoxDecoration(
          color: ConstantColors.primaryDarkColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: ConstantColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
