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

class AppRouter {
  AppRouter._privateConstructor();
  static final AppRouter _instance = AppRouter._privateConstructor();

  factory AppRouter() {
    return _instance;
  }

  static const String notFound = "/notFound";
  static const String splash = "/splash";
  static const String homeLanding = "/home_landing";
  static const String changeAppLanguage = "/change_app_language";
  static const String collection = "/collection";
  static const String season = "/season";
  static const String series = "/series";
  static const String show = "/show";
  static const String episode = "/episode";
  static const String clip = "/clip";
  static const String movie = "/movie";
  static const String play = "/play";

  Map<String, WidgetBuilder> getAppRoutes(BuildContext context) {
    return {
      notFound: (context) => const NotFoundScreen(),
      splash: (context) => const SplashScreen(),
      homeLanding: (context) => const HomeLandingScreen(),
      changeAppLanguage: (context) => const ChangeAppLanguageScreen(),
      collection: (context) => _getCollectionDetailsScreen(context),
      season: (context) => _getSeasonDetailsScreen(context),
      series: (context) => _getSeriesDetailsScreen(context),
      clip: (context) => _getVideoDetailsScreen(context),
      movie: (context) => _getVideoDetailsScreen(context),
      episode: (context) => _getVideoDetailsScreen(context),
    };
  }

  Map<String, dynamic>? _getNavArgs(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return arguments;
  }

  Widget _getCollectionDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return CollectionScreen(arguments: arguments);
  }

  Widget _getSeasonDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return SeasonDetailsScreen(
        seasonId: arguments[NavArgsKeys.idKey],
        seasonTitle: arguments[NavArgsKeys.titleKey]);
  }

  Widget _getSeriesDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return SeriesDetailsScreen(
        seriesId: arguments[NavArgsKeys.idKey],
        seriesTitle: arguments[NavArgsKeys.titleKey]);
  }

  Widget _getVideoDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return VideoDetailsScreen(
        videoId: arguments[NavArgsKeys.idKey],
        videoTitle: arguments[NavArgsKeys.titleKey]);
  }
}
