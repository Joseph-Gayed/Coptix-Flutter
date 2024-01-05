import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/widgets/common_methods.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';

class ErrorOrEmptyScreen extends StatelessWidget {
  final String? icon;
  final String inputTitle;
  final String? inputSubTitle;
  final String inputMessage;
  final bool showAppBar;

  const ErrorOrEmptyScreen(
      {super.key,
      this.icon,
      this.inputTitle = "",
      this.inputSubTitle,
      this.inputMessage = "",
      this.showAppBar = true});

  @override
  Widget build(BuildContext context) {
    String title = inputTitle.isNotEmpty
        ? inputTitle
        : LocalizationKey.notFoundScreenTitle.tr();
    String message = inputMessage.isNotEmpty
        ? inputMessage
        : LocalizationKey.notFoundErrorMessage.tr();

    return Scaffold(
        appBar: showAppBar
            ? AppBar(
                title: Text(title),
              )
            : null,
        body: CoptixContainer(
            child: Center(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            if (icon != null) getAssetIcon(icon!, size: Dimens.errorIconSize),
            if (inputSubTitle != null)
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: Dimens.halfScreenMarginV),
                child: Text(inputSubTitle!, style: titleTextStyle),
              ),
            Text(message, style: body1TextStyle),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ))));
  }
}
