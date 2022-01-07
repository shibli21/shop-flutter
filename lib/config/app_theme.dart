import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kBorderRadius = 20.0;
const kSpacing = 20.0;

const kFontColorPallets = [
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(210, 210, 210, 1),
  Color.fromRGBO(170, 170, 170, 1),
];

const kNotifColor = Color.fromRGBO(74, 177, 120, 1);

/// all custom application theme
class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColorDark: const Color.fromRGBO(111, 88, 255, 1),
        primaryColor: const Color.fromRGBO(128, 109, 255, 1),
        primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
        brightness: Brightness.dark,
        primaryColorBrightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(128, 109, 255, 1),
        ).merge(
          ButtonStyle(elevation: MaterialStateProperty.all(0)),
        )),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        canvasColor: const Color.fromRGBO(31, 29, 44, 1),
        cardColor: const Color.fromRGBO(38, 40, 55, 1),
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.

  // example :
  // static ThemeData get light => ThemeData();

  // static ThemeData get dark => ThemeData();
}