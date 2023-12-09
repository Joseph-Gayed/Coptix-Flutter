import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../presentation/features/home_landing/home/widgets/item_default_image_card.dart';
import '../theme/dimens.dart';
import '../utils/navigation/shared_navigation.dart';

class ClipsGrid extends StatelessWidget {
  final List<UiClip> clips;
  const ClipsGrid({super.key, required this.clips});

  @override
  Widget build(BuildContext context) {
    return widgetContent(context);
  }

  Widget widgetContent(BuildContext context) {
    if (clips.isNotEmpty) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: Dimens.gridSpacing, // Space between columns
          mainAxisSpacing: Dimens.gridSpacing, // Space between rows
          childAspectRatio:
              calculateGridAspectRatio(), // Adjust this ratio as needed
        ),
        itemCount: clips.length,
        itemBuilder: (context, index) {
          return ItemDefaultImageCard(
            uiClip: clips[index],
            onItemClicked: (uiClip) {
              openDetailsScreen(context, uiClip);
            },
          );
        },
      );
    } else {
      return Center(
          child: Text(
        AppLocalizations.of(context)
            .translate(LocalizationKey.emptyContentMessage),
        style: titleTextStyle,
      ));
    }
  }

  double calculateGridAspectRatio() {
    var cardWidth = HomeDimens.displayTypeWidths[clips[0].displayType] ?? 1;
    var cardHeight = HomeDimens.displayTypeHeights[clips[0].displayType] ?? 1;
    return cardWidth / cardHeight;
  }
}
