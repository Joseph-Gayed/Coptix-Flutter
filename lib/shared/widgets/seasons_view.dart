import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/presentation/model/ui_season.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/widgets/seasons_chips.dart';
import 'package:flutter/material.dart';

import '../theme/dimens.dart';
import 'clips_grid.dart';

class SeasonsView extends StatefulWidget {
  final UiClip seasonedClip;
  final Function(UiSeason) onSeasonSelected;
  const SeasonsView(
      {super.key, required this.seasonedClip, required this.onSeasonSelected});

  @override
  State<SeasonsView> createState() => _SeasonsViewState();
}

class _SeasonsViewState extends State<SeasonsView> {
  UiSeason? selectedSeason;
  @override
  Widget build(BuildContext context) {
    var seasons = widget.seasonedClip.seasons;
    selectedSeason = widget.seasonedClip.currentSeason;
    return widgetContent(context, seasons, selectedSeason ?? seasons[0]);
  }

  Widget widgetContent(
      BuildContext context, List<UiSeason> seasons, UiSeason selectedSeason) {
    if (selectedSeason.episodes.isNotEmpty) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SeasonsSingleSelectionChips(
                seasons: seasons,
                selectedSeason: selectedSeason,
                onSeasonSelected: onSeasonSelected),
          ),
          SliverFillRemaining(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.screenMargin),
              child: Padding(
                padding: const EdgeInsets.only(top: Dimens.screenMargin),
                child: ClipsGrid(clips: selectedSeason.episodes),
              ),
            ),
          )
        ],
      );
    } else {
      return Center(
          child: Text(
        AppLocalizations.of(context)
            .translate(LocalizationKey.emptyContentMessage),
        style: titleTextStyle,
      ));
    }
  }

  onSeasonSelected(UiSeason season) {
    setState(() {
      selectedSeason = season;
      widget.onSeasonSelected(season);
    });
  }
}
