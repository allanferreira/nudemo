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
  static final ThemeData _defaultTheme = ThemeData(
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

  static final ThemeData _darkTheme = ThemeData(
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

  static ThemeData getThemeFromKey(NuThemeKeys themeKey) {
    switch (themeKey) {
      case NuThemeKeys.DARK:
        return _darkTheme;
      case NuThemeKeys.CHISTMAS:
        return _defaultTheme; // Sorry! Not implemented yet 🤦‍♂
      case NuThemeKeys.CHISTMAS:
        return _darkTheme; // Sorry! Not implemented yet 🤦‍♂
      default:
        return _defaultTheme;
    }
  }
}
