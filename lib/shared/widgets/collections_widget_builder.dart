import 'package:coptix/main.dart';
import 'package:flutter/material.dart';

import '../../presentation/features/home_landing/home/screens/collection_screen.dart';
import '../../presentation/features/home_landing/home/widgets/default_collection/item_default_collection.dart';
import '../../presentation/features/home_landing/home/widgets/featured_collection/item_featured_collection.dart';
import '../../presentation/features/home_landing/home/widgets/special_collection/item_special_collection.dart';
import '../../presentation/model/ui_clip.dart';
import '../../presentation/model/ui_collection.dart';
import '../enums/collection_display_type.dart';
import '../utils/navigation/shared_navigation.dart';

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
  } else if (uiCollection.displayType == CollectionDisplayType.special) {
    return ItemSpecialCollection(
      uiCollection: uiCollection,
      onCardClicked: openDetails,
    );
  }
  return ItemDefaultCollection(
      uiCollection: uiCollection,
      onViewMoreClicked: openCollection,
      onCardClicked: openDetails);
}

void openCollection(UiCollection uiCollection) {
  CollectionScreen.openScreen(rootNavigatorKey.currentContext!, uiCollection);
}

void openDetails(UiClip uiClip) {
  openDetailsScreen(rootNavigatorKey.currentContext!, uiClip);
}

void addToFavorites(UiClip uiClip) {}
