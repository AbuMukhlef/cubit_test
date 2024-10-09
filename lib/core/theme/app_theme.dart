import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    
    fontFamily: 'myFont',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'myFont',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
  );
}