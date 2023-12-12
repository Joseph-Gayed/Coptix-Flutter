import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/dimens.dart';

class ChipItem {
  final String id;
  final String title;

  const ChipItem({required this.id, required this.title});

  @override
  int get hashCode => Object.hash(id, title);

  @override
  bool operator ==(dynamic other) {
    ChipItem otherChipItem = (other as ChipItem);
    return id == otherChipItem.id && title == otherChipItem.title;
  }
}

class HorizontalChips extends StatelessWidget {
  final List<ChipItem> chips;
  final ChipItem? selectedChip;
  final Function(ChipItem clickedChip) onClick;

  final Color selectedColor;
  final Color notSelectedColor;

  const HorizontalChips(
      {super.key,
      required this.chips,
      this.selectedChip,
      required this.onClick,
      this.selectedColor = secondaryColor,
      this.notSelectedColor = lightColor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          chips.length,
          (index) {
            bool isSelected = chips[index] == selectedChip;
            Color stateColor = isSelected ? selectedColor : notSelectedColor;
            return Container(
              padding: const EdgeInsets.only(
                  left: Dimens.screenMargin, right: Dimens.screenMargin),
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(
                  chips[index].title,
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
                  if (index != -1) {
                    onClick(chips[index]);
                  }
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
