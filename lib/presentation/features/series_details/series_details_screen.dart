import 'package:coptix/shared/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/coptix_container.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/dimens.dart';
import '../../../shared/utils/constants.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/utils/navigation/shared_navigation.dart';
import '../../../shared/widgets/safe_network_image.dart';
import '../error_screen/not_found_screen.dart';
import '../home_landing/home/widgets/play_now_or_later.dart';
import 'cubit/series_details_cubit.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const SeriesDetailsScreen({super.key, required this.arguments});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  late UiClip uiClip;

  @override
  void initState() {
    super.initState();
    uiClip = widget.arguments[NavArgsKeys.clipArgs];
    getData();
  }

  void getData() async {
    BlocProvider.of<SeriesDetailsCubit>(context).getSeriesDetails(uiClip);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(uiClip.name),
        ),
        body: CoptixContainer(
            child: BlocBuilder<SeriesDetailsCubit, SeriesDetailsState>(
          builder: (context, state) {
            return handleState(state);
          },
        )));
  }

  Widget handleState(SeriesDetailsState state) {
    if (state is SeriesDetailsLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      );
    } else if (state is SeriesDetailsSuccessState) {
      return screenContent(state);
    } else if (state is SeriesDetailsErrorState) {
      return NotFoundScreen(
        inputMessage: (state).message,
        showAppBar: false,
      );
    }
    return Container();
  }

  Widget screenContent(SeriesDetailsSuccessState state) {
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
          state.uiClip.seasons[0].name,
          style: body2TextStyle.copyWith(fontWeight: FontWeight.bold),
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
