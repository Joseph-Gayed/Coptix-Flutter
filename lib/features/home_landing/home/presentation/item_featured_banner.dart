import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/dimens.dart';

class ItemFeaturedBanner extends StatelessWidget {
  final UiClip uiClip;
  final Function(UiClip) onPlayNowClicked;
  final Function(UiClip) onAddToFavoritesClicked;
  const ItemFeaturedBanner({
    super.key,
    required this.uiClip,
    required this.onPlayNowClicked,
    required this.onAddToFavoritesClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Movie Image
        Image.network(uiClip.imagePath,
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),

        //Gradient layer
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: HomeDimens.featuredGradientLayerHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [gradientPrimaryColor, Colors.transparent],
            )),
          ),
        ),

        // Item Details
        Positioned(
          bottom: Dimens.doubleScreenMargin,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.all(Dimens.screenMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Name
                Container(
                  margin: const EdgeInsets.only(bottom: Dimens.screenMargin),
                  width: double.infinity, // Constrain width to parent width
                  child: Text(
                    uiClip.name,
                    style: headTextStyle,
                  ),
                ),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //playNow
                    Expanded(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            onPlayNowClicked(uiClip);
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: Text(
                            AppLocalizations.of(context)
                                .translate(LocalizationKey.playNow),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: HomeDimens.featuredButtonsFontSize),
                          )),
                    ),

                    const SizedBox(
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
                          style: TextStyle(
                              fontSize: HomeDimens.featuredButtonsFontSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
