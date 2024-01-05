import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../domain/usecase/logout_usecase.dart';
import '../../../../shared/theme/dimens.dart';
import '../../../../shared/utils/localization/localized_content.dart';
import '../../home_landing/home_landing_screen.dart';

// ignore: must_be_immutable
class LogoutDialog extends StatelessWidget {
  late LogoutUseCase useCase;
  LogoutDialog({super.key}) {
    useCase = getIt();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.cornerRadius),
      ),
      backgroundColor: primaryColor,
      elevation: 1,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.screenMarginH,
                  vertical: Dimens.screenMarginV),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.logout, size: AuthDimens.logoutIconSize),
                  Text(LocalizationKey.logout.tr(),
                      textAlign: TextAlign.center, style: titleTextStyle),
                  SizedBox(height: Dimens.screenMarginV),
                  Text(LocalizationKey.logoutConfirmation.tr(),
                      textAlign: TextAlign.center, style: body1TextStyle),
                  SizedBox(height: Dimens.screenMarginV),
                  TextButton(
                    style: secondaryButtonStyle,
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimens.buttonHorizontalPadding),
                      child: Text(LocalizationKey.cancel.tr()),
                    ),
                  ),
                  SizedBox(height: Dimens.screenMarginV),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryButtonBackgroundColor,
                      border: Border.all(
                        color: secondaryColor, // Change the color as needed
                        width: AuthDimens
                            .borderWidth, // Adjust the width as needed
                      ),
                      borderRadius: BorderRadius.circular(Dimens.cornerRadius),
                    ),
                    child: TextButton(
                      style: primaryButtonStyle,
                      onPressed: () {
                        _logout(context);
                      },
                      child: Text(
                        LocalizationKey.logout.tr(),
                        style: const TextStyle(color: secondaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Future<void> _logout(BuildContext context) async {
    // Clear user data
    await useCase.execute();

    // Close dialog
    // ignore: use_build_context_synchronously
    context.restartHomeOnTabIndex(
        tabIndex: HomeLandingScreen.indexOfProfileTab);
  }
}
