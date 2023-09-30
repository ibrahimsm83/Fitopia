import 'package:flutter/material.dart';

class ColorManager {

  static const Color fabYellowColor = Color(0xFFFFE765);
  static const Color fabPurpleColor = Color(0xFFA977FF);
  static const Color fabgreenColor = Color(0xFF5EFCAC);
  static const Color fabBlueColor = Color(0xFF5FC4FA);
  


  static Color primary = HexColor.fromHex("#FE4E2D");
  static Color secondry = HexColor.fromHex("#2C47F8");
  static Color secondryTwo = HexColor.fromHex("#8154FF");
  static Color graphLineColor = HexColor.fromHex("#332589");
  static Color greyBorderColor = HexColor.fromHex("#C5C5C5");
  static Color greyBoxColor = HexColor.fromHex("#F5F5F5");
  static Color darkGreyColor = HexColor.fromHex("#646464");

  static Color greylightColor = HexColor.fromHex("#F5F5F5");
  static Color avatarColor = HexColor.fromHex("#37CFF0");
  static Color subtitleColor = HexColor.fromHex("#454545");

//------------------------------------darkThemeColor---------

  static Color primarydarkColor = HexColor.fromHex("#242A38");
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

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color chatTextColor = Color(0xFFAEAECE);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
