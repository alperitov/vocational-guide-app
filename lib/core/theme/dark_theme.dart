import 'package:flutter/material.dart';

const _primary = Color(0xff7B6FF7);
const _secondary = Color(0xffFFA95C);
const _accent = Color(0xff8AE04A);
const _headerGradientStart = Color(0xff3B2FC9);
const _headerGradientEnd = Color(0xff1A1560);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: _primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: _primary,
        secondary: _secondary,
        tertiary: _accent,
        surface: const Color(0xff141414),
        surfaceContainerHighest: const Color(0xff1E1E2E),
        onSurface: const Color(0xffFCFCFC),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
      ),

  // Tipografia
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.5),
    headlineMedium: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.5),
    headlineSmall: TextStyle(fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontWeight: FontWeight.w600),
    labelLarge: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.2),
  ),

  // AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1A1560),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Botões preenchidos
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: _accent,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  ),

  // Botões elevados
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),

  // Botões outlined
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: _primary,
      side: const BorderSide(color: _primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),

  // Cards
  cardTheme: CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: const Color(0xff1E1E2E),
    surfaceTintColor: Colors.transparent,
  ),

  // Inputs
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xff1E1E2E),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: _primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),

  // Chips
  chipTheme: ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    selectedColor: _primary,
    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
  ),

  // Bottom Navigation
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: const Color(0xff1E1E2E),
    indicatorColor: _accent.withValues(alpha: 0.15),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: _accent);
      }
      return const IconThemeData(color: Color(0xff666666));
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const TextStyle(
          color: _accent,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        );
      }
      return const TextStyle(color: Color(0xff666666), fontSize: 12);
    }),
    elevation: 8,
  ),
);

// Exporta as cores para uso nos gradientes
const darkGradientHeader = LinearGradient(
  colors: [_headerGradientStart, _headerGradientEnd],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const accentColorDark = _accent;
const primaryColorDark = _primary;
