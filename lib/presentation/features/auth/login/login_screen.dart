import 'package:coptix/presentation/features/auth/common/form_fields.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/utils/navigation/navigation_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/theme/styles.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/widgets/coptix_text_form_field.dart';
import '../common/auth_container.dart';
import '../common/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool shouldShowAppBar;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late AuthCubit authCubit;
  late Map<String, TextEditingController> textControllers;
  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
    textControllers = {
      FormFieldKeys.email: emailController,
      FormFieldKeys.password: passwordController,
    };
  }

  @override
  Widget build(BuildContext context) {
    shouldShowAppBar =
        context.getNavArgs()?.containsKey(NavArgsKeys.appBarTitle) ?? false;
    return AuthContainer(
        screenContent: loginForm(),
        appBarTitle: shouldShowAppBar ? LocalizationKey.login.tr() : null);
  }

  Widget loginForm() {
    Map<String, CoptixTextFormField> loginFormFields =
        getLoginFormFields(textControllers);

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
        loginFormFields[FormFieldKeys.email]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Password
        loginFormFields[FormFieldKeys.password]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Login Button
        ElevatedButton(
          onPressed: () {
            loginButtonClicked(loginFormFields);
            // context.backToHome();
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
            //forget password
            GestureDetector(
              onTap: () {
                Map<String, String>? args = shouldShowAppBar
                    ? {
                        NavArgsKeys.appBarTitle:
                            LocalizationKey.forgetPassword.tr()
                      }
                    : null;

                Navigator.pushReplacementNamed(
                    context, AppRouter.forgetPassword,
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

  void loginButtonClicked(Map<String, CoptixTextFormField> formFields) {
    String email = emailController.text;
    String password = passwordController.text;

    bool areAllInputsValid = validateAllFormFields(context, formFields);

    if (areAllInputsValid) {
      authCubit.login(email, password);
    }
  }
}
