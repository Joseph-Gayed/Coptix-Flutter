import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/theme/dimens.dart';
import '../../../../shared/utils/localization/localized_content.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/widgets/coptix_text_form_field.dart';
import '../common/auth_container.dart';
import '../common/cubit/auth_cubit.dart';
import '../common/form_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late bool shouldShowAppBar;

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmationController =
      TextEditingController();

  late AuthCubit authCubit;
  late Map<String, TextEditingController> textControllers;

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
    textControllers = {
      FormFieldKeys.name: firstNameController,
      FormFieldKeys.email: emailController,
      FormFieldKeys.mobile: mobileController,
      FormFieldKeys.password: passwordController,
      FormFieldKeys.passwordConfirmation: passwordConfirmationController,
    };
  }

  @override
  Widget build(BuildContext context) {
    shouldShowAppBar =
        context.getNavArgs()?.containsKey(NavArgsKeys.appBarTitle) ?? false;

    return AuthContainer(
      screenContent: signupForm(),
      appBarTitle: shouldShowAppBar ? LocalizationKey.signup.tr() : null,
    );
  }

  Widget signupForm() {
    Map<String, CoptixTextFormField> signupFormFields =
        getSignupFormFields(textControllers);

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

        //Name
        signupFormFields[FormFieldKeys.name]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Email
        signupFormFields[FormFieldKeys.email]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Mobile
        signupFormFields[FormFieldKeys.mobile]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Password
        signupFormFields[FormFieldKeys.password]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Password Confirmation
        signupFormFields[FormFieldKeys.passwordConfirmation]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Signup Button
        ElevatedButton(
          onPressed: () {
            signUpButtonClicked(signupFormFields);
          },
          child: Text(LocalizationKey.signup.tr()),
        ),
      ],
    );
  }

  void signUpButtonClicked(Map<String, CoptixTextFormField> formFields) {
    bool areAllInputsValid = validateAllFormFields(context, formFields);

    bool isPasswordMatchingConfirmation =
        passwordController.text == passwordConfirmationController.text;

    if (!isPasswordMatchingConfirmation) {
      context.showToast(
        message: LocalizationKey.passwordConfirmationValidation.tr(),
      );
    }

    if (areAllInputsValid & isPasswordMatchingConfirmation) {
      authCubit.signup(
          name: firstNameController.text,
          mobile: mobileController.text,
          email: emailController.text,
          password: passwordController.text);
    }
  }
}
