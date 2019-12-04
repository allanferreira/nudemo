/// Management of themes based on the MediaQuery `platformBrightness`
/// The current brightness mode of the host platform.
///
/// For example, starting in Android Pie, battery saver mode asks all
/// apps to render in a `Dark mode`.
///
/// Or when the user set `Dark mode` in top configs menu

import 'package:flutter/material.dart';

final String fontFamily = 'OpenSans';

enum NuThemeKeys {
  DEFAULT,
  DARK,
  CHISTMAS,
  CHISTMAS_DARK,
}

class NuThemes {
  final ThemeData defaultTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.purple[600],
    primaryColorLight: Colors.purpleAccent,
    accentColor: Colors.white,
    backgroundColor: Colors.purple[600],
    scaffoldBackgroundColor: Colors.purple[600],

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
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),
      body2: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
      ),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.purple[600],
    primaryColorLight: Colors.purple[600],
    accentColor: Colors.purple[600],
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
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: Colors.purple[600],
      ),
      body2: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
        color: Colors.purple[600],
      ),
    ),
  );

  ThemeData getThemeFromKey(NuThemeKeys themeKey) {
    switch (themeKey) {
      case NuThemeKeys.DARK:
        return darkTheme;
      case NuThemeKeys.CHISTMAS:
        return defaultTheme; // Sorry! Not implemented yet 🤦‍♂
      case NuThemeKeys.CHISTMAS_DARK:
        return darkTheme; // Sorry! Not implemented yet 🤦‍♂
      default:
        return defaultTheme;
    }
  }
}
