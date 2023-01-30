import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#FE4E2D");
  static Color secondry = HexColor.fromHex("#2C47F8");
  static Color greyBorderColor = HexColor.fromHex("#C5C5C5");
  static Color greylightColor = HexColor.fromHex("#F5F5F5");
  static Color avatarColor = HexColor.fromHex("#37CFF0");
  static Color subtitleColor = HexColor.fromHex("#454545");

//------------------------------------darkThemeColor---------

  static Color primarydarkColor = HexColor.fromHex("#535C73");
  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color whiteColor = Colors.white;
  static Color greyColor = Colors.grey;
  static const Color blackColor = Colors.black;

  //profileGridviewBuildercolor
  static Color topupColor = HexColor.fromHex("#ED2C6F");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
