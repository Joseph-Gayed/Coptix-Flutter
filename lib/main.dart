import 'package:coptix/core/di/injection_container.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/app_configurations.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/utils/navigation/app_router.dart';
import 'package:coptix/shared/utils/navigation/keyboard_navigation_observer.dart';
import 'package:coptix/shared/utils/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/network/app_bath_provider.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
void configureOrientation(
    {bool supportLandScape = false, bool supportPortrait = true}) {
  // Set preferred orientations for the entire app
  SystemChrome.setPreferredOrientations([
    if (supportPortrait) DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    if (supportLandScape) DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  await AppPathProvider.initPath();
  runApp(DevicePreview(
      enabled: enableDevicePreview, builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setAppLanguage(BuildContext context, String newLanguage) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLanguageState(newLanguage);
  }

  static bool isRtl(BuildContext context) {
    return getAppLanguage(context) == LocalizationKey.ar;
  }

  static String getAppLanguage(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!.appLanguage;
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale(LocalizationKey.defaultLanguage);
  String appLanguage = LocalizationKey.defaultLanguage;

  @override
  void initState() {
    super.initState();
    setupAppLanguage();
  }

  void setupAppLanguage() async {
    Future<String> languageFuture = SharedPreferencesUtils.getLanguage();
    String cachedAppLanguage = await languageFuture;

    setLanguageState(cachedAppLanguage);
  }

  void setLanguageState(String newLanguage) {
    setState(() {
      appLanguage = newLanguage;
      _locale = Locale(newLanguage);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Ensure initialization before calling the orientation configuration
    WidgetsFlutterBinding.ensureInitialized();
    configureOrientation();

    var materialApp = MaterialApp(
      title: 'Coptix',
      theme: appTheme,
      navigatorKey: rootNavigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.startup,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: _locale,
      navigatorObservers: [KeyboardDismissRouteObserver()],
      supportedLocales: AppLocalizations.locales(),
      routes: AppRouter().getAppRoutes(context),
    );

    // List<SingleChildWidget> providers = [];
    // return MultiBlocProvider(providers: providers, child: materialApp);
    return materialApp;
  }

  Size getDesignSize(BuildContext context) {
    double mobileDesignWidth = 430;
    double mobileDesignHeight = 932;
    double mobileToTabletRatio = 1.9; //trial with (look & feel)
    double tabletAspectRatio = 0.75;
    if (context.isMobileScreen()) {
      //the designer dimensions for the mobile screens
      return Size(mobileDesignWidth, mobileDesignHeight);
    } else {
      // return const Size(1024, 1366);
      //tablet screen ratio (w/h) = 0.75
      return Size(mobileDesignWidth * mobileToTabletRatio,
          (mobileDesignWidth * mobileToTabletRatio) / tabletAspectRatio);
    }
  }
}
