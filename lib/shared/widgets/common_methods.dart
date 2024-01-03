import 'package:flutter/material.dart';

import '../theme/dimens.dart';
import '../utils/constants.dart';

Image getBottomBarIcon(String iconName) {
  return Image.asset("$imagesPath$iconName",
      width: Dimens.bottomNavBarIconSize, height: Dimens.bottomNavBarIconSize);
}

Image getAssetIcon(String iconName) {
  return Image.asset("$imagesPath$iconName",
      width: Dimens.defaultIconSize, height: Dimens.defaultIconSize);
}
