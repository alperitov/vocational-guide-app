import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: const Color(0xff6155F5),
        brightness: Brightness.dark,
      ).copyWith(
        primary: const Color(0xff6155F5),
        secondary: const Color(0xffFFA95C),
        surface: const Color(0xff141414),
        onSurface: const Color(0xffFCFCFC),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ),
);
