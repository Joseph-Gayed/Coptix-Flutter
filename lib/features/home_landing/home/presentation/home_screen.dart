import 'package:coptix/features/error_screen/not_found_screen.dart';
import 'package:coptix/features/home_landing/home/presentation/collection_screen.dart';
import 'package:coptix/features/home_landing/home/presentation/cubit/home_cubit.dart';
import 'package:coptix/features/home_landing/home/presentation/widgets/item_featured_collection.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:coptix/features/home_landing/home/presentation/widgets/item_default_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/navigation/shared_navigation.dart';
import 'model/ui_clip.dart';
import 'model/ui_collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    BlocProvider.of<HomeCubit>(context).getHomeCollections();
  }

  @override
  Widget build(BuildContext context) {
    return CoptixContainer(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return screenContent(state);
        },
      ),
    );
  }

  Widget screenContent(HomeState state) {
    if (state is HomeLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      );
    } else if (state is HomeSuccessState) {
      return homeListView(state);
    } else if (state is HomeErrorState) {
      return NotFoundScreen(
        inputMessage: (state).message,
        showAppBar: false,
      );
    }
    return Container();
  }

  Widget homeListView(HomeSuccessState state) {
    List<UiCollection> homeSectionsData = state.collections;

    return ListView.builder(
      itemCount: homeSectionsData.length,
      itemBuilder: (context, index) {
        final UiCollection uiCollection = homeSectionsData[index];
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
      },
    );
  }

  void openCollection(UiCollection uiCollection) {
    CollectionScreen.openScreen(context, uiCollection);
  }

  void openDetails(UiClip uiClip) {
    openDetailsScreen(context, uiClip);
  }

  void addToFavorites(UiClip uiClip) {}
}
