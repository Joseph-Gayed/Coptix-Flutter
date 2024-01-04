import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:coptix/shared/widgets/radio_list.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../../shared/utils/localization/app_localizations_delegate.dart';
import '../../../../../shared/utils/localization/localized_content.dart';
import '../../../../../shared/utils/shared_preferences.dart';
import '../../../../../shared/widgets/coptix_app_bar.dart';
import '../../home_landing_screen.dart';

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
      appBar: CoptixAppBar(
        title: LocalizationKey.language.tr(),
        showingBackButton: true,
      ),
      body: CoptixContainer(
        child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimens.screenMarginH,
                vertical: Dimens.screenMarginV),
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
          margin: EdgeInsets.only(bottom: Dimens.doubleScreenMarginH),
          child: ElevatedButton(
            style: secondaryButtonStyle,
            onPressed: saveAndBack,
            child: Text(
              LocalizationKey.save.tr(),
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
    context.restartHomeOnTabIndex(
        tabIndex: HomeLandingScreen.indexOfProfileTab);
  }
}
