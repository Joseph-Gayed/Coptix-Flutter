import 'package:coptix/shared/widgets/details_header_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/coptix_container.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/utils/navigation/shared_navigation.dart';
import '../error_screen/not_found_screen.dart';
import 'cubit/series_details_cubit.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const SeriesDetailsScreen({super.key, required this.arguments});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  late UiClip uiClip;
  late SeriesDetailsCubit seriesDetailsCubit;

  @override
  void initState() {
    super.initState();
    uiClip = widget.arguments[NavArgsKeys.clipArgs];
    getData();
  }

  void getData() async {
    seriesDetailsCubit = BlocProvider.of<SeriesDetailsCubit>(context);
    seriesDetailsCubit.getSeriesDetails(uiClip);
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
    } else if (state is SeriesDetailsErrorState) {
      return NotFoundScreen(
        inputMessage: (state).message,
        showAppBar: false,
      );
    } else if (state is SeriesDetailsSuccessState) {
      return screenContent(state);
    }

    return Container();
  }

  Widget screenContent(SeriesDetailsSuccessState state) {
    return SingleChildScrollView(
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

  void openVideoPlayer(UiClip uiClip) {
    openVideoPlayerScreen(context, uiClip);
  }

  void addToFavorites(UiClip favUiClip) {
    seriesDetailsCubit.updateCurrentSeason(favUiClip, favUiClip.seasons[0]);
  }
}
