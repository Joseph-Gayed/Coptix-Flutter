import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import 'localized_content.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static List<String> languages() => localizedContent.keys.toList();
  static List<Locale> locales() {
    return languages().map((language) => Locale(language)).toList();
  }

  String translate(String key) {
    String languageCode = locale.languageCode;
    var translation = localizedContent[languageCode]?[key] ?? "";
    return translation;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.languages().contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension TranslateX on String {
  String tr() {
    var context = rootNavigatorKey.currentContext;
    return AppLocalizations.of(context!).translate(this);
  }
}
