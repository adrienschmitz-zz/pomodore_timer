import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF52F57,
      <int, Color>{
        50: Color(0xFFFEE6EB),
        100: Color(0xFFFCC1CD),
        200: Color(0xFFFA97AB),
        300: Color(0xFFF76D89),
        400: Color(0xFFF64E70),
        500: Color(0xFFF42F57),
        600: Color(0xFFF32A4F),
        700: Color(0xFFF12346),
        800: Color(0xFFEF1D3C),
        900: Color(0xFFEC122C)
      },
    ),
    primaryColor: Color(0xFFF32A4F),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0x1aF5E0C3),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xFFEC122C),
    accentColor: Color(0xFFF52F57),
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaaF5E0C3),
    //primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 150.0,
        color: Colors.white,
      ),
    ),
    dividerColor: Color(0x1f6D42CE),
    appBarTheme: _appBarLightTheme(),
    focusColor: Color(0x1aF5E0C3));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFF1E1E1E,
      <int, Color>{
        50: Color(0xFFE4E4E4),
        100: Color(0xFFBCBCBC),
        200: Color(0xFF8F8F8F),
        300: Color(0xFF626262),
        400: Color(0xFF404040),
        500: Color(0xFF1E1E1E),
        600: Color(0xFF1A1A1A),
        700: Color(0xFF161616),
        800: Color(0xFF121212),
        900: Color(0xFF0A0A0A),
      },
    ),
    primaryColor: Color(0xFF1E1E1E),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0x1a311F06),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xffE09E45),
    accentColor: Color(0xFF1E1E1E),
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xffB5BFD3),
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaa311F06),
    dividerColor: Color(0x1f6D42CE),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: 150.0,
      ),
    ),
    focusColor: Color(0x1a311F06));

AppBarTheme _appBarLightTheme() {
  return AppBarTheme(
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        // center text style
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        // Side text style
      ));
}
