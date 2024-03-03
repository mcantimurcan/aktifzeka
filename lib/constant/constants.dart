import 'package:flutter/material.dart';

Color kblue = const Color(0xFF4756DF);
Color kwhite = const Color(0xFFFFFFFF);
Color kblack = const Color(0xFF000000);
Color kbrown300 = const Color(0xFF8D6E63);
Color kbrown = const Color(0xFF795548);
Color kgrey = const Color(0xFFC0C0C0);
Color lilia = const Color(0xffB38ED3);

Color green1 = const Color(0xFF2D033B);
Color green2 = const Color(0xFF810CA8);
Color green3 = const Color(0xFFC147E9);
Color green4 = const Color(0xFFE5B8F4);

bool iconBool = false;

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.purple,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey.shade200,
    secondary: Colors.grey[700]!,
    tertiary: Colors.grey[900],
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.purple,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
  ),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey[900]!,
    primary: Colors.grey[800]!,
    secondary: Colors.grey[700]!,
    tertiary: Colors.grey[300],
  ),
);

IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;
