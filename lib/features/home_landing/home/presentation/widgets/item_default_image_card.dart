import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/theme/dimens.dart';
import '../../../../../shared/widgets/safe_network_image.dart';

class ItemDefaultImageCard extends StatelessWidget {
  final Function(UiClip) onItemClicked;
  final UiClip uiClip;
  const ItemDefaultImageCard({
    super.key,
    required this.onItemClicked,
    required this.uiClip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClicked(uiClip);
        // Navigate to MovieDetails screen
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.cornerRadius),
          child: SafeNetworkImage(
            imagePath: uiClip.getImagePath(),
            width: HomeDimens.collectionWidths[uiClip.displayType]!,
            height: HomeDimens.collectionHeights[uiClip.displayType]!,
          )),
    );
  }
}
