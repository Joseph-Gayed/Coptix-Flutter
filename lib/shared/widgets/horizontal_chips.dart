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
    return SizedBox(
        height: Dimens.chipHeight,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chips.length,
            itemBuilder: (context, index) {
              return chipWidget(index);
            }));
  }

  Widget chipWidget(int index) {
    bool isSelected = chips[index] == selectedChip;
    Color stateColor = isSelected ? selectedColor : notSelectedColor;

    return Container(
      margin: EdgeInsets.only(
          left: Dimens.screenMarginH, right: Dimens.screenMarginH),
      child: ChoiceChip(
        label: Text(
          chips[index].title,
          style: TextStyle(
            color: stateColor,
          ),
        ),
        showCheckmark: false,
        selected: isSelected,
        color: MaterialStateProperty.all<Color>(Colors.transparent),
        padding: EdgeInsets.symmetric(horizontal: Dimens.screenMarginH),
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
      ),
    );
  }
}
