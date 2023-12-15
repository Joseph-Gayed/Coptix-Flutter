import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../../../../../presentation/model/ui_clip.dart';
import '../../../../../../shared/theme/dimens.dart';

class PlayNowOrLater extends StatelessWidget {
  const PlayNowOrLater({
    super.key,
    required this.uiClip,
    required this.onPlayNowClicked,
    required this.onAddToFavoritesClicked,
  });

  final UiClip uiClip;
  final Function(UiClip p1) onPlayNowClicked;
  final Function(UiClip p1) onAddToFavoritesClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //playNow
        Expanded(
          child: ElevatedButton.icon(
              style: secondaryButtonStyle,
              onPressed: () {
                onPlayNowClicked(uiClip);
              },
              icon: const Icon(Icons.play_arrow),
              label: Text(
                AppLocalizations.of(context).translate(LocalizationKey.playNow),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: HomeDimens.featuredButtonsFontSize),
              )),
        ),

        SizedBox(
          width: Dimens.screenMargin,
        ),
        //Add to myList
        Expanded(
          child: ElevatedButton.icon(
            style: primaryButtonStyle,
            onPressed: () {
              onAddToFavoritesClicked(uiClip);
            },
            icon: const Icon(Icons.bookmark),
            label: Text(
              AppLocalizations.of(context)
                  .translate(LocalizationKey.addToMyList),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: HomeDimens.featuredButtonsFontSize),
            ),
          ),
        ),
      ],
    );
  }
}
