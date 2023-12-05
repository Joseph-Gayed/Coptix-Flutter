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
    elevatedButtonTheme: ElevatedButtonThemeData(style: secondaryButtonStyle),
    textTheme: const TextTheme(labelLarge: buttonTextStyle),
    useMaterial3: true);

const TextStyle headTextStyle = TextStyle(
    fontSize: FontSizes.h5,
    fontWeight: FontWeight.bold,
    color: lightTextColor,
    fontFamily: appFontFamily);

const TextStyle titleTextStyle = TextStyle(
    fontSize: FontSizes.h6,
    fontWeight: FontWeight.bold,
    color: lightTextColor,
    fontFamily: appFontFamily);

const TextStyle body2TextStyle = TextStyle(
    fontSize: FontSizes.body2,
    color: lightTextColor,
    fontFamily: appFontFamily);

const TextStyle captionTextStyle = TextStyle(
    fontSize: FontSizes.caption,
    color: lightTextColor,
    fontFamily: appFontFamily);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: FontSizes.button,
    fontFamily: appFontFamily,
    fontWeight: FontWeight.w700);

ButtonStyle primaryButtonStyle = ButtonStyle(
  backgroundColor:
      MaterialStateProperty.all<Color>(primaryButtonBackgroundColor),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(Dimens.buttonsCornerRadius), // Corner radius
    ),
  ),
);

ButtonStyle secondaryButtonStyle = primaryButtonStyle.copyWith(
  backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
  foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
);
