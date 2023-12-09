import 'package:coptix/shared/theme/colors.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SafeNetworkImage extends StatelessWidget {
  final String imagePath;
  final String placeHolder;
  final double width;
  final double height;
  final BoxFit fit;

  const SafeNetworkImage({
    super.key,
    required this.imagePath,
    this.placeHolder = '${imagesPath}placeholder_horizontal.png',
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.isNotEmpty) {
      return FadeInImage.assetNetwork(
        image: imagePath,
        placeholder: placeHolder,
        placeholderFit: fit,
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      return Image.asset(
        width > height
            ? "${imagesPath}placeholder_horizontal.png"
            : "${imagesPath}placeholder_vertical.png",
        color: secondaryColor,
        width: width,
        height: height,
        fit: BoxFit.fill,
      );
    }
  }
}
