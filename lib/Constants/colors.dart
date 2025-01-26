import 'package:flutter/material.dart';

import 'textstyle.dart';
Color BgColor=const Color.fromRGBO(237,	232	,245, 1);
Color textColor= const Color.fromRGBO(0, 0, 0, 1).withOpacity(.5);
Color primaryColor=const Color.fromRGBO(41, 128, 185, 1);
Color secondaryColor=const Color.fromRGBO(109, 213, 250,1);
Color highred=const Color.fromRGBO(165, 76, 70, 1);

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.amber,
    background: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white70,
    onSecondary: Colors.black12,
    onBackground: Colors.black,
    onSurface: Colors.black,
    onSecondaryFixed: Colors.grey[200]!
  ),
  textTheme:  TextTheme(
    bodyLarge: customTextStyle(color: Colors.black),
    bodyMedium: customTextStyle(color: Colors.black87),
    headlineSmall: customTextStyle(color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.blue[800]!,
    secondary: Colors.amber[700]!,
    background: Colors.black,
    surface: Colors.black26,
    onPrimary: Colors.white,
    onSecondary: Colors.white12,
    onBackground: Colors.white,
    onSurface: Colors.white,
    onSecondaryFixed: Colors.grey[800]!
  ),
  textTheme: TextTheme(
    bodyLarge: customTextStyle(color: Colors.white),
    bodyMedium: customTextStyle(color: Colors.white70),
       headlineSmall: customTextStyle(color: Colors.black),
  ),
);