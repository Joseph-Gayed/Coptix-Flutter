import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/utils/constants.dart';
import 'package:coptix/shared/utils/navigation/navigation_args.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/dimens.dart';

class AuthContainer extends StatelessWidget {
  final Widget screenContent;
  final String? appBarTitle;
  const AuthContainer(
      {super.key, required this.screenContent, this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments = context.getNavArgs();
    String? appBarTitle = arguments?[NavArgsKeys.appBarTitle];
    CoptixAppBar? coptixAppBar = appBarTitle != null
        ? CoptixAppBar(
            title: appBarTitle,
          )
        : null;
    bool isAppBarVisible = appBarTitle != null;

    return Scaffold(
      appBar: coptixAppBar,
      body: SafeArea(
        child:
            screenContentContainerWithGradientLayer(isAppBarVisible, context),
      ),
    );
  }

  Stack screenContentContainerWithGradientLayer(
      bool isAppBarVisible, BuildContext context) {
    return Stack(
      children: [
        //background image
        Positioned.fill(
          top: 0,
          bottom: isAppBarVisible ? 0 : Dimens.appBarHeight,
          child: Image.asset(
            getBackgroundImagePath(context),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        //Gradient layer
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              gradientPrimaryColor,
            ],
          )),
        ),

        //input form
        Center(
          child: context.isMobileScreen()
              ? screenContentMobile()
              : screenContentTablet(),
        ),
      ],
    );
  }

  Widget screenContentContainerWithOutGradientLayer(
      bool isAppBarVisible, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getBackgroundImagePath(context)),
          fit: BoxFit.cover,
        ),
      ),

      //input form
      child: Center(
        child: context.isMobileScreen()
            ? screenContentMobile()
            : screenContentTablet(),
      ),
    );
  }

  Widget screenContentMobile() {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.screenMarginH,
              vertical: Dimens.doubleScreenMarginV),
          alignment: Alignment.center,
          child: screenContent),
    );
  }

  Widget screenContentTablet() {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(flex: 3, child: screenContentMobile()),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
      ],
    );
  }

  String getBackgroundImagePath(BuildContext context) {
    String imageName =
        context.isMobileScreen() ? "auth_bg_mobile.png" : "auth_bg_tablet.png";
    return "$imagesPath$imageName";
  }
}
