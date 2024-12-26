import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      displaySmall: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: Colors.white54,
      ),
      //
      //  headlineLarge
      //
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.1,
        color: const Color(0xFFE1F1F2),
      ),
      headlineMedium: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      //
      //  headlineSmall
      //
      headlineSmall: GoogleFonts.openSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: const Color.fromARGB(255, 255, 255, 32),
      ),
      titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      titleSmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white54,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white54,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white38,
      ),
      labelLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      labelSmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white54,
      ),
    ),
  );
}
