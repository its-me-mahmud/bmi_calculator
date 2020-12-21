import 'package:flutter/material.dart';

class Styles {
  const Styles._();

  static const primaryColor = Color(0xFF0A0E21);
  static const secondaryColor = Color(0xFF111428);
  static const activeColor = Color(0xFF1D1E33);
  static const inactiveColor = Color(0xFF111328);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFF8D8E98);
  static const buttonColor = Color(0xFFEB1555);
  static const green = Color(0xFF24D876);
  static const amber = Color(0xFFFFC958);
  static const red = Color(0xFFD92027);

  static final primaryTheme = ThemeData(
    fontFamily: 'Oxygen',
    brightness: Brightness.light,
    primaryColor: Styles.primaryColor,
    scaffoldBackgroundColor: Styles.primaryColor,
    splashColor: buttonColor,
    hoverColor: secondaryColor,
    focusColor: secondaryColor,
    canvasColor: primaryColor,
    highlightColor: secondaryColor,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      activeTrackColor: white,
      inactiveTrackColor: grey,
      thumbColor: buttonColor,
      overlayColor: buttonColor.withOpacity(0.2),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 26),
    ),
    textTheme: primaryTextTheme,
  );

  static const primaryTextTheme = TextTheme(
    headline1: _number,
    headline5: _result,
    headline6: _label,
    bodyText1: _title,
    button: _buttonTitle,
  );

  static const _label = TextStyle(
    color: grey,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const _number = TextStyle(
    letterSpacing: 5,
    fontSize: 50,
    color: white,
    fontWeight: FontWeight.w900,
  );

  static const _title = TextStyle(
    fontSize: 30,
    color: white,
    fontWeight: FontWeight.w900,
  );

  static const _result = TextStyle(
    letterSpacing: 2,
    fontSize: 70,
    color: white,
    fontWeight: FontWeight.w900,
  );

  static const _buttonTitle = TextStyle(
    letterSpacing: 2,
    color: white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
