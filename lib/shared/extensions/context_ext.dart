import 'dart:io';

import 'package:coptix/shared/extensions/media_query_ext.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../presentation/features/home_landing/home_landing_screen.dart';
import '../theme/dimens.dart';
import '../utils/navigation/app_router.dart';
import '../utils/navigation/navigation_args.dart';

extension ContextExt on BuildContext {
  bool isMobileScreen() {
    return MediaQuery.of(this).isMobileScreen();
  }

  int halfScreenWidth() {
    return MediaQuery.of(this).halfScreenWidth();
  }

  int halfScreenHeight() {
    return MediaQuery.of(this).halfScreenHeight();
  }

  Map<String, dynamic>? getNavArgs() {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(this)?.settings.arguments as Map<String, dynamic>?;
    return arguments;
  }

  //TODO: check how to change font family to match app font family
  void showToast(
      {required String message, Color backgroundColor = secondaryColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: backgroundColor,
        textColor: darkColor,
        fontSize: FontSizes.subtitle1);
  }

  void restartHomeOnTabIndex(
      {int tabIndex = HomeLandingScreen.indexOfHomeTab}) {
    Navigator.pushNamedAndRemoveUntil(
        this, AppRouter.homeLanding, (route) => false,
        arguments: {NavArgsKeys.indexOfSelectedTab: tabIndex});
  }

  Future<void> exitApp() async {
    SystemNavigator.pop(); // Close the current app

    // You might want to add a delay before restarting to ensure the app is closed properly
    Future.delayed(const Duration(seconds: 1), () {
      exit(
          0); // Restart the app (This will completely close and restart the app)
    });
  }

  void dismissKeyboard() {
    FocusScope.of(this).unfocus();
  }
}
