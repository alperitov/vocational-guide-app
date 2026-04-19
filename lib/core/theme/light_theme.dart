import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: const Color(0xff6155F5),
        brightness: Brightness.light,
      ).copyWith(
        primary: const Color(0xff6155F5),
        secondary: const Color(0xffFFA95C),
        surface: const Color(0xffFCFCFC),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff6155F5),
      foregroundColor: Colors.white,
    ),
  ),
);
