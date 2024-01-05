import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/widgets/details_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/coptix_container.dart';
import '../../../core/di/injection_container.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/utils/navigation/shared_navigation.dart';
import '../../../shared/widgets/coptix_app_bar.dart';
import '../../../shared/widgets/details_header/details_header.dart';
import '../error_screen/error_or_empty_screen.dart';
import 'cubit/series_details_cubit.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const SeriesDetailsScreen({super.key, required this.arguments});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();

  static Widget withCubit({required Map<String, dynamic> arguments}) {
    return BlocProvider<SeriesDetailsCubit>(
      create: (context) => getIt(),
      child: SeriesDetailsScreen(
        arguments: arguments,
      ),
    );
  }
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
        appBar: const CoptixAppBar(showingBackButton: true),
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
      return ErrorOrEmptyScreen(
        inputMessage: (state).message,
        showAppBar: false,
      );
    } else if (state is SeriesDetailsSuccessState) {
      if (state.uiClip.currentSeason == null &&
          state.uiClip.seasons.isNotEmpty) {
        state.uiClip.currentSeason = state.uiClip.seasons[0];
      }
      return screenContent(state);
    }

    return Container();
  }

  Widget screenContent(SeriesDetailsSuccessState state) {
    var appLocalizations = AppLocalizations.of(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: DetailsHeader(
              uiClip: state.uiClip,
              onPlayNowClicked: openVideoPlayer,
              onAddToFavoritesClicked: addToFavorites),
        ),
        SliverFillRemaining(
          child: DetailsTabsView(detailsTabs: [
            DetailsTabItem(
                tabName: appLocalizations.translate(LocalizationKey.episodes),
                seasonedClip: state.uiClip,
                onSeasonSelected: (selectedSeason) {
                  seriesDetailsCubit.updateCurrentSeason(
                      state.uiClip, selectedSeason);
                }),
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

  void addToFavorites(UiClip favUiClip) {
    seriesDetailsCubit.updateCurrentSeason(favUiClip, favUiClip.seasons[0]);
  }
}
