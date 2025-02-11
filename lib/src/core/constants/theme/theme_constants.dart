import 'package:flutter/material.dart';

import '../colors/color_constants.dart';

class ThemeConstants {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorConstants.gray,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: ColorConstants.black),
      color: ColorConstants.white,
      iconTheme: IconThemeData(color: ColorConstants.black),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: ColorConstants.white,
      secondary: ColorConstants.black,
      primaryContainer: ColorConstants.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.white,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: ColorConstants.white),
      color: ColorConstants.black,
      iconTheme: IconThemeData(color: ColorConstants.black),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.blueGrey,
      secondary: ColorConstants.darkGray,
      primaryContainer: ColorConstants.darkGray,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.white,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
    ),
  );
}
