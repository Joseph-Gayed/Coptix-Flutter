import 'package:coptix/features/home_landing/my_profile/change_app_language/change_app_language_screen.dart';
import 'package:coptix/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home_landing/home_landing_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String homeLanding = "/home_landing";
  static const String changeAppLanguage = "/change_app_langauge";
}

Map<String, WidgetBuilder> getAppRoutes(BuildContext context) {
  return {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.homeLanding: (context) => const HomeLandingScreen(),
    AppRoutes.changeAppLanguage: (context) => const ChangeAppLanguageScreen(),

    /*"/results": (context) {
      final String? output =
      ModalRoute.of(context)?.settings.arguments as String?;
      if (output == null) {
        // Redirect to another route if arguments are null
        return Scaffold(
          appBar: AppBar(title: const Text("Error")),
          body: const Center(
            child: Text('Invalid or missing data'),
          ),
        );
      }
      return ResultsPage(bmiOutputs: output);
    }*/
  };
}
