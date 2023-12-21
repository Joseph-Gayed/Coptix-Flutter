import 'package:coptix/presentation/features/auth/auth_container.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/styles.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/widgets/coptix_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late bool shouldShowAppBar;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    shouldShowAppBar =
        context.getNavArgs()?.containsKey(NavArgsKeys.appBarTitle) ?? false;

    return AuthContainer(
      screenContent: forgetPasswordForm(),
    );
  }

  Widget forgetPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          LocalizationKey.forgetPasswordTitle.tr(),
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),

        SizedBox(
          height: Dimens.halfScreenMarginV,
        ),
        Text(
          LocalizationKey.forgetPasswordDescription.tr(),
          style: body1TextStyle.copyWith(color: inActiveColor),
          textAlign: TextAlign.center,
        ),

        SizedBox(
          height: Dimens.doubleScreenMarginV,
        ),

        //Email or Mobile
        CoptixTextFormField(
          controller: emailController,
          labelText: LocalizationKey.email.tr(),
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Signup Button
        ElevatedButton(
          onPressed: () {
            String emailOrMobile = emailController.text;
            String password = passwordController.text;
            // Validate and process the signup data
            // Add your validation and signup logic here
          },
          child: Text(LocalizationKey.sendTheLink.tr()),
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        GestureDetector(
          onTap: () {
            Map<String, String>? args = shouldShowAppBar
                ? {NavArgsKeys.appBarTitle: LocalizationKey.login.tr()}
                : null;
            Navigator.pushReplacementNamed(context, AppRouter.login,
                arguments: args);
          },
          child: Text(
            LocalizationKey.backToLogin.tr(),
            textAlign: TextAlign.center,
            style: underlineSecondaryTextStyle.copyWith(
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
