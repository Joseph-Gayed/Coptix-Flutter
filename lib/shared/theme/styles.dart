import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

const String appFontFamily = "AvenirArabic";

final appColorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor, background: primaryColor, surface: primaryColor);

ThemeData appTheme = ThemeData(
    // This is the theme of your application.
    colorScheme: appColorScheme,
    fontFamily: appFontFamily,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(secondaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: secondaryButtonStyle),
    textTheme: TextTheme(labelLarge: buttonTextStyle),
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: lightColor),
    useMaterial3: true);

TextStyle lightTextStyle = const TextStyle(
    color: lightColor,
    fontWeight: FontWeight.normal,
    fontFamily: appFontFamily);

TextStyle darkTextStyle = lightTextStyle.copyWith(color: darkColor);

TextStyle headTextStyle = lightTextStyle.copyWith(
    fontSize: FontSizes.h5, fontWeight: FontWeight.bold);

TextStyle titleTextStyle = headTextStyle.copyWith(fontSize: FontSizes.h6);

TextStyle subTitleTextStyle =
    headTextStyle.copyWith(fontSize: FontSizes.subtitle1);

TextStyle body2TextStyle = lightTextStyle.copyWith(fontSize: FontSizes.body2);
TextStyle body1TextStyle = lightTextStyle.copyWith(fontSize: FontSizes.body1);
TextStyle captionTextStyle =
    lightTextStyle.copyWith(fontSize: FontSizes.caption);

TextStyle buttonTextStyle = lightTextStyle.copyWith(
    fontSize: FontSizes.button, fontWeight: FontWeight.w700);

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

TextStyle inputTextStyle = lightTextStyle.copyWith(
    fontSize: FontSizes.subtitle1, fontWeight: FontWeight.bold);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  border: const OutlineInputBorder(),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: AuthDimens.borderWidth, color: inputBgColor),
  ),
  floatingLabelStyle: inputTextStyle,
  labelStyle: inputTextStyle.copyWith(fontWeight: FontWeight.normal),
  filled: true,
  focusColor: secondaryColor,
  fillColor: inputBgColor,
  contentPadding: EdgeInsets.symmetric(
      vertical: Dimens.halfScreenMarginV,
      horizontal: Dimens.halfScreenMarginH), // Adjust the padding here

  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: AuthDimens.borderWidth, color: secondaryColor),
  ),
);

TextStyle underlineSecondaryTextStyle = const TextStyle(
    color: secondaryColor,
    decoration: TextDecoration.underline,
    decorationColor: secondaryColor);
