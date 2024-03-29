import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../../presentation/features/home_landing/home/widgets/play_now_or_later.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../theme/colors.dart';
import '../../theme/dimens.dart';
import '../../utils/constants.dart';
import '../safe_network_image.dart';

class DetailsHeaderTablet extends StatelessWidget {
  final UiClip uiClip;
  final Function(UiClip) onPlayNowClicked;
  final Function(UiClip) onAddToFavoritesClicked;

  const DetailsHeaderTablet({
    super.key,
    required this.uiClip,
    required this.onPlayNowClicked,
    required this.onAddToFavoritesClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Movie Image
        SafeNetworkImage(
            imagePath: uiClip.getImagePath(),
            width: double.infinity,
            height: VideoDetailsDimens.bannerHeightTablet),

        //Crosses layer Mask
        Opacity(
          opacity: Dimens.detailsBannerMaskOpacity,
          child: Image.asset(
            "${imagesPath}details_banner_mask.png",
            width: double.infinity,
            height: VideoDetailsDimens.bannerHeightTablet,
            fit: BoxFit.cover,
          ),
        ),

        //Gradient layer
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: VideoDetailsDimens.gradientLayerHeightTablet,
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
        ),

        //Text and Buttons
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: textAndButtons(context),
        ),
      ],
    );
  }

  Widget textAndButtons(BuildContext context) {
    return Container(
      height: VideoDetailsDimens.bannerHeightTablet,
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.screenMarginH, vertical: Dimens.screenMarginV),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: SizedBox()),
                  if (uiClip.currentSeason != null)
                    //current season
                    Text(
                      "${LocalizationKey.season.tr()}: ${uiClip.currentSeason!.name}",
                      style:
                          body2TextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),

                  //Clip/Series Name
                  Text(
                    uiClip.name,
                    maxLines: 2,
                    style: headTextStyle,
                  ),

                  //Clip/Series description
                  Text(
                    uiClip.description,
                    maxLines: 2,
                    style: body1TextStyle,
                  ),
                  SizedBox(
                    height: Dimens.halfScreenMarginV, // <-- SEE HERE
                  ),

                  //Action Buttons
                  PlayNowOrLater(
                      uiClip: uiClip,
                      onPlayNowClicked: onPlayNowClicked,
                      onAddToFavoritesClicked: onAddToFavoritesClicked),
                  SizedBox(
                    height: Dimens.halfScreenMarginV, // <-- SEE HERE
                  ),
                ],
              )),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
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
