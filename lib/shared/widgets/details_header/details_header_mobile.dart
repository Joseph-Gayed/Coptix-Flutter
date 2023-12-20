import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../../presentation/model/ui_clip.dart';
import '../../theme/colors.dart';
import '../../theme/dimens.dart';
import '../../utils/constants.dart';
import '../safe_network_image.dart';
import '../../../presentation/features/home_landing/home/widgets/play_now_or_later.dart';

class DetailsHeaderMobile extends StatelessWidget {
  final UiClip uiClip;
  final Function(UiClip) onPlayNowClicked;
  final Function(UiClip) onAddToFavoritesClicked;

  const DetailsHeaderMobile({
    super.key,
    required this.uiClip,
    required this.onPlayNowClicked,
    required this.onAddToFavoritesClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            //Movie Image
            SafeNetworkImage(
                imagePath: uiClip.getImagePath(),
                width: double.infinity,
                height: VideoDetailsDimens.bannerHeightMobile),

            //Crosses layer Mask
            Opacity(
              opacity: Dimens.detailsBannerMaskOpacity,
              child: Image.asset(
                "${imagesPath}details_banner_mask.png",
                width: double.infinity,
                height: VideoDetailsDimens.bannerHeightMobile,
                fit: BoxFit.fill,
              ),
            ),

            //Gradient layer
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: VideoDetailsDimens.gradientLayerHeightMobile,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                )),
              ),
            ),

            //share button
            Positioned(
              left: 0,
              child: shareButton(),
            )
          ],
        ),
        SizedBox(
          height: Dimens.halfScreenMarginH, // <-- SEE HERE
        ),

        if (uiClip.currentSeason != null)
          //current season
          Text(
            "${LocalizationKey.season}: ${uiClip.currentSeason!.name}",
            style: body2TextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        SizedBox(
          height: Dimens.halfScreenMarginH, // <-- SEE HERE
        ),

        //Clip/Series Name
        Text(
          uiClip.name,
          maxLines: 2,
          style: headTextStyle,
        ),
        SizedBox(
          height: Dimens.halfScreenMarginH, // <-- SEE HERE
        ),

        //Clip/Series description
        Text(
          uiClip.description,
          maxLines: 2,
          style: body1TextStyle,
        ),
        SizedBox(
          height: Dimens.halfScreenMarginH, // <-- SEE HERE
        ),

        //Action Buttons
        PlayNowOrLater(
            uiClip: uiClip,
            onPlayNowClicked: onPlayNowClicked,
            onAddToFavoritesClicked: onAddToFavoritesClicked),
        SizedBox(
          height: Dimens.halfScreenMarginH, // <-- SEE HERE
        ),
      ],
    );
  }

  Widget shareButton() {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: gradientPrimaryColor,
          shape: const CircleBorder(),
        ),
        onPressed: share,
        child: ImageIcon(
          const AssetImage("${imagesPath}ic_share.png"),
          color: lightColor,
          size: VideoDetailsDimens.shareIconSize,
        ));
  }

  Future<void> share() async {
    Share.share(uiClip.getImagePath());
  }
}
