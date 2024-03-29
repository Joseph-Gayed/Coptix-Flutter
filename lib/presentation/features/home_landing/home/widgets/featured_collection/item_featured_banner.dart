import 'package:coptix/presentation/features/home_landing/home/widgets/play_now_or_later.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/widgets/safe_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../presentation/model/ui_clip.dart';
import '../../../../../../../shared/theme/dimens.dart';

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
        SafeNetworkImage(
            imagePath: uiClip.getImagePath(),
            width: double.infinity,
            height: double.infinity),

        //Gradient layer
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: HomeDimens.featuredGradientLayerHeight,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent],
            )),
          ),
        ),

        // Item Details
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimens.screenMarginH,
                vertical: HomeDimens.featuredDotsHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Name
                SizedBox(
                  width: double.infinity, // Constrain width to parent width
                  child: Text(
                    uiClip.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: headTextStyle,
                  ),
                ),

                SizedBox(height: Dimens.screenMarginV),
                // Buttons
                PlayNowOrLater(
                  uiClip: uiClip,
                  onPlayNowClicked: onPlayNowClicked,
                  onAddToFavoritesClicked: onAddToFavoritesClicked,
                  isFeaturedBanner: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
