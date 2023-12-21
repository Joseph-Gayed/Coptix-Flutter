import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/navigation/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/dimens.dart';
import '../../../../shared/utils/localization/localized_content.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/widgets/coptix_text_form_field.dart';
import '../auth_container.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late bool shouldShowAppBar;

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    shouldShowAppBar =
        context.getNavArgs()?.containsKey(NavArgsKeys.appBarTitle) ?? false;

    return AuthContainer(
      screenContent: signupForm(),
    );
  }

  Widget signupForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalizationKey.signup.tr(),
              style: titleTextStyle,
            ),
            const Expanded(child: SizedBox()),
            Wrap(
              children: [
                Text(LocalizationKey.haveAccount.tr()),
                GestureDetector(
                  onTap: () {
                    Map<String, String>? args = shouldShowAppBar
                        ? {NavArgsKeys.appBarTitle: LocalizationKey.login.tr()}
                        : null;
                    Navigator.pushReplacementNamed(context, AppRouter.login,
                        arguments: args);
                  },
                  child: Text(
                    LocalizationKey.login.tr(),
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

        //First Name
        CoptixTextFormField(
            controller: firstNameController,
            labelText: LocalizationKey.firstName.tr()),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Last Name
        CoptixTextFormField(
          controller: lastNameController,
          labelText: LocalizationKey.lastName.tr(),
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Email
        CoptixTextFormField(
          controller: emailController,
          labelText: LocalizationKey.email.tr(),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Mobile
        CoptixTextFormField(
          controller: mobileController,
          labelText: LocalizationKey.mobile.tr(),
          keyboardType: TextInputType.phone,
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

        //Password Confirmation
        CoptixTextFormField(
          controller: confirmPasswordController,
          labelText: LocalizationKey.confirmPassword.tr(),
          isPassword: true,
        ),
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Signup Button
        ElevatedButton(
          onPressed: () {
            // Implement signup functionality here
            // Access the entered values using the controllers
            String firstName = firstNameController.text;
            String lastName = lastNameController.text;
            String email = emailController.text;
            String mobile = mobileController.text;
            String password = passwordController.text;
            String confirmPassword = confirmPasswordController.text;

            // Validate and process the signup data
            // Add your validation and signup logic here
          },
          child: Text(LocalizationKey.signup.tr()),
        ),
      ],
    );
  }
}
