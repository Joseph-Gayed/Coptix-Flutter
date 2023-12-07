import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/coptix_container.dart';
import '../../../shared/utils/constants.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/utils/navigation/shared_navigation.dart';
import '../../../shared/widgets/details_header_mobile.dart';
import '../../model/ui_clip.dart';
import '../error_screen/not_found_screen.dart';
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
        // child: Placeholder()
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DetailsHeaderMobile(
            uiClip: state.uiClip,
            onPlayNowClicked: openVideoPlayer,
            onAddToFavoritesClicked: addToFavorites),
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
