import 'package:coptix/features/error_screen/not_found_screen.dart';
import 'package:coptix/features/home_landing/home/presentation/collection_screen.dart';
import 'package:coptix/features/home_landing/my_profile/change_app_language/change_app_language_screen.dart';
import 'package:coptix/features/splash/splash_screen.dart';
import 'package:coptix/features/video_player/video_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/home_landing/home_landing_screen.dart';
import '../../../features/season_details/season_details_screen.dart';
import '../../../features/series_details/series_details_screen.dart';
import 'navigation_args.dart';

class AppRoutes {
  static const String notFound = "/notFound";
  static const String splash = "/splash";
  static const String homeLanding = "/home_landing";
  static const String changeAppLanguage = "/change_app_langauge";
  static const String collection = "/collection";
  static const String season = "/season";
  static const String series = "/series";
  static const String show = "/show";
  static const String episode = "/episode";
  static const String clip = "/clip";
  static const String movie = "/movie";
  static const String play = "/play";
}

Map<String, WidgetBuilder> getAppRoutes(BuildContext context) {
  return {
    AppRoutes.notFound: (context) => const NotFoundScreen(),
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.homeLanding: (context) => const HomeLandingScreen(),
    AppRoutes.changeAppLanguage: (context) => const ChangeAppLanguageScreen(),
    AppRoutes.collection: (context) => getCollectionDetailsScreen(context),
    AppRoutes.season: (context) => getSeasonDetailsScreen(context),
    AppRoutes.series: (context) => getSeriesDetailsScreen(context),
    AppRoutes.clip: (context) => getVideoDetailsScreen(context),
    AppRoutes.movie: (context) => getVideoDetailsScreen(context),
    AppRoutes.episode: (context) => getVideoDetailsScreen(context),
  };
}

Map<String, dynamic>? getNavArgs(BuildContext context) {
  final Map<String, dynamic>? arguments =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  return arguments;
}

Widget getCollectionDetailsScreen(BuildContext context) {
  Map<String, dynamic>? arguments = getNavArgs(context);
  if (arguments == null) {
    return const NotFoundScreen();
  }
  return CollectionScreen(
      collectionId: arguments[NavArgsKeys.idKey],
      collectionTitle: arguments[NavArgsKeys.titleKey]);
}

Widget getSeasonDetailsScreen(BuildContext context) {
  Map<String, dynamic>? arguments = getNavArgs(context);
  if (arguments == null) {
    return const NotFoundScreen();
  }
  return SeasonDetailsScreen(
      seasonId: arguments[NavArgsKeys.idKey],
      seasonTitle: arguments[NavArgsKeys.titleKey]);
}

Widget getSeriesDetailsScreen(BuildContext context) {
  Map<String, dynamic>? arguments = getNavArgs(context);
  if (arguments == null) {
    return const NotFoundScreen();
  }
  return SeriesDetailsScreen(
      seriesId: arguments[NavArgsKeys.idKey],
      seriesTitle: arguments[NavArgsKeys.titleKey]);
}

Widget getVideoDetailsScreen(BuildContext context) {
  Map<String, dynamic>? arguments = getNavArgs(context);
  if (arguments == null) {
    return const NotFoundScreen();
  }
  return VideoDetailsScreen(
      videoId: arguments[NavArgsKeys.idKey],
      videoTitle: arguments[NavArgsKeys.titleKey]);
}
