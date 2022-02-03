import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const warningColor = Colors.yellow;
  static const errorColor = Colors.red;

  static ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xff023e8a),
        secondary: Color(0xff008080),
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 20,
        ),
        bodyText2: TextStyle(
          fontSize: 16,
        ),
        caption: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(fontSize: 14),
      ),
    );
  }
}
