import 'package:coptix/main.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../presentation/model/ui_clip.dart';
import '../../../../../../presentation/model/ui_collection.dart';
import '../../../../../../shared/theme/styles.dart';
import '../default_collection/clips_horizontal_list_view.dart';

class ItemSpecialCollection extends StatefulWidget {
  final UiCollection uiCollection;
  final Function(UiClip) onCardClicked;

  const ItemSpecialCollection(
      {super.key, required this.uiCollection, required this.onCardClicked});

  @override
  State<ItemSpecialCollection> createState() => _ItemSpecialCollectionState();
}

class _ItemSpecialCollectionState extends State<ItemSpecialCollection> {
  int indexOfActiveItem = 0;
  late ScrollController _scrollController;
  _scrollListener() {
    int index = getFirstVisibleIndex();
    if (index >= 0 && index < widget.uiCollection.clips.length) {
      setState(() {
        indexOfActiveItem = index;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  int getFirstVisibleIndex() {
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      double itemExtent = HomeDimens.displayTypeWidths[CollectionDisplayType
          .special]!; // Adjust this based on your item size
      int index = (offset / itemExtent).floor();
      return index;
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          left: Dimens.screenMarginH,
          right: Dimens.screenMarginH,
          bottom: HomeDimens.categoriesVerticalMargin),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Gradiant Layer
          Image.asset(
            MyApp.isRtl(context)
                ? "${imagesPath}special_gradiant_layer_ar.png"
                : "${imagesPath}special_gradiant_layer_en.png",
            fit: BoxFit.fill,
            height: HomeDimens.specialCollectionHeight,
            width: double.infinity,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textInfo(),
              horizontalClips(),
            ],
          )
        ],
      ),
    );
  }

  Container textInfo() {
    return Container(
      width: HomeDimens.specialTextContainerWidth,
      height: HomeDimens.displayTypeHeights[CollectionDisplayType.special],
      margin: EdgeInsets.only(
          left: Dimens.itemsHalfHorizontalMargin,
          right: Dimens.itemsHorizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.uiCollection.name,
            style: headTextStyle,
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          if (widget.uiCollection.clips.isNotEmpty)
            SizedBox(height: Dimens.halfScreenMarginV),
          Text(
            widget.uiCollection.clips[indexOfActiveItem].name,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: subTitleTextStyle,
          ),
        ],
      ),
    );
  }

  Expanded horizontalClips() {
    return Expanded(
      child: ClipsHorizontalListView(
        uiCollection: widget.uiCollection,
        onCardClicked: widget.onCardClicked,
        scrollController: _scrollController,
      ),
    );
  }
}
