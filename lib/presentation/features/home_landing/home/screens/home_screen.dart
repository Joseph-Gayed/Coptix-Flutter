import 'package:coptix/presentation/features/home_landing/home/widgets/categories_chips.dart';
import 'package:coptix/presentation/model/ui_collection.dart';
import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/utils/navigation/shared_navigation.dart';
import '../../../../model/ui_clip.dart';
import '../../../error_screen/not_found_screen.dart';
import 'category_screen.dart';
import 'collection_screen.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/item_default_collection.dart';
import '../widgets/item_featured_collection.dart';

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
      return ListView.builder(
        itemCount: homeWidgets.length,
        itemBuilder: (context, index) {
          return homeWidgets[index];
        },
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
      margin:
          const EdgeInsets.only(bottom: HomeDimens.categoriesVerticalMargin),
      child: CategoriesSingleSelectionChips(
          categories: categories, onCategorySelected: openCategory),
    );
  }

  List<Widget> buildCollectionsWidgets(List<UiCollection> collections) {
    return collections
        .map((uiCollection) => getCollectionWidget(uiCollection))
        .toList();
  }

  Widget getCollectionWidget(UiCollection uiCollection) {
    if (uiCollection.displayType == CollectionDisplayType.banner) {
      return ItemFeaturedCollection(
        uiCollection: uiCollection,
        onPlayNowClicked: openDetails,
        onAddToFavoritesClicked: addToFavorites,
      );
    }
    return ItemDefaultCollection(
        uiCollection: uiCollection,
        onViewMoreClicked: openCollection,
        onCardClicked: openDetails);
  }

  void openCategory(UiCategory uiCategory) {
    CategoryScreen.openScreen(context, uiCategory);
  }

  void openCollection(UiCollection uiCollection) {
    CollectionScreen.openScreen(context, uiCollection);
  }

  void openDetails(UiClip uiClip) {
    openDetailsScreen(context, uiClip);
  }

  void addToFavorites(UiClip uiClip) {}
}
