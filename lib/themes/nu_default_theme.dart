/// Management of themes based on the MediaQuery `platformBrightness`
/// The current brightness mode of the host platform.
///
/// For example, starting in Android Pie, battery saver mode asks all
/// apps to render in a `Dark mode`.
///
/// Or when the user set `Dark mode` in top configs menu

import 'package:flutter/material.dart';

final ThemeData nuDefaultTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.purple[600],
  primaryColorLight: Colors.purple[300],
  primaryColorDark: Colors.purple[300],
  accentColor: Colors.white,
  backgroundColor: Colors.purple[600],
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,

  iconTheme: IconThemeData(
    color: Colors.white,
  ),

  // Define the default font family.
  fontFamily: 'OpenSans',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    title: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    body1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: Colors.black87,
    ),
    body2: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
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
