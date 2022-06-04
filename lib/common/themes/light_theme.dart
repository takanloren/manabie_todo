import 'package:flutter/material.dart';

class LightTheme{
  static final data = ThemeData(
    primaryColor: Colors.white,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE5E5E5),
      foregroundColor: Colors.blueAccent,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.black, brightness: Brightness.light),

  );
}