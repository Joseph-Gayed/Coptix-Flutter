import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../../../../../../presentation/model/ui_clip.dart';
import '../../../../../../presentation/model/ui_collection.dart';
import '../../../../../../shared/theme/colors.dart';
import 'item_featured_banner.dart';

class ItemFeaturedCollection extends StatefulWidget {
  final UiCollection uiCollection;
  final Function(UiClip) onPlayNowClicked;
  final Function(UiClip) onAddToFavoritesClicked;

  const ItemFeaturedCollection(
      {super.key,
      required this.uiCollection,
      required this.onPlayNowClicked,
      required this.onAddToFavoritesClicked});

  @override
  State<ItemFeaturedCollection> createState() => _ItemFeaturedCollectionState();
}

class _ItemFeaturedCollectionState extends State<ItemFeaturedCollection> {
  int indexOfActiveItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: HomeDimens.displayTypeHeights[widget.uiCollection.displayType],
      margin: const EdgeInsets.only(
          left: Dimens.screenMargin,
          right: Dimens.screenMargin,
          bottom: HomeDimens.categoriesVerticalMargin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.cornerRadius),
        child: Stack(
          children: [
            // Clips Carousel
            PageView.builder(
              itemCount: widget.uiCollection.clips.length,
              itemBuilder: (context, index) {
                return ItemFeaturedBanner(
                  uiClip: widget.uiCollection.clips[index],
                  onPlayNowClicked: widget.onPlayNowClicked,
                  onAddToFavoritesClicked: widget.onAddToFavoritesClicked,
                );
              },
              onPageChanged: (int page) {
                setState(() {
                  indexOfActiveItem = page;
                });
              },
            ),

            // Carousel Indicator Dots
            Positioned(
              bottom: Dimens.screenMargin,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.uiCollection.clips.length,
                  (index) => Container(
                    width: Dimens.indicatorDotsSize,
                    height: Dimens.indicatorDotsSize,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == indexOfActiveItem
                          ? secondaryColor
                          : inActiveColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
