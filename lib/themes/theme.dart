import 'package:flutter/material.dart';

final String fontFamily = 'OpenSans';

final ThemeData defaultTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.purple,
  accentColor: Colors.white,
  backgroundColor: Colors.purple,
  scaffoldBackgroundColor: Colors.purple,

  // Define the default font family.
  fontFamily: fontFamily,

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.w900,
    ),
    title: TextStyle(
      fontSize: 36.0,
      fontStyle: FontStyle.italic,
    ),
    body1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
    ),
    body2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.purple,
  accentColor: Colors.purple,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,

  // Define the default font family.
  fontFamily: fontFamily,

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.w900,
    ),
    title: TextStyle(
      fontSize: 36.0,
      fontStyle: FontStyle.italic,
    ),
    body1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
      color: Colors.purple,
    ),
    body2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
      color: Colors.purple,
    ),
  ),
);
