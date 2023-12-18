import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../../../../../presentation/model/ui_clip.dart';
import '../../../../../../shared/theme/dimens.dart';

class PlayNowOrLater extends StatelessWidget {
  final UiClip uiClip;
  final Function(UiClip) onPlayNowClicked;
  final Function(UiClip) onAddToFavoritesClicked;

  final bool isFeaturedBanner;

  const PlayNowOrLater({
    super.key,
    required this.uiClip,
    required this.onPlayNowClicked,
    required this.onAddToFavoritesClicked,
    this.isFeaturedBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isTablet = !context.isMobileScreen();
    TextStyle buttonTextStyle = TextStyle(fontSize: FontSizes.subtitle1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (isTablet & isFeaturedBanner)
          const Expanded(flex: 2, child: SizedBox()),
        //playNow
        Expanded(
          flex: 2,
          child: ElevatedButton.icon(
              style: secondaryButtonStyle,
              onPressed: () {
                onPlayNowClicked(uiClip);
              },
              icon: Icon(
                Icons.play_arrow,
                size: Dimens.buttonIconSize,
              ),
              label: Text(
                AppLocalizations.of(context).translate(LocalizationKey.playNow),
                textAlign: TextAlign.center,
                style: buttonTextStyle,
              )),
        ),

        SizedBox(
          width: Dimens.halfScreenMarginH,
        ),
        //Add to myList
        Expanded(
          flex: 2,
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
              style: buttonTextStyle,
            ),
          ),
        ),

        if (isTablet) const Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}
