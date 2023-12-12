import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/coptix_container.dart';
import '../../../shared/utils/localization/app_localizations_delegate.dart';
import '../../../shared/utils/localization/localized_content.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/utils/navigation/shared_navigation.dart';
import '../../../shared/widgets/details_tab_view.dart';
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
        appBar: const CoptixAppBar(showingBackButton: true),
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
    AppLocalizations appLocalizations = AppLocalizations.of(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: DetailsHeaderMobile(
              uiClip: state.uiClip,
              onPlayNowClicked: openVideoPlayer,
              onAddToFavoritesClicked: addToFavorites),
        ),
        SliverFillRemaining(
          child: DetailsTabsView(detailsTabs: [
            DetailsTabItem(
                tabName: appLocalizations.translate(LocalizationKey.related),
                uiClips: state.uiClip.relatedClips),
          ]),
        )
      ],
    );
  }

  void openVideoPlayer(UiClip uiClip) {
    openVideoPlayerScreen(context, uiClip);
  }

  void addToFavorites(UiClip uiClip) {}
}
