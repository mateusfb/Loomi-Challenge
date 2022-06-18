import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

class Fonts {
  static final title = GoogleFonts.openSans(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: CustomColors.primary,
  );

  static final subtitle = GoogleFonts.openSans(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: CustomColors.primary,
  );

  static final formLabel = GoogleFonts.openSans(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: CustomColors.primary,
  );

  static final loginButtonStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CustomColors.secondary,
  );

  static final createAccountButtonStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CustomColors.primary.withOpacity(0.61),
  );

  static final inputTextStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CustomColors.primary,
  );

  static TextStyle headline2 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headline3 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headline4 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headline5 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headline6 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle caption = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static TextStyle overline = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
}
