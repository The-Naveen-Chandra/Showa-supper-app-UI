import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ConstantColors {
  static Color primaryColor = hexToColor('#24459C');
  static Color primaryTextColor = hexToColor('#4D5983');
  static Color secondaryTextColor = hexToColor('#868DAA');
  static Color tertiaryTextColor = hexToColor('#1E6D8B');
  static Color whiteColor = hexToColor('#FFFFFF');
  static Color blackColor = hexToColor('#000000');
  static Color borderColor = hexToColor('#ECECEC');

  static Color backgroundColor = hexToColor('#f4f6fa');
  static Color backgroundWhiteColor = hexToColor('#FFFFFF');

  static Color lightGrey = hexToColor('#F3F4F6');
  static Color grey = Colors.grey[300]!;
  static Color darkGrey = hexToColor('#736F75');
  static Color textFieldColor = hexToColor('#aaa7ad');
  static Color disabledColor = hexToColor('#D7E0E7');
  static Color errorColor = hexToColor('#FF6F79');
  static Color successColor = hexToColor('#20C18D');
  static Color lightGreenColor = hexToColor('#effbf7');

  static Color linearColor = hexToColor("#24459C");
}
