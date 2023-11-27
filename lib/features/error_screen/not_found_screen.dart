import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';

class NotFoundScreen extends StatelessWidget {
  final String inputTitle;
  final String inputMessage;
  const NotFoundScreen(
      {super.key, this.inputTitle = "", this.inputMessage = ""});

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
        appBar: AppBar(
          title: Text(title),
        ),
        body: CoptixContainer(
            child: Center(
                child: Text(
          message,
          style: titleTextStyle,
        ))));
  }
}
