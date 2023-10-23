import 'package:flutter/material.dart';

const kGreenAccent = Color(0xFF20C3AF);
const kOrangeAccent = Color(0xFFFFB19D);
const kTextfieldBackground = Color(0xFFF7F7F7);
const kHintColor = Color(0xFFB0B0C3);
const kHomeBackground = Color(0xFF525464);
const kBorderColor = Color(0XFFE2E2E0);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900]!,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black54,
    primary: Colors.white,
    secondary: Colors.grey[800]!,
  ),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.grey,
  ),
);
