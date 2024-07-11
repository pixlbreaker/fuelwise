import 'package:flutter/material.dart';

// Light Mode
ThemeData lightMode = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.blue,
  ),
);

// Dark Mode
ThemeData darkMode = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.white,
    secondary: Colors.grey.shade700,
  ),
);
