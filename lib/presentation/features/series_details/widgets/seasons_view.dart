import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/presentation/model/ui_season.dart';
import 'package:coptix/presentation/features/series_details/widgets/seasons_chips.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/dimens.dart';
import '../../../../shared/widgets/clips_grid.dart';

class SeasonsView extends StatelessWidget {
  final UiClip seasonedClip;
  final Function(UiSeason) onSeasonSelected;
  const SeasonsView(
      {super.key, required this.seasonedClip, required this.onSeasonSelected});

  @override
  Widget build(BuildContext context) {
    var seasons = seasonedClip.seasons;
    UiSeason selectedSeason = seasonedClip.currentSeason ?? seasons[0];

    return widgetContent(context, seasons, selectedSeason);
  }

  Widget widgetContent(
      BuildContext context, List<UiSeason> seasons, UiSeason selectedSeason) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: Dimens.halfScreenMargin),
                child: SeasonsChips(
                    seasons: seasons,
                    selectedSeason: selectedSeason,
                    onSeasonSelected: onSeasonSelected),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Dimens.screenMargin,
                      left: Dimens.screenMargin,
                      right: Dimens.screenMargin),
                  child: ClipsGrid(clips: selectedSeason.episodes),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
