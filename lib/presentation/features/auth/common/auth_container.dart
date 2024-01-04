import 'package:coptix/presentation/features/auth/common/cubit/auth_cubit.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/extensions/widget_ext.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/utils/constants.dart';
import 'package:coptix/shared/utils/navigation/navigation_args.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/theme/dimens.dart';
import '../../home_landing/home_landing_screen.dart';

class AuthContainer extends StatelessWidget {
  final Widget screenContent;
  final String? appBarTitle;

  final Function(AuthState)? handleSuccessState;

  const AuthContainer(
      {super.key,
      required this.screenContent,
      this.appBarTitle,
      this.handleSuccessState});

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
      body: SafeArea(child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return handleFixedStates(state, isAppBarVisible, context);
        },
      )),
    );
  }

  Widget handleFixedStates(
      AuthState state, bool isAppBarVisible, BuildContext context) {
    if (state is AuthLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      );
    } else {
      if (state is AuthErrorState) {
        context.showToast(message: state.message);
      } else if (isSuccessState(state)) {
        //must add this before navigation to avoid crash "setState() or markNeedsBuild() called during build".
        Future.microtask(() {
          if (handleSuccessState != null) {
            handleSuccessState!(state);
          } else {
            context.restartHomeOnTabIndex(
                tabIndex: HomeLandingScreen.indexOfProfileTab);
          }
        });
      }
      return screenContentContainerWithGradientLayer(isAppBarVisible, context);
    }
  }

  bool isSuccessState(AuthState state) => state is! AuthInitialState;

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
              ? Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimens.screenMarginH,
                      vertical: Dimens.screenMarginV),
                  child: screenContentMobile())
              : screenContentMobile().wrapForTablet(),
        ),
      ],
    );
  }

  Widget screenContentMobile() {
    return SingleChildScrollView(
      child: Container(alignment: Alignment.center, child: screenContent),
    );
  }

  String getBackgroundImagePath(BuildContext context) {
    String imageName =
        context.isMobileScreen() ? "auth_bg_mobile.png" : "auth_bg_tablet.png";
    return "$imagesPath$imageName";
  }
}
