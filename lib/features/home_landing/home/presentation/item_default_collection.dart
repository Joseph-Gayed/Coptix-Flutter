import 'package:coptix/main.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../shared/enums/content_type.dart';
import '../../../../shared/theme/styles.dart';
import 'item_default_image_card.dart';
import 'model/ui_collection.dart';

class ItemDefaultCollection extends StatelessWidget {
  final UiCollection uiCollection;
  final Function(String) onViewMoreClicked;
  final Function(String, MediaContentType) onCardClicked;

  const ItemDefaultCollection(
      {super.key,
      required this.uiCollection,
      required this.onViewMoreClicked,
      required this.onCardClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            const EdgeInsets.only(bottom: HomeDimens.collectionsVerticalMargin),
        child: widgetContent(context));
  }

  Widget widgetContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title Row
        Container(
          margin: const EdgeInsets.only(
              bottom: HomeDimens.collectionTitleVerticalMargin),
          child: Row(
            children: [
              Container(
                width: Dimens.verticalDividerWidth,
                height: Dimens.verticalDividerHeight,
                margin: const EdgeInsets.symmetric(
                    horizontal: HomeDimens.collectionTitleHorizontalMargin),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimens.verticalDividerCornerRadius),
                  color: secondaryColor,
                ),
              ),
              Expanded(
                child: Text(
                  uiCollection.title,
                  style: titleTextStyle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  onViewMoreClicked(uiCollection.title);
                  // Navigate to SectionList screen
                },
                child: Container(
                  padding: const EdgeInsets.all(Dimens.halfScreenMargin),
                  child: Image.asset(
                    MyApp.isRtl(context)
                        ? '${imagesPath}ic_arrow_left.png'
                        : '${imagesPath}ic_arrow_right.png',
                    width: Dimens.arrowIconSize, // Adjust width as needed
                    height: Dimens.arrowIconSize, // Adjust height as needed
                  ),
                ),
              ),
            ],
          ),
        ),

        //Horizontal List
        SizedBox(
          height: HomeDimens.collectionHeights[uiCollection.displayType],
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: uiCollection.clips.length,
            itemBuilder: (context, index) {
              return ImageCard(
                  onItemClicked: onCardClicked,
                  uiClip: uiCollection.clips[index]);
            },
          ),
        ),
      ],
    );
  }

  getHeightBasedOnDisplayType() {}
}
