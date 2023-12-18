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
    textTheme: TextTheme(labelLarge: buttonTextStyle),
    useMaterial3: true);

TextStyle headTextStyle = TextStyle(
    fontSize: FontSizes.h5,
    fontWeight: FontWeight.bold,
    color: lightColor,
    fontFamily: appFontFamily);

TextStyle titleTextStyle = TextStyle(
    fontSize: FontSizes.h6,
    fontWeight: FontWeight.bold,
    color: lightColor,
    fontFamily: appFontFamily);

TextStyle subTitleTextStyle =
    titleTextStyle.copyWith(fontSize: FontSizes.subtitle1);

TextStyle body2TextStyle = TextStyle(
    fontSize: FontSizes.body2, color: lightColor, fontFamily: appFontFamily);

TextStyle body1TextStyle = TextStyle(
    fontSize: FontSizes.body1, color: lightColor, fontFamily: appFontFamily);

TextStyle captionTextStyle = TextStyle(
    fontSize: FontSizes.caption, color: lightColor, fontFamily: appFontFamily);

TextStyle buttonTextStyle = TextStyle(
    fontSize: FontSizes.button,
    fontFamily: appFontFamily,
    fontWeight: FontWeight.w700);

ButtonStyle appButtonStyle = ButtonStyle(
  backgroundColor:
      MaterialStateProperty.all<Color>(primaryButtonBackgroundColor),
  foregroundColor: MaterialStateProperty.all<Color>(lightColor),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(
      horizontal: Dimens.buttonHorizontalPadding,
      vertical: Dimens.buttonVerticalPadding)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.cornerRadius), // Corner radius
    ),
  ),
);

ButtonStyle primaryButtonStyle = appButtonStyle.copyWith(
  backgroundColor:
      MaterialStateProperty.all<Color>(primaryButtonBackgroundColor),
  foregroundColor: MaterialStateProperty.all<Color>(lightColor),
);

ButtonStyle secondaryButtonStyle = appButtonStyle.copyWith(
  backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
  foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
);
