import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';

class NotFoundScreen extends StatelessWidget {
  final String inputTitle;
  final String inputMessage;
  final bool showAppBar;

  const NotFoundScreen(
      {super.key,
      this.inputTitle = "",
      this.inputMessage = "",
      this.showAppBar = true});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);
    String title = inputTitle.isNotEmpty
        ? inputTitle
        : appLocalizations.translate(LocalizationKey.notFoundScreenTitle);
    String message = inputMessage.isNotEmpty
        ? inputMessage
        : appLocalizations.translate(LocalizationKey.notFoundErrorMessage);

    return Scaffold(
        appBar: showAppBar
            ? AppBar(
                title: Text(title),
              )
            : null,
        body: CoptixContainer(
            child: Center(
                child: Text(
          message,
          style: titleTextStyle,
        ))));
  }
}
