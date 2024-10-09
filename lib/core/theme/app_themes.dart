import 'package:cubit_test/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static final lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBg1,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 12, color: AppColors.lightText3),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.lightText2),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.lightText1),
      titleSmall: TextStyle(
          fontSize: 18,
          color: AppColors.lightText3,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 20,
          color: AppColors.lightText2,
          fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 22,
          color: AppColors.lightText1,
          fontWeight: FontWeight.bold),
    ),
    brightness: Brightness.light,
  );

  // Dark Theme
  static final darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBg1,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 12, color: AppColors.darkText3),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.darkText2),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.darkText1),
      titleSmall: TextStyle(
          fontSize: 18,
          color: AppColors.darkText3,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 20,
          color: AppColors.darkText2,
          fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 22,
          color: AppColors.darkText1,
          fontWeight: FontWeight.bold),
    ),
    brightness: Brightness.dark,
  );
}