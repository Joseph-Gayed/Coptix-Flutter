import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

const String appFontFamily = "AvenirArabic";

final appColorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor, background: primaryColor, surface: primaryColor);

var appTheme = ThemeData(
    // This is the theme of your application.
    colorScheme: appColorScheme,
    fontFamily: appFontFamily,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(secondaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
    textTheme: const TextTheme(labelLarge: buttonTextStyle),
    useMaterial3: true);

const TextStyle titleTextStyle = TextStyle(
    fontSize: FontSizes.h6,
    fontWeight: FontWeight.bold,
    color: lightTextColor,
    fontFamily: appFontFamily);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: FontSizes.button,
    fontFamily: appFontFamily,
    fontWeight: FontWeight.w700);

ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
  foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(Dimens.buttonsCornerRadius), // Corner radius
    ),
  ),
);
