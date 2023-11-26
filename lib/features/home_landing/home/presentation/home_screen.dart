import 'package:coptix/main.dart';
import 'package:coptix/shared/enums/section_display_type.dart';
import 'package:coptix/shared/fake_data.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:coptix/features/home_landing/home/presentation/item_default_collection.dart';
import 'package:flutter/material.dart';

import '../../../../shared/enums/content_type.dart';
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

  List<Widget> mapSectionsDataToWidgetsList() {
    return homeSectionsData
        .map((sectionData) => ItemDefaultCollection(
            uiCollection: sectionData,
            onViewMoreClicked: openCollection,
            onCardClicked: openDetails))
        .toList();
  }

  void openCollection(String collectionId) {
    print("clicked collection is $collectionId");
  }

  void openDetails(String itemId, MediaContentType mediaContentType) {
    print(
        "openDetails: clicked item is $itemId , content type = $mediaContentType");
  }

  void addToFavorites(String bannerItemId, MediaContentType mediaContentType) {
    print(
        "addToFavorites:clicked item is is $bannerItemId, content type = $mediaContentType");
  }
}
