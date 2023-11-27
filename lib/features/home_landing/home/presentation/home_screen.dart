import 'package:coptix/features/home_landing/home/presentation/collection_screen.dart';
import 'package:coptix/main.dart';
import 'package:coptix/shared/enums/section_display_type.dart';
import 'package:coptix/shared/fake_data.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:coptix/features/home_landing/home/presentation/item_default_collection.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/navigation/shared_navigation.dart';
import 'model/ui_clip.dart';
import 'model/ui_collection.dart';
import 'item_featured_collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UiCollection> homeSectionsData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    List<UiCollection> data =
        await FakeData.getHomeSectionsData(MyApp.getAppLanguage(context));
    setState(() {
      homeSectionsData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CoptixContainer(
      child: ListView.builder(
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
      ),
    );
  }

  void openCollection(UiCollection uiCollection) {
    CollectionScreen.openScreen(context, uiCollection);
  }

  void openDetails(UiClip uiClip) {
    openDetailsScreen(context, uiClip);
  }

  void addToFavorites(UiClip uiClip) {
    print(
        "openDetails: clicked item is ${uiClip.id} , content type = ${uiClip.contentType}");
  }
}
