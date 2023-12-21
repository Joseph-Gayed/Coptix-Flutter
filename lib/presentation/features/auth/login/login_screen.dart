import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/utils/navigation/navigation_args.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/styles.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/widgets/coptix_text_form_field.dart';
import '../auth_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool shouldShowAppBar;

  final TextEditingController emailOrMobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    shouldShowAppBar =
        context.getNavArgs()?.containsKey(NavArgsKeys.appBarTitle) ?? false;

    return AuthContainer(
        screenContent: loginForm(), appBarTitle: LocalizationKey.login.tr());
  }

  Widget loginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalizationKey.login.tr(),
              style: titleTextStyle,
            ),
            const Expanded(child: SizedBox()),
            Wrap(
              children: [
                Text(LocalizationKey.noAccount.tr()),
                GestureDetector(
                  onTap: () {
                    Map<String, String>? args = shouldShowAppBar
                        ? {NavArgsKeys.appBarTitle: LocalizationKey.signup.tr()}
                        : null;

                    Navigator.pushReplacementNamed(context, AppRouter.signup,
                        arguments: args);
                  },
                  child: Text(
                    LocalizationKey.signup.tr(),
                    style: underlineSecondaryTextStyle.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Email or Mobile
        CoptixTextFormField(
          controller: emailOrMobileController,
          labelText: LocalizationKey.emailOrMobile.tr(),
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Password
        CoptixTextFormField(
          controller: passwordController,
          labelText: LocalizationKey.password.tr(),
          isPassword: true,
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Signup Button
        ElevatedButton(
          onPressed: () {
            String emailOrMobile = emailOrMobileController.text;
            String password = passwordController.text;
            // Validate and process the signup data
            // Add your validation and signup logic here
          },
          child: Text(LocalizationKey.login.tr()),
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Map<String, String>? args = shouldShowAppBar
                    ? {
                        NavArgsKeys.appBarTitle:
                            LocalizationKey.forgetPassword.tr()
                      }
                    : null;

                Navigator.pushNamed(context, AppRouter.forgetPassword,
                    arguments: args);
              },
              child: Text(
                LocalizationKey.forgetPassword.tr(),
                style: underlineSecondaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),
      ],
    );
  }
}
