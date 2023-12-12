import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SafeNetworkImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;

  const SafeNetworkImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.isNotEmpty) {
      return FadeInImage.assetNetwork(
        image: imagePath,
        placeholder: getPlaceHolderPath(),
        placeholderFit: BoxFit.fill,
        width: width,
        height: height,
        fit: fit,
        imageErrorBuilder: (context, error, stackTrace) {
          // Return a custom error widget or a placeholder image
          return getPlaceHolderImage();
        },
      );
    } else {
      return getPlaceHolderImage();
    }
  }

  String getPlaceHolderPath() {
    return width > height
        ? "${imagesPath}placeholder_horizontal.png"
        : "${imagesPath}placeholder_vertical.png";
  }

  Image getPlaceHolderImage() {
    return Image.asset(
      getPlaceHolderPath(),
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
