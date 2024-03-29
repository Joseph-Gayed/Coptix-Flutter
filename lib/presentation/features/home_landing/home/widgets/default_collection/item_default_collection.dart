import 'package:coptix/presentation/features/home_landing/home/widgets/default_collection/clips_horizontal_list_view.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../../main.dart';
import '../../../../../../../presentation/model/ui_clip.dart';
import '../../../../../../../presentation/model/ui_collection.dart';
import '../../../../../../../shared/theme/styles.dart';

class ItemDefaultCollection extends StatelessWidget {
  final UiCollection uiCollection;
  final Function(UiCollection uiCollection) onViewMoreClicked;
  final Function(UiClip) onCardClicked;

  const ItemDefaultCollection(
      {super.key,
      required this.uiCollection,
      required this.onViewMoreClicked,
      required this.onCardClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: 0.5 * HomeDimens.collectionsVerticalMargin),
        child: widgetContent(context));
  }

  Widget widgetContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title Row
        Container(
          margin:
              EdgeInsets.only(bottom: HomeDimens.collectionTitleVerticalMargin),
          child: GestureDetector(
            onTap: () {
              onViewMoreClicked(uiCollection);
              // Navigate to SectionList screen
            },
            child: Row(
              children: [
                Container(
                  width: Dimens.verticalDividerWidth,
                  height: Dimens.verticalDividerHeight,
                  margin: EdgeInsets.symmetric(
                      horizontal: HomeDimens.collectionTitleHorizontalMargin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.cornerRadius),
                    color: secondaryColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    uiCollection.name,
                    style: titleTextStyle,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimens.screenMarginH),
                  child: Image.asset(
                    MyApp.isRtl(context)
                        ? '${imagesPath}ic_arrow_left.png'
                        : '${imagesPath}ic_arrow_right.png',
                    width: Dimens.arrowIconSize, // Adjust width as needed
                    height: Dimens.arrowIconSize, // Adjust height as needed
                  ),
                ),
              ],
            ),
          ),
        ),

        //Horizontal List
        ClipsHorizontalListView(
            uiCollection: uiCollection, onCardClicked: onCardClicked),
      ],
    );
  }
}
