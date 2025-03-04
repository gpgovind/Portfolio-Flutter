import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/core/app_color.dart';

class AppTheme {
  static final appTheme = ThemeData(
      primaryColor: AppColor.appBackground,
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData().textTheme,
      ).apply(
        bodyColor: AppColor.appBlk,
        displayColor: AppColor.appBlk,
      ),
      scaffoldBackgroundColor: AppColor.appBackground);
}
