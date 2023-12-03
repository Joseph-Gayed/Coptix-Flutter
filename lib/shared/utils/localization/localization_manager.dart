


/*
class LocalizationManager extends ChangeNotifier {
  Locale _locale = const Locale(LocalizationKey.defaultLanguage);
  Locale get locale => _locale;

  String get appLanguage => _locale.languageCode;

  LocalizationManager._privateConstructor();

  static final LocalizationManager _instance =
      LocalizationManager._privateConstructor();

  static LocalizationManager get instance => _instance;
  factory LocalizationManager() {
    return _instance;
  }
  Future<void> setupAppLanguage() async {
    final cachedAppLanguage = await SharedPreferencesUtils.getLanguage();
    setLanguage(cachedAppLanguage);
  }

  void setLanguage(String newLanguage) {
    _locale = Locale(newLanguage);
    // Save language to SharedPreferences or wherever you are persisting it
    SharedPreferencesUtils.saveLanguage(newLanguage);
    notifyListeners(); // Notify listeners about the language change
  }

  bool isRtl() {
    return _locale.languageCode == LocalizationKey.ar;
  }
}
*/
