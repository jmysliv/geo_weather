import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

const oxfordBlue = Color(0xFF102542);
const bittersweet = Color(0xFFF87060);
const lightGrey = Color(0xFFCDD7D6);
const grullo = Color(0xFFB3A394);

final colorScheme = ColorScheme(
    primary: bittersweet,
    primaryVariant: TinyColor(bittersweet).darken(10).color,
    secondary: oxfordBlue,
    secondaryVariant: TinyColor(oxfordBlue).darken(10).color,
    surface: lightGrey,
    background: grullo,
    error: Colors.red,
    onPrimary: oxfordBlue,
    onSecondary: lightGrey,
    onSurface: lightGrey,
    onBackground: lightGrey,
    onError: Colors.white,
    brightness: Brightness.dark);

final textTheme = TextTheme(
  headline1:
      TextStyle(color: Colors.white, fontSize: 96, fontWeight: FontWeight.w300),
  headline2:
      TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w300),
  headline3:
      TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w400),
  headline4:
      TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w400),
  headline5:
      TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
  headline6:
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
  subtitle1:
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
  subtitle2:
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
  bodyText1:
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
  bodyText2:
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
  button:
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
  caption:
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
  overline:
      TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
);

final buttonTheme = ButtonTheme(textTheme: ButtonTextTheme.normal);

final themeData = ThemeData(
    textTheme: textTheme,
    colorScheme: colorScheme,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.standard,
    primaryColor: oxfordBlue,
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: oxfordBlue,
    primaryColorDark: oxfordBlue,
    canvasColor: lightGrey,
    accentColor: bittersweet,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: grullo,
    bottomAppBarColor: lightGrey,
    cardColor: grullo,
    dividerColor: Colors.black,
    focusColor: lightGrey,
    hoverColor: lightGrey,
    highlightColor: grullo,
    splashColor: TinyColor(bittersweet).lighten().color,
    selectedRowColor: grullo,
    disabledColor: TinyColor(lightGrey).darken().color,
    unselectedWidgetColor: grullo.withOpacity(0.7),
    buttonColor: oxfordBlue,
    textSelectionColor: lightGrey.withOpacity(0.5),
    backgroundColor: bittersweet,
    dialogBackgroundColor: bittersweet,
    textSelectionHandleColor: oxfordBlue,
    hintColor: TinyColor(lightGrey).darken(30).color,
    errorColor: Colors.red,
    toggleableActiveColor: lightGrey);
