import 'package:coptix/presentation/features/home_landing/home/widgets/categories_chips.dart';
import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/presentation/model/ui_collection.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/collections_widget_builder.dart';
import '../../../error_screen/not_found_screen.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../../../categories/screens/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.getHome();
  }

  @override
  Widget build(BuildContext context) {
    return CoptixContainer(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return handleState(state);
        },
      ),
    );
  }

  Widget handleState(HomeState homeState) {
    if (homeState is HomeLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      );
    } else if (homeState is HomeErrorState) {
      return NotFoundScreen(
        inputMessage: (homeState).message,
        showAppBar: false,
      );
    } else if (homeState is HomeSuccessState) {
      return handleSuccessState(homeState);
    }
    return Container();
  }

  Widget handleSuccessState(HomeSuccessState homeSuccessState) {
    List<Widget> homeWidgets = buildHomeWidgets(
        homeSuccessState.uiHome.categories,
        homeSuccessState.uiHome.collections);

    if (homeWidgets.isNotEmpty) {
      return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: homeWidgets.length,
              (BuildContext context, int index) {
                return homeWidgets[index];
              },
            ),
          ),
        ],
      );
    } else {
      return NotFoundScreen(
        inputMessage: LocalizationKey.noContent.tr(),
        showAppBar: false,
      );
    }
  }

  List<Widget> buildHomeWidgets(
      List<UiCategory> categories, List<UiCollection> collections) {
    List<Widget> items = [];

    if (collections.isNotEmpty) {
      if (collections.first.displayType == CollectionDisplayType.banner) {
        items.addAll(buildCollectionsWidgets(collections.sublist(0, 1)));
        items.add(buildCategoriesWidgets(categories));
        items.addAll(buildCollectionsWidgets(collections.sublist(1)));
      } else {
        items.add(buildCategoriesWidgets(categories));
        items.addAll(buildCollectionsWidgets(collections));
      }
    }
    return items;
  }

  Widget buildCategoriesWidgets(List<UiCategory> categories) {
    return Container(
      margin: EdgeInsets.only(bottom: HomeDimens.categoriesVerticalMargin),
      child: CategoriesSingleSelectionChips(
          categories: categories, onCategorySelected: openCategory),
    );
  }

  void openCategory(UiCategory uiCategory) {
    CategoryScreen.openScreen(context, uiCategory);
  }
}
