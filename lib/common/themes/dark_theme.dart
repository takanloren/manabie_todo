import 'package:flutter/material.dart';

class DarkTheme{
  static final data = ThemeData(
    primaryColor: Colors.black,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF212121),
      foregroundColor: Colors.blueAccent,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.white, brightness: Brightness.dark),
  );
}