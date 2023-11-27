import 'package:coptix/features/home_landing/home/presentation/collection_screen.dart';
import 'package:coptix/features/home_landing/my_profile/change_app_language/change_app_language_screen.dart';
import 'package:coptix/features/splash/splash_screen.dart';
import 'package:coptix/shared/utils/localization/app_localizations.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../features/home_landing/home_landing_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String homeLanding = "/home_landing";
  static const String changeAppLanguage = "/change_app_langauge";
  static const String collection = "/collection";
}

Map<String, WidgetBuilder> getAppRoutes(BuildContext context) {
  var missingArgumentsScreen = Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: const Center(
        child: Text("Missing Screen Arguments."),
        //TODO: fix the crash while trying to use localization ,
        // AppLocalizations.of(context).translate(LocalizationKey.badArguments)
      ));

  return {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.homeLanding: (context) => const HomeLandingScreen(),
    AppRoutes.changeAppLanguage: (context) => const ChangeAppLanguageScreen(),
    AppRoutes.collection: (context) {
      final Map<String, dynamic>? arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (arguments != null) {
        return CollectionScreen(
            collectionId: arguments[CollectionScreen.idKey],
            collectionTitle: arguments[CollectionScreen.titleKey]);
      }

      return missingArgumentsScreen;
    }
  };
}
