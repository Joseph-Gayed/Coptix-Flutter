import 'package:coptix/presentation/model/ui_season.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SeasonsSingleSelectionChips extends StatefulWidget {
  final List<UiSeason> seasons;
  final Function(UiSeason) onSeasonSelected;
  final UiSeason selectedSeason;
  const SeasonsSingleSelectionChips(
      {super.key,
      required this.seasons,
      required this.selectedSeason,
      required this.onSeasonSelected});

  @override
  State<SeasonsSingleSelectionChips> createState() =>
      _SeasonsSingleSelectionChipsState();
}

class _SeasonsSingleSelectionChipsState
    extends State<SeasonsSingleSelectionChips> {
  int _selectedIndex = 0; // To keep track of the selected chip index

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.seasons.indexOf(widget.selectedSeason);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.seasons.length,
          (index) {
            bool isSelected = _selectedIndex == index;
            Color stateColor = isSelected ? secondaryColor : lightColor;
            return Container(
              padding: const EdgeInsets.only(
                  left: Dimens.screenMargin, right: Dimens.screenMargin),
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(
                  widget.seasons[index].name,
                  style: TextStyle(
                    color: stateColor,
                  ),
                ),
                selected: isSelected,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.cornerRadius),
                  side: BorderSide(
                    color: stateColor,
                    width: 1,
                  ),
                ),
                onSelected: (selected) {
                  setState(() {
                    _selectedIndex = selected ? index : -1;
                    if (_selectedIndex != -1) {
                      widget.onSeasonSelected(widget.seasons[_selectedIndex]);
                    }
                  });
                },
                color: MaterialStateProperty.all<Color>(Colors.transparent),
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.screenMargin),
              ),
            );
          },
        ),
      ),
    );
  }
}
