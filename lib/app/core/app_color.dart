import 'package:flutter/material.dart';

class AppColor {
  // Light theme colors
  static const appBackground = Colors.white;
  static const appBlk = Colors.black;
  static const grey = Colors.grey;
  static final lightGrey = Colors.grey.shade200;
  static final cardScreen = Colors.grey.shade100;

  // Dark theme colors
  static const darkBackground = Color(0xFF121212);
  static const darkCard = Color(0xFF1E1E1E);
  static const darkSurface = Color(0xFF222222);
  static const darkText = Colors.white;
  static const darkTitleText = Colors.white;

  static const primary = Color(0xFF693B93);
  static const secondary = Color(0xFF9C27B0);
  static const error = Colors.redAccent;

  static const linearAppBar = LinearGradient(
    colors: [
      Color(0x80693B93),
      Color(0xFF693B93),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}




