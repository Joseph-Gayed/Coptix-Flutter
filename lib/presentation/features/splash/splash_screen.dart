import 'package:coptix/core/network/api_names.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../shared/theme/styles.dart';
import '../../../shared/utils/constants.dart';
import '../../../shared/utils/localization/app_localizations_delegate.dart';
import '../../../shared/utils/localization/localized_content.dart';
import '../home_landing/home_landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashTimer();
  }

  @override
  Widget build(BuildContext context) {
    // Simulate the splash screen with your logo and text
    return Scaffold(
      body: CoptixContainer(
        child: screenContainer(),
      ),
    );
  }

  // Add a delay before navigating to the Landing Screen
  void startSplashTimer() {
    /**/
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeLandingScreen()),
      );
    });
  }

  Widget screenContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Your logo widget goes here
        // Text widget for "Welcome to coptix app" goes here

        SafeArea(
            child: ElevatedButton(
                onPressed: () {
                  ApiNames.isMocking = true;
                },
                child: Text("Mock"))),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(
              left: SplashDimens.logoMargin, right: SplashDimens.logoMargin),
          child: Image.asset("${imagesPath}logo_name.png"),
        )),
        Container(
          padding: EdgeInsets.only(bottom: SplashDimens.greetingMargin),
          child: Text(
            AppLocalizations.of(context).translate(LocalizationKey.welcome),
            style: titleTextStyle,
          ),
        ),
      ],
    );
  }
}
