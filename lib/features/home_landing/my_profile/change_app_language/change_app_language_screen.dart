import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:coptix/shared/widgets/radio_list.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../shared/utils/localization/app_localizations_delegate.dart';
import '../../../../shared/utils/localization/localized_content.dart';
import '../../../../shared/utils/shared_preferences.dart';

class ChangeAppLanguageScreen extends StatefulWidget {
  const ChangeAppLanguageScreen({super.key});

  @override
  State<ChangeAppLanguageScreen> createState() =>
      _ChangeAppLanguageScreenState();
}

class _ChangeAppLanguageScreenState extends State<ChangeAppLanguageScreen> {
  String _selectedLanguage =
      LocalizationKey.defaultLanguage; // Default language
  Map<OptionTitle, OptionValue> options = {
    "English": LocalizationKey.en,
    "العربية": LocalizationKey.ar,
    "Français": LocalizationKey.fr
  };

  @override
  void initState() {
    super.initState();
    setupAppLanguage();
  }

  void setupAppLanguage() async {
    String appLanguage = await SharedPreferencesUtils.getLanguage();
    setLanguageState(appLanguage);
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translate(LocalizationKey.language)),
      ),
      body: CoptixContainer(
        child: Container(
            margin: const EdgeInsets.all(Dimens.screenMargin),
            child: screenContent()),
      ),
    );
  }

  Widget screenContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: RadioList(
              options: options,
              onSelectionValueChanged: setLanguageState,
              selectedOption: _selectedLanguage),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: Dimens.doubleScreenMargin),
          child: ElevatedButton(
            onPressed: saveAndBack,
            child: Text(
              AppLocalizations.of(context).translate(LocalizationKey.save),
              style: buttonTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  void setLanguageState(String value) {
    setState(() {
      _selectedLanguage = value;
    });
  }

  void saveAndBack() {
    SharedPreferencesUtils.saveLanguage(_selectedLanguage);
    MyApp.setAppLanguage(context, _selectedLanguage);
    Navigator.pop(context);
  }
}
