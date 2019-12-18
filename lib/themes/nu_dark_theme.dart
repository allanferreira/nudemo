/// Management of themes based on the MediaQuery `platformBrightness`
/// The current brightness mode of the host platform.
///
/// For example, starting in Android Pie, battery saver mode asks all
/// apps to render in a `Dark mode`.
///
/// Or when the user set `Dark mode` in top configs menu

import 'package:flutter/material.dart';

final ThemeData nuDarkTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.purple[800],
  primaryColorLight: Colors.purple,
  primaryColorDark: Colors.purple[800],
  accentColor: Colors.purple[800],
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: Colors.black,

  iconTheme: IconThemeData(
    color: Colors.purple[800],
  ),

  // Define the default font family.
  fontFamily: 'OpenSans',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    display4: TextStyle(
      color: Color.fromRGBO(255, 207, 90, 0.8),
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
    display3: TextStyle(
      color: Color.fromRGBO(0, 188, 201, 0.8),
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
    display2: TextStyle(
      color: Color.fromRGBO(165, 204, 37, 0.8),
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
    display1: TextStyle(
      color: Colors.red[900],
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
    headline: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: Colors.purple[800],
    ),
    title: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: Colors.white60,
    ),
    subhead: TextStyle(
      color: Colors.purple[800],
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
    body1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: Colors.white60,
    ),
    body2: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Colors.white54,
    ),
    caption: TextStyle(
      color: Colors.white54,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle: TextStyle(
      color: Colors.purple[800],
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Colors.purple[800],
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
  ),
  primaryTextTheme: TextTheme(
    display4: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    display3: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    display2: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    display1: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    title: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subhead: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    body2: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    body1: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    caption: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle: TextStyle(
      color: Colors.purple[800],
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Colors.purple[800],
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
