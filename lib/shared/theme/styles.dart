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
  useMaterial3: true,
);

const TextStyle titleTextStyle = TextStyle(
  fontSize: FontSizes.h6,
  fontWeight: FontWeight.bold,
  color: lightTextColor,
);
