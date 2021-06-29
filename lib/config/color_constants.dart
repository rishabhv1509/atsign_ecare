import 'dart:ui';

import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color boxShadow = hexToColor('#ffad9c');
  static Color homeScreenShadow = hexToColor('#EDEDED');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#f57053');
  static Color secondaryDarkAppColor = Colors.white;
  static Color black = Colors.black;
  static Color headingText = hexToColor('#26315F');
  static Color grey = hexToColor('#939393');
  static Color logoBg = hexToColor('#F05E3E');
  static Color unselectedBoxShadow = hexToColor('#EAEDF1');
  static Color greyIconColor = hexToColor('#D2D2D2');
  static Color indicatorColor = hexToColor('#D1D0D0');
  static Color appbarColor = hexToColor('#F9FBFF');
  static Color greyColor = hexToColor('#5D5F63');
  static Color sliderColor = hexToColor('#EBEDF2');
  static Color starColor = hexToColor('#FDC900');
  static Color deleteColor = hexToColor('#F37474');
  static Color fadedGrey = hexToColor('#F2F2F2');
  static Color chatLabel = hexToColor('#C9C7CB');
  static Color profilebgone = hexToColor('#F2F4F8');
  static Color profilebgtwo = hexToColor('#F9FBFF');
  static Color pastBooking = hexToColor('#F7F8FA');
  static Color unselectedColor = Colors.grey[300];
}
