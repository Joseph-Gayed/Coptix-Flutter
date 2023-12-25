import 'package:coptix/presentation/features/auth/common/auth_container.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/styles.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/widgets/coptix_text_form_field.dart';
import '../common/cubit/auth_cubit.dart';
import '../common/form_fields.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late bool shouldShowAppBar;
  final TextEditingController emailController = TextEditingController();

  late AuthCubit authCubit;
  late Map<String, TextEditingController> textControllers;
  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
    textControllers = {
      FormFieldKeys.email: emailController,
    };
  }

  @override
  Widget build(BuildContext context) {
    shouldShowAppBar =
        context.getNavArgs()?.containsKey(NavArgsKeys.appBarTitle) ?? false;

    return AuthContainer(
      screenContent: forgetPasswordForm(),
      appBarTitle:
          shouldShowAppBar ? LocalizationKey.forgetPassword.tr() : null,
      handleSuccessState: handleSuccessState,
    );
  }

  handleSuccessState(AuthState state) {
    if (state is AuthForgetPasswordSuccessState) {
      context.showToast(
        message: LocalizationKey.checkYourMail.tr(),
      );
    }
  }

  Widget forgetPasswordForm() {
    Map<String, CoptixTextFormField> forgetPasswordFormFields =
        getForgetPasswordFormFields(textControllers);

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

        //Email
        forgetPasswordFormFields[FormFieldKeys.email]!,
        SizedBox(
          height: Dimens.screenMarginV,
        ),

        //Send Link Button
        ElevatedButton(
          onPressed: () {
            sendLinkButtonClicked(forgetPasswordFormFields);
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

  void sendLinkButtonClicked(Map<String, CoptixTextFormField> formFields) {
    String email = emailController.text;

    bool areAllInputsValid = validateAllFormFields(context, formFields);

    if (areAllInputsValid) {
      authCubit.forgetPassword(email);
    }
  }
}
