import 'package:flutter/material.dart';

class DarkTheme{
  static final data = ThemeData(
    primaryColor: Colors.black,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.white, brightness: Brightness.dark),
  );
}