import 'package:coptix/presentation/features/home_landing/home/widgets/categories_chips.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../model/ui_category.dart';
import '../../categories/screens/category_collections_screen.dart';

class ExploreTabView extends StatelessWidget {
  final List<UiCategory> categories;
  final UiCategory selectedUiCategory;

  final Function(UiCategory) onCategorySelected;
  const ExploreTabView(
      {super.key,
      required this.categories,
      required this.selectedUiCategory,
      required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return screenContent(selectedUiCategory);
  }

  Widget screenContent(UiCategory uiCategory) {
    return Column(
      children: [
        CategoriesSingleSelectionChips(
          categories: categories,
          onCategorySelected: onCategorySelected,
          notSelectedColor: lightColor,
          selectedCategory: uiCategory,
        ),
        Expanded(
            child: CategoryCollectionsScreen.withCubit(
                arguments: {NavArgsKeys.categoryArgs: uiCategory},
                showAppBar: false)),
      ],
    );
  }
}
