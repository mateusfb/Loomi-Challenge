import 'package:flutter/material.dart';

class CustomColors {
  static Color primary = HexColor("#ffffff");
  static Color secondary = HexColor("#5b4da7");
  static Color white = HexColor("#ffffff");
  static Color black = HexColor("#000000");
  static Color grey = HexColor("#0d2C3B8B");
  static Color lightGrey = HexColor("#f2f2f2");
  static Color purple = HexColor("#5b4da7");
  static Color red = HexColor("#ff0c0c");
  static Color darkRed = HexColor("#a90000");
  static Color mediumGrey = HexColor("#A4A4A4");

  static Color cardColor = HexColor("#EAEAEA");
  static Color cardBorderColor = HexColor("#40404026");
  static Color cardIndicationColor = HexColor("#DADADA");

  static Color loginGradientStart = HexColor("#776cb6");
  static Color loginGradientEnd = HexColor("#5b4da7");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
