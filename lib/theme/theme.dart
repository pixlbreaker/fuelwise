import 'package:flutter/material.dart';

// Light Mode
ThemeData lightMode = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    secondary: Colors.blue,
  ),
);

// Dark Mode
ThemeData darkMode = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.white,
    secondary: Colors.grey.shade700,
  ),
);
