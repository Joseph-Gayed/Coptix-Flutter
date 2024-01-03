import 'package:coptix/presentation/features/auth/forget_password/forget_password_screen.dart';
import 'package:coptix/presentation/features/auth/login/login_screen.dart';
import 'package:coptix/presentation/features/categories/screens/category_collections_screen.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection_container.dart';
import '../../../presentation/features/auth/common/cubit/auth_cubit.dart';
import '../../../presentation/features/auth/signup/signup_screen.dart';
import '../../../presentation/features/categories/screens/category_contents_screen.dart';
import '../../../presentation/features/clip_details/video_details_screen.dart';
import '../../../presentation/features/error_screen/not_found_screen.dart';
import '../../../presentation/features/home_landing/home/screens/collection_screen.dart';
import '../../../presentation/features/home_landing/home_landing_screen.dart';
import '../../../presentation/features/home_landing/my_profile/change_app_language/change_app_language_screen.dart';
import '../../../presentation/features/season_details/season_details_screen.dart';
import '../../../presentation/features/series_details/series_details_screen.dart';
import '../../../presentation/features/splash/splash_screen.dart';
import '../../../presentation/features/video_player/video_player_screen.dart';

class AppRouter {
  AppRouter._privateConstructor();
  static final AppRouter _instance = AppRouter._privateConstructor();
  static AppRouter get instance => _instance;

  factory AppRouter() {
    return _instance;
  }
  static String startup = splash;
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
  static const String categoryCollections = "/categoryCollections";
  static const String categoryContents = "/categoryContents";

  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgetPassword = "/forgetPassword";
  static const String notFound = "/notFound";
  static const String bookmarks = "/bookmarks";
  static const String accountDetails = "/accountDetails";
  static const String changePassword = "/changePassword";
  static const String appSettings = "/appSettings";
  static const String help = "/help";
  static const String contactUs = "/contactUs";
  static const String logout = "/logout";

  Map<String, WidgetBuilder> getAppRoutes(BuildContext context) {
    return {
      splash: (context) => const SplashScreen(),
      homeLanding: (context) => _getHomeLandingScreen(context),
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
      categoryCollections: (context) => _getCategoryCollectionsScreen(context),
      categoryContents: (context) => _getCategoryContentsScreen(context),
      login: (context) => getAuthScreen(context, const LoginScreen()),
      signup: (context) => getAuthScreen(context, const SignupScreen()),
      forgetPassword: (context) =>
          getAuthScreen(context, const ForgetPasswordScreen()),
      notFound: (context) => getAuthScreen(context, const NotFoundScreen()),
    };
  }

  Widget _getHomeLandingScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    return HomeLandingScreen(arguments: arguments);
  }

  Widget _getCollectionDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return CollectionScreen(arguments: arguments);
  }

  Widget _getSeasonDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return SeasonDetailsScreen(arguments: arguments);
  }

  Widget _getSeriesDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return SeriesDetailsScreen.withCubit(arguments: arguments);
  }

  Widget _getVideoDetailsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return VideoDetailsScreen.withCubit(arguments: arguments);
  }

  Widget _getVideoPlayerScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return VideoPlayerScreen(arguments: arguments);
  }

  Widget _getCategoryCollectionsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    if (arguments == null) {
      return const NotFoundScreen();
    }

    return CategoryCollectionsScreen.withCubit(arguments: arguments);
  }

  Widget _getCategoryContentsScreen(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    if (arguments == null) {
      return const NotFoundScreen();
    }
    return CategoryContentsScreen.withCubit(arguments: arguments);
  }

  Widget getAuthScreen(BuildContext context, Widget screen) {
    return BlocProvider<AuthCubit>(
      create: (context) => getIt(),
      child: screen,
    );
  }
}
