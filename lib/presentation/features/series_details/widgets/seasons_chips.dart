import 'package:coptix/presentation/model/ui_season.dart';
import 'package:coptix/shared/extensions/list.dart';
import 'package:coptix/shared/widgets/horizontal_chips.dart';
import 'package:flutter/material.dart';

class SeasonsChips extends StatelessWidget {
  final List<UiSeason> seasons;
  final Function(UiSeason) onSeasonSelected;
  final UiSeason selectedSeason;
  const SeasonsChips(
      {super.key,
      required this.seasons,
      required this.selectedSeason,
      required this.onSeasonSelected});

  @override
  Widget build(BuildContext context) {
    var chips = seasons.map((season) => chipFromSeason(season)).toList();
    return HorizontalChips(
        chips: chips,
        selectedChip: chipFromSeason(selectedSeason),
        onClick: (selectedChip) {
          var uiSeason = seasonFromChip(selectedChip);
          return {onSeasonSelected(uiSeason)};
        });
  }

  ChipItem chipFromSeason(UiSeason season) {
    return ChipItem(id: season.id, title: season.name);
  }

  UiSeason seasonFromChip(ChipItem chip) {
    return seasons.find((season) {
      return season.id == chip.id;
    })!;
  }
}
