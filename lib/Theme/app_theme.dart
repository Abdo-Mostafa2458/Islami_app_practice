import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';

class AppTheme {
  static final ThemeData appThemeLight = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        titleMedium: TextStyle(
            color: AppColorsLight.blackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: AppColorsLight.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 25),
        bodySmall: TextStyle(
            color: AppColorsLight.blackColor,
            fontWeight: FontWeight.w400,
            fontSize: 25)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorsLight.primaryColor,
        showUnselectedLabels: true,
        unselectedIconTheme:
            IconThemeData(color: AppColorsLight.whiteColor, size: 40),
        // unselectedLabelStyle: TextStyle(
        //  color: Colors.white
        // ),
        selectedIconTheme:
            IconThemeData(color: AppColorsLight.blackColor, size: 50),
        unselectedItemColor: AppColorsLight.whiteColor,
        selectedItemColor: AppColorsLight.blackColor),
  );
  static final ThemeData appThemeDark = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        titleMedium: TextStyle(
            color: AppColorsDark.whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: AppColorsDark.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 25),
        bodySmall: TextStyle(
            color: AppColorsDark.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 25)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorsDark.DarkColor,
        showUnselectedLabels: true,
        unselectedIconTheme:
            IconThemeData(color: AppColorsDark.whiteColor, size: 40),
        // unselectedLabelStyle: TextStyle(
        //  color: Colors.white
        // ),
        selectedIconTheme:
            IconThemeData(color: AppColorsDark.primaryGoldenColor, size: 50),
        unselectedItemColor: AppColorsDark.whiteColor,
        selectedItemColor: AppColorsDark.primaryGoldenColor),
  );
}
