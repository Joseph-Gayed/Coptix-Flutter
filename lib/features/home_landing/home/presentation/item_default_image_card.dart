import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:flutter/material.dart';

import '../../../../shared/enums/content_type.dart';
import '../../../../shared/theme/dimens.dart';
import '../../../../shared/utils/constants.dart';

class ImageCard extends StatelessWidget {
  final Function(String, MediaContentType) onItemClicked;
  final UiClip uiClip;
  const ImageCard({
    super.key,
    required this.onItemClicked,
    required this.uiClip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClicked(uiClip.id, uiClip.contentType);
        // Navigate to MovieDetails screen
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.halfScreenMargin),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.cornerRadius),
          //ToDO: replace with Image.network
          child: Image.asset(
            '$fakeImagesPath${uiClip.imagePath}',
            width: HomeDimens.collectionWidths[uiClip.displayType],
            height: HomeDimens.collectionHeights[uiClip.displayType],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
