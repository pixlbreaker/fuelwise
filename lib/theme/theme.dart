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
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF21222D),
    primary: Color(0xFF2697FF),
    secondary: Color(0xFFFFFFFF),
  ),
);
