import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const light = Color(0xffcfcfcf);
  static const extraLight = Color(0xfff2f2f2);
  static const dark = Color(0xff303030);
  static const extraDark = Color(0xff2f2f2f);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: extraLight,
    appBarTheme: AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: dark,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: light,
      onPrimary: light,
      primaryVariant: light,
      secondary: Color(0xff012e8b),
    ),
    cardTheme: CardTheme(
      color: Colors.teal,
    ),
    iconTheme: IconThemeData(
      color: dark,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: light,
        fontSize: 12.0,
      ),
      subtitle2: TextStyle(
        color: dark,
        fontSize: 18.0,
      ),
      caption: TextStyle(
        color: dark,
        fontSize: 12.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: extraDark,
    appBarTheme: AppBarTheme(
      color: dark,
      iconTheme: IconThemeData(
        color: light,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: dark,
      onPrimary: dark,
      primaryVariant: dark,
      secondary: Color(0xff012e8b),
    ),
    cardTheme: CardTheme(
      color: dark,
    ),
    iconTheme: IconThemeData(
      color: light,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: dark,
        fontSize: 12.0,
      ),
      subtitle2: TextStyle(
        color: light,
        fontSize: 18.0,
      ),
      caption: TextStyle(
        color: dark,
        fontSize: 15.0,
      ),
    ),
  );
}
