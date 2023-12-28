import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:flutter/material.dart';

import '../../presentation/features/home_landing/home/widgets/default_collection/item_default_image_card.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../utils/localization/localized_content.dart';
import '../utils/navigation/shared_navigation.dart';

class ClipsGrid extends StatelessWidget {
  final List<UiClip> clips;
  final Function? onLoadMore;
  final bool showLoadMoreProgress;

  final ScrollController _scrollController = ScrollController();

  ClipsGrid(
      {super.key,
      required this.clips,
      this.onLoadMore,
      this.showLoadMoreProgress = false});

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_scrollListener);
    return widgetContent(context);
  }

  // @override
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (onLoadMore != null && !showLoadMoreProgress) {
        onLoadMore!();
      }
    }
  }

  Widget widgetContent(BuildContext context) {
    var aspectRatio = calculateGridAspectRatio();
    if (clips.isNotEmpty) {
      return Column(
        children: [
          SizedBox(
            height: 0.5 * Dimens.gridSpacing,
          ),
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isMobileScreen() ? 2 : 4,
                crossAxisSpacing: Dimens.gridSpacing,
                mainAxisSpacing: Dimens.gridSpacing,
                childAspectRatio: aspectRatio,
              ),
              itemCount: clips.length /*+ (onLoadMore != null ? 1 : 0)*/,
              itemBuilder: (context, index) {
                if (index < clips.length) {
                  return AspectRatio(
                    aspectRatio: aspectRatio,
                    child: ItemDefaultImageCard(
                      uiClip: clips[index],
                      onItemClicked: (uiClip) {
                        openDetailsScreen(context, uiClip);
                      },
                    ),
                  );
                } else {
                  return const SizedBox
                      .shrink(); // Hide progress indicator initially
                }
              },
            ),
          ),
          if (showLoadMoreProgress) _paginationProgressBar()
        ],
      );
    } else {
      return Center(
          child: Text(
        LocalizationKey.emptyContentMessage.tr(),
        style: titleTextStyle,
      ));
    }
  }

  Widget _paginationProgressBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.screenMarginV),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: secondaryColor),
    );
  }

  double calculateGridAspectRatio() {
    if (clips.isNotEmpty) {
      var cardWidth = HomeDimens.displayTypeWidths[clips[0].displayType] ?? 1;
      var cardHeight = HomeDimens.displayTypeHeights[clips[0].displayType] ?? 1;
      return cardWidth > cardHeight ? 12 / 7 : 7 / 12;
    }
    return 1;
  }
}
