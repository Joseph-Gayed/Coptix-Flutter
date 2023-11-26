import 'package:coptix/shared/utils/localization/app_localizations.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/utils/navigation_routes.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: AppRoutes.splash,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: AppLocalizations.locales(),
      routes: getAppRoutes(context),
    );
  }
}
