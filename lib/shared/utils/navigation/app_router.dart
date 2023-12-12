import 'package:coptix/presentation/features/home_landing/home/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection_container.dart';
import '../../../presentation/features/clip_details/cubit/video_details_cubit.dart';
import '../../../presentation/features/error_screen/not_found_screen.dart';
import '../../../presentation/features/home_landing/home/screens/collection_screen.dart';
import '../../../presentation/features/home_landing/home_landing_screen.dart';
import '../../../presentation/features/home_landing/my_profile/change_app_language/change_app_language_screen.dart';
import '../../../presentation/features/clip_details/video_details_screen.dart';
import '../../../presentation/features/season_details/season_details_screen.dart';
import '../../../presentation/features/series_details/cubit/series_details_cubit.dart';
import '../../../presentation/features/series_details/series_details_screen.dart';
import '../../../presentation/features/splash/splash_screen.dart';
import '../../../presentation/features/video_player/video_player_screen.dart';

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
  static const String videoPlayer = "/video_player";
  static const String category = "/category";

  Map<String, WidgetBuilder> getAppRoutes(BuildContext context) {
    return {
      notFound: (context) => const NotFoundScreen(),
      splash: (context) => const SplashScreen(),
      homeLanding: (context) => const HomeLandingScreen(),
      changeAppLanguage: (context) => const ChangeAppLanguageScreen(),
      collection: (context) => _getCollectionDetailsScreen(context),
      season: (context) => _getSeasonDetailsScreen(context),
      series: (context) => _getSeriesDetailsScreen(context),
      show: (context) => _getSeriesDetailsScreen(context),
      clip: (context) => _getVideoDetailsScreen(context),
      movie: (context) => _getVideoDetailsScreen(context),
      episode: (context) => _getVideoDetailsScreen(context),
      play: (context) => _getVideoDetailsScreen(context),
      videoPlayer: (context) => _getVideoPlayerScreen(context),
      category: (context) => _getCategoryScreen(context),
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
    return SeasonDetailsScreen(arguments: arguments);
  }

  Widget _getSeriesDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return BlocProvider<SeriesDetailsCubit>(
      create: (context) => getIt(),
      child: SeriesDetailsScreen(
        arguments: arguments,
      ),
    );
  }

  Widget _getVideoDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return BlocProvider<VideoDetailsCubit>(
      create: (context) => getIt(),
      child: VideoDetailsScreen(arguments: arguments),
    );
  }

  Widget _getVideoPlayerScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return VideoPlayerScreen(arguments: arguments);
  }

  Widget _getCategoryScreen(BuildContext context) {
    Map<String, dynamic>? arguments = _getNavArgs(context);
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return CategoryScreen(arguments: arguments);
  }
}
