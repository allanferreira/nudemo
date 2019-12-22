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
  primaryColor: Color.fromRGBO(129, 37, 157, 1.0), // #81259D (purple)
  primaryColorLight:
      Color.fromRGBO(159, 67, 187, 1.0), // #9F43BB (purple light)
  primaryColorDark:
      Color.fromRGBO(91, 23, 133, 1.0), // #81259D (purple dark) <-not used!
  accentColor: Colors.white,
  backgroundColor: Color.fromRGBO(129, 37, 157, 1.0), // #81259D (purple)
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  splashColor: Color.fromRGBO(250, 250, 250, 1.0), // #FAFAFA (grey light)

  iconTheme: IconThemeData(
    color: Colors.white,
  ),

  // Define the default font family.
  fontFamily: 'OpenSans',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    display4: TextStyle(
      color: Color.fromRGBO(255, 207, 90, 1.0), // #FFCF5A (orange)
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
    display3: TextStyle(
      color: Color.fromRGBO(0, 188, 201, 1.0), // #00BCC9 (blue)
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
    display2: TextStyle(
      color: Color.fromRGBO(238, 119, 108, 1.0), // #EE776C (red)
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
    display1: TextStyle(
      color: Color.fromRGBO(165, 204, 37, 1.0), // #A5CC25 (green)
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    ),
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
    subhead: TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
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
    caption: TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    subtitle: TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Colors.black87,
      fontSize: 14,
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
        color: Color.fromRGBO(159, 67, 187, 1.0), // #9F43BB (purple light)
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.5)),
    ),
    alignedDropdown: false,
    buttonColor: Color.fromRGBO(129, 37, 157, 1.0), // #81259D (purple)
    disabledColor: Color.fromRGBO(129, 37, 157, 1.0), // #81259D (purple)
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
