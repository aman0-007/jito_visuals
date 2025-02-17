import 'package:flutter/material.dart';

class TripLinkTheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF00537A), // Deep Blue
    onPrimary: Colors.white,
    secondary: Color(0xFFF5A201), // Bright Orange
    onSecondary: Colors.white,
    error: Color(0xFFD32F2F), // Red for errors
    onError: Colors.white,
    surface: Color(0xFFFFFFFF), // White surface
    onSurface: Color(0xFF013C58), // Medium Blue
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF00537A), // Deep Blue
    onPrimary: Colors.white,
    secondary: Color(0xFFF5A201), // Bright Orange
    onSecondary: Colors.white,
    error: Color(0xFFD32F2F), // Red for errors
    onError: Colors.white,

    surface: Color(0xFF013C58), // Medium Blue
    onSurface: Color(0xFFF5F5F5), // Light Grey
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    textTheme: _textTheme(Brightness.light),
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightColorScheme.secondary,
      foregroundColor: lightColorScheme.onSecondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: lightColorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    textTheme: _textTheme(Brightness.dark),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.primary,
        foregroundColor: darkColorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkColorScheme.secondary,
      foregroundColor: darkColorScheme.onSecondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: darkColorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: darkColorScheme.primary, width: 2),
      ),
    ),
  );

  static TextTheme _textTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: isLight ? const Color(0xFF0B1E33) : const Color(0xFFF5F5F5),
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: isLight ? const Color(0xFF0B1E33) : const Color(0xFFF5F5F5),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: isLight ? const Color(0xFF0B1E33) : const Color(0xFFF5F5F5),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: isLight ? const Color(0xFF0B1E33) : const Color(0xFFF5F5F5),
      ),
    );
  }
}
