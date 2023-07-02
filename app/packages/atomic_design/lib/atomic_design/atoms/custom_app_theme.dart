import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppTheme {
  const CustomAppTheme();
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      textTheme: _textTheme,
    );
  }
}

TextTheme get _textTheme {
  return GoogleFonts.poppinsTextTheme().copyWith(
    displayLarge: GoogleFonts.abrilFatface(),
    displayMedium: GoogleFonts.abrilFatface(),
    displaySmall: GoogleFonts.abrilFatface(),
    headlineLarge: GoogleFonts.abrilFatface(),
    headlineMedium: GoogleFonts.abrilFatface(),
    headlineSmall: GoogleFonts.abrilFatface(),
  );
}
