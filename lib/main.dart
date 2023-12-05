import 'package:coptix/core/di/injection_container.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/utils/navigation/app_router.dart';
import 'package:coptix/shared/utils/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  initDi();
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
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
    return MaterialApp(
      title: 'Coptix',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.splash,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: AppLocalizations.locales(),
      routes: AppRouter().getAppRoutes(context),
    );
  }
}
