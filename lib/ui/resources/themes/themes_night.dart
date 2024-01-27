import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../colors/colors_night.dart';
import 'themes.dart';

/// -------------- App Dark Theme -------------- ///
final ThemeData darkTheme = ThemeData(
  // Define the default brightness and colors.
  useMaterial3: true,
  fontFamily: fontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  primaryColor: DesignColorsDark.primaryColor,
  dividerColor: const Color(0xFF6D6A69),
  disabledColor: const Color(0XFFbfbfbf),
  scaffoldBackgroundColor: DesignColorsDark.secondaryBackgroundColor,
  colorScheme: const ColorScheme(
    primary: DesignColorsDark.primaryColor,
    secondary: DesignColorsDark.secondaryColor,
    surface: DesignColorsDark.primaryColor,
    background: Colors.black,
    error: DesignColors.errorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Color.fromRGBO(29, 29, 29, 1),
    onError: DesignColors.errorColor,
    brightness: Brightness.dark,
  ),
  textTheme: textTheme(darkMode: true),
  elevatedButtonTheme: elevatedButtonTheme(darkMode: true),
  outlinedButtonTheme: outlinedButtonTheme(darkMode: true),
  textButtonTheme: textButtonTheme(darkMode: true),
  pageTransitionsTheme: pageTransitionsTheme(darkMode: true),
);