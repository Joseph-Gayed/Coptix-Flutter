import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/widgets/safe_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/widgets/coptix_container.dart';
import '../../../../presentation/model/ui_clip.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/utils/navigation/shared_navigation.dart';
import '../../home_landing/home/widgets/play_now_or_later.dart';

class VideoDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const VideoDetailsScreen({super.key, required this.arguments});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  late UiClip uiClip;

  @override
  void initState() {
    super.initState();
    uiClip = widget.arguments[NavArgsKeys.clipArgs];
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(uiClip.name),
        ),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            SafeNetworkImage(
                imagePath: uiClip.getImagePath(),
                width: double.infinity,
                height: VideoDetailsDimens.bannerHeight),
            Positioned(
              left: 0,
              child: shareButton(),
            )
          ],
        ),
        const SizedBox(
          height: Dimens.halfScreenMargin, // <-- SEE HERE
        ),
        const Text(
          /*uiClip.name*/ "asdasdasdasdasdasdasdasdasdasd asdasdasdasdasd asdasdasdasdasdasdasdasd asdasd asdasd adasr e jisi iiiiiiiiii iwwwww",
          style: headTextStyle,
        ),
        const SizedBox(
          height: Dimens.halfScreenMargin, // <-- SEE HERE
        ),
        const Text(
          /*uiClip.description*/ "asdasdasdasdasdasdasdasdasdasd asdasdasdasdasd asdasdasdasdasdasdasdasd asdasd asdasd adasr e jisi iiiiiiiiii iwwwww",
          style: body2TextStyle,
        ),
        const SizedBox(
          height: Dimens.halfScreenMargin, // <-- SEE HERE
        ),
        PlayNowOrLater(
            uiClip: uiClip,
            onPlayNowClicked: openVideoPlayer,
            onAddToFavoritesClicked: addToFavorites),
        const SizedBox(
          height: Dimens.halfScreenMargin, // <-- SEE HERE
        ),
      ],
    ));
  }

  Widget shareButton() {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: gradientPrimaryColor,
          shape: const CircleBorder(),
        ),
        onPressed: share,
        child: const ImageIcon(
          AssetImage("${imagesPath}ic_share.png"),
          color: Colors.white,
          size: VideoDetailsDimens.shareIconSize,
        ));
  }

  void share() {}

  void openVideoPlayer(UiClip uiClip) {
    openVideoPlayerScreen(context, uiClip);
  }

  void addToFavorites(UiClip uiClip) {}

  void getData() async {}
}
