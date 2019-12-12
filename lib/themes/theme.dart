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
    primaryColorLight: Colors.purple[300],
    accentColor: Colors.white,
    backgroundColor: Colors.purple[600],
    scaffoldBackgroundColor: Colors.purple[600],

    iconTheme: IconThemeData(
      color: Colors.white,
    ),

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
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
      ),
    ),

    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88,
      height: 36,
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.purple[300],
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      alignedDropdown: false,
      buttonColor: Colors.purple[600],
      disabledColor: Colors.purple[600],
      highlightColor: Colors.white,
      splashColor: Colors.white30,
      focusColor: Colors.white30,
      hoverColor: Colors.white60,
      colorScheme: ColorScheme(
        primary: Color(0xff9c27b0),
        primaryVariant: Color(0xff7b1fa2),
        secondary: Color(0xff9c27b0),
        secondaryVariant: Color(0xff7b1fa2),
        surface: Color(0xffffffff),
        background: Color(0xffce93d8),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xffffffff),
        onSecondary: Color(0xffffffff),
        onSurface: Color(0xff000000),
        onBackground: Color(0xffffffff),
        onError: Color(0xffffffff),
        brightness: Brightness.light,
      ),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.purple[600],
    primaryColorLight: Colors.purple[800],
    accentColor: Colors.purple[600],
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,

    iconTheme: IconThemeData(
      color: Colors.purple[600],
    ),

    // Define the default font family.
    fontFamily: fontFamily,

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      display4: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      display3: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      display2: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      display1: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.w900,
        color: Colors.purple[600],
      ),
      title: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
        color: Colors.purple[600],
      ),
      subhead: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      body1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: Colors.purple[600],
      ),
      body2: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: Colors.purple[600],
      ),
      caption: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    primaryTextTheme: TextTheme(
      display4: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      display3: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      display2: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      display1: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      title: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subhead: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      body2: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      body1: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Colors.purple[600],
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),

    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88,
      height: 36,
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.purple[800],
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      alignedDropdown: false,
      buttonColor: Colors.black,
      disabledColor: Colors.black,
      highlightColor: Colors.white,
      splashColor: Colors.white30,
      focusColor: Colors.white30,
      hoverColor: Colors.white60,
      colorScheme: ColorScheme(
        primary: Color(0xff9c27b0),
        primaryVariant: Color(0xff7b1fa2),
        secondary: Color(0xff9c27b0),
        secondaryVariant: Color(0xff7b1fa2),
        surface: Color(0xffffffff),
        background: Color(0xffce93d8),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xffffffff),
        onSecondary: Color(0xffffffff),
        onSurface: Color(0xff000000),
        onBackground: Color(0xffffffff),
        onError: Color(0xffffffff),
        brightness: Brightness.light,
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
