import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/shared/extensions/list.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/widgets/horizontal_chips.dart';
import 'package:flutter/material.dart';

class CategoriesSingleSelectionChips extends StatelessWidget {
  final List<UiCategory> categories;
  final Function(UiCategory) onCategorySelected;
  const CategoriesSingleSelectionChips(
      {super.key, required this.categories, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return HorizontalChips(
      chips: categories.map((category) => chipFromCategory(category)).toList(),
      onClick: (selectedChip) =>
          {onCategorySelected(categoryFromChip(selectedChip))},
      selectedColor: secondaryColor,
      notSelectedColor: secondaryColor,
    );
  }

  ChipItem chipFromCategory(UiCategory category) {
    return ChipItem(id: category.id, title: category.name);
  }

  UiCategory categoryFromChip(ChipItem chip) {
    return categories.find((category) {
          return category.id == chip.id;
        }) ??
        categories[0];
  }
}
