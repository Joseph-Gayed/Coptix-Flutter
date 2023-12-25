import 'package:coptix/presentation/features/auth/common/validators.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:flutter/cupertino.dart';

import '../../../../shared/utils/localization/localized_content.dart';
import '../../../../shared/widgets/coptix_text_form_field.dart';

class FormFieldKeys {
  static const String email = "email";
  static const String name = "name";
  static const String mobile = "mobile";
  static const String password = "password";
  static const String passwordConfirmation = "passwordConfirmation";
}

Map<String, CoptixTextFormField> getLoginFormFields(
    Map<String, TextEditingController> textControllers) {
  return {
    FormFieldKeys.email: CoptixTextFormField(
      controller: textControllers[FormFieldKeys.email]!,
      labelText: LocalizationKey.email.tr(),
      validator: emailValidator,
    ),
    FormFieldKeys.password: CoptixTextFormField(
      controller: textControllers[FormFieldKeys.password]!,
      labelText: LocalizationKey.password.tr(),
      isPassword: true,
      validator: passwordValidator,
    )
  };
}

Map<String, CoptixTextFormField> getSignupFormFields(
    Map<String, TextEditingController> textControllers) {
  Map<String, CoptixTextFormField> signupFormFields =
      getLoginFormFields(textControllers);
  signupFormFields.addAll({
    FormFieldKeys.name: CoptixTextFormField(
      controller: textControllers[FormFieldKeys.name]!,
      labelText: LocalizationKey.name.tr(),
      validator: requiredValidator,
    ),
    FormFieldKeys.mobile: CoptixTextFormField(
      controller: textControllers[FormFieldKeys.mobile]!,
      labelText: LocalizationKey.mobile.tr(),
      keyboardType: TextInputType.phone,
      validator: mobileValidator,
    ),
    FormFieldKeys.passwordConfirmation: CoptixTextFormField(
      controller: textControllers[FormFieldKeys.passwordConfirmation]!,
      labelText: LocalizationKey.passwordConfirmation.tr(),
      isPassword: true,
      validator: passwordConfirmationValidator,
    ),
  });
  return signupFormFields;
}

Map<String, CoptixTextFormField> getForgetPasswordFormFields(
    Map<String, TextEditingController> textControllers) {
  return {
    FormFieldKeys.email: CoptixTextFormField(
      controller: textControllers[FormFieldKeys.email]!,
      labelText: LocalizationKey.email.tr(),
      validator: emailValidator,
    )
  };
}

bool validateAllFormFields(
    BuildContext context, Map<String, CoptixTextFormField> formFields) {
  bool areAllInputsValid = true;
  for (var field in formFields.values) {
    var isValidField = field.isValid(context);
    areAllInputsValid = areAllInputsValid && isValidField;
  }
  return areAllInputsValid;
}
