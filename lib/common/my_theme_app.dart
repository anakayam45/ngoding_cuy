import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor:
            WidgetStateProperty.all(const Color.fromARGB(255, 218, 202, 26)),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        shape: WidgetStateProperty.all(const StadiumBorder()),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1DCFF8),
      secondary: Color(0xFFF3D3D1),
    ),
    scaffoldBackgroundColor: const Color(0xFFF3D3D1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF008080),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.openSans(
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.roboto(),
    ),
  );
}
