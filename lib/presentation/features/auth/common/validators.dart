import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../shared/utils/constants.dart';
import '../../../../shared/utils/localization/localized_content.dart';

StringValidationCallback requiredValidator =
    ValidationBuilder(requiredMessage: LocalizationKey.required.tr()).build();

StringValidationCallback emailValidator =
    ValidationBuilder(requiredMessage: LocalizationKey.required.tr())
        .email(LocalizationKey.emailValidation.tr())
        .build();

StringValidationCallback passwordValidator = ValidationBuilder(
        requiredMessage: LocalizationKey.required.tr())
    .minLength(
        passwordMinAllowedCharacter, LocalizationKey.passwordValidation.tr())
// .regExp(RegExp(passwordValidationRegex), LocalizationKey.passwordValidation.tr())
    .build();

StringValidationCallback passwordConfirmationValidator = ValidationBuilder(
        requiredMessage: LocalizationKey.required.tr())
    .minLength(
        passwordMinAllowedCharacter, LocalizationKey.passwordValidation.tr())
    // .matching(errorMessage: LocalizationKey.passwordConfirmationValidation.tr())
// .regExp(RegExp(passwordValidationRegex), LocalizationKey.passwordValidation.tr())
    .build();

StringValidationCallback mobileValidator =
    ValidationBuilder(requiredMessage: LocalizationKey.required.tr())
        .phone(LocalizationKey.mobileValidation.tr())
        .build();
