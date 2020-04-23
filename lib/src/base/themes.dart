import 'package:flutter/material.dart';

/// This class contains all app themes.
/// All app/text specific colors should be defined here.
/// Text src.widgets should get the themes from this class.
class AppThemes {
  static const Color scaffoldBackgroundColor = const Color(0xff091D32);
  static const Color accentColor = const Color(0xffED5E58);

  // App default theme
  static get appTheme {
    return ThemeData(
      backgroundColor: scaffoldBackgroundColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(color: Colors.transparent //_appBarColor
          ),
      textSelectionColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      primaryColor: scaffoldBackgroundColor,
      indicatorColor: accentColor,
      primaryColorBrightness: Brightness.dark,
      accentColor: Color(0xffED5E58),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: scaffoldBackgroundColor,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.all(15.0),
        isDense: true,
        errorStyle: TextStyle(
          color: accentColor,
        ),
        hintStyle: TextStyle(
          color: accentColor,
          fontSize: 14
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: accentColor,
              width: 2.0,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: accentColor,
            )),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: accentColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      primaryTextTheme: TextTheme(
        button: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 17,
        ),
        subhead: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 16,
        ),
        caption: TextStyle(
          fontWeight: FontWeight.bold,
          color: accentColor,
          fontSize: 14,
        ),
      )
    );
  }
}
