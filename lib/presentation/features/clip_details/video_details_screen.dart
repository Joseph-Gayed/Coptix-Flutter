import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/widgets/safe_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/coptix_container.dart';
import '../../../shared/utils/constants.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/utils/navigation/shared_navigation.dart';
import '../../model/ui_clip.dart';
import '../error_screen/not_found_screen.dart';
import '../home_landing/home/widgets/play_now_or_later.dart';
import 'cubit/video_details_cubit.dart';

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

  void getData() async {
    BlocProvider.of<VideoDetailsCubit>(context).getClipDetails(uiClip);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(uiClip.name),
        ),
        body: CoptixContainer(
            child: BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
          builder: (context, state) {
            return handleState(state);
          },
        )));
  }

  Widget handleState(VideoDetailsState state) {
    if (state is VideoDetailsLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      );
    } else if (state is VideoDetailsSuccessState) {
      return screenContent(state);
    } else if (state is VideoDetailsErrorState) {
      return NotFoundScreen(
        inputMessage: (state).message,
        showAppBar: false,
      );
    }
    return Container();
  }

  Widget screenContent(VideoDetailsSuccessState state) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            //Movie Image
            SafeNetworkImage(
                imagePath: uiClip.getImagePath(),
                width: double.infinity,
                height: VideoDetailsDimens.bannerHeight),

            //Crosses layer Mask
            Opacity(
              opacity: Dimens.detailsBannerMaskOpacity,
              child: Image.asset(
                "${imagesPath}details_banner_mask.png",
                width: double.infinity,
                height: VideoDetailsDimens.bannerHeight,
                fit: BoxFit.fill,
              ),
            ),

            //Gradient layer
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: VideoDetailsDimens.gradientLayerHeight,
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
        const SizedBox(
          height: Dimens.halfScreenMargin, // <-- SEE HERE
        ),
        Text(
          state.uiClip.name,
          style: headTextStyle,
        ),
        const SizedBox(
          height: Dimens.halfScreenMargin, // <-- SEE HERE
        ),
        Text(
          state.uiClip.description,
          style: body2TextStyle,
        ),
        const SizedBox(
          height: Dimens.halfScreenMargin, // <-- SEE HERE
        ),
        PlayNowOrLater(
            uiClip: state.uiClip,
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

  Future<void> share() async {
    /*var text = 'Check out the movie ${uiClip.getImagePath()}';
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(text,
        subject: uiClip.getImagePath(),
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);*/
  }

  void openVideoPlayer(UiClip uiClip) {
    openVideoPlayerScreen(context, uiClip);
  }

  void addToFavorites(UiClip uiClip) {}
}
