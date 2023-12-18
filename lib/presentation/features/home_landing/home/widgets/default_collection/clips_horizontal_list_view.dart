import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../../../../../../../presentation/model/ui_clip.dart';
import '../../../../../../../presentation/model/ui_collection.dart';
import 'item_default_image_card.dart';

class ClipsHorizontalListView extends StatelessWidget {
  final UiCollection uiCollection;
  final Function(UiClip) onCardClicked;
  final ScrollController? scrollController;

  const ClipsHorizontalListView(
      {super.key,
      required this.uiCollection,
      required this.onCardClicked,
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HomeDimens.displayTypeHeights[uiCollection.displayType],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: uiCollection.clips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.halfScreenMarginH),
            child: ItemDefaultImageCard(
                onItemClicked: onCardClicked,
                uiClip: uiCollection.clips[index]),
          );
        },
      ),
    );
  }
}
