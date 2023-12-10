import '../enums/collection_display_type.dart';

const designScreenFactor = 0.8;

class FontSizes {
  //https://api.flutter.dev/flutter/material/TextTheme-class.html
  static const double h4 = designScreenFactor * 34;
  static const double h5 = designScreenFactor * 24;
  static const double h6 = designScreenFactor * 20;
  static const double subtitle1 = designScreenFactor * 16;
  static const double subtitle2 = designScreenFactor * 14;
  static const double body1 = designScreenFactor * 16;
  static const double body2 = designScreenFactor * 14;
  static const double button = designScreenFactor * 18;
  static const double caption = designScreenFactor * 12;
  static const double overline = designScreenFactor * 10;
}

class Dimens {
  static const double screenMargin = designScreenFactor * 16;
  static const double halfScreenMargin = screenMargin / 2;
  static const double doubleScreenMargin = screenMargin * 2;
  static const double appBarHeight = 48;
  static const double bottomNavBarIconSize = 25;
  static const double buttonsCornerRadius = 5;
  static const double verticalDividerHeight = designScreenFactor * 31;
  static const double verticalDividerWidth = designScreenFactor * 5;
  static const double verticalDividerCornerRadius = designScreenFactor * 2.5;
  static const double cornerRadius = designScreenFactor * 10;
  static const double arrowIconSize = 20;

  static const double indicatorDotsSize = designScreenFactor * 10;
  static const double gridSpacing = screenMargin;
  static const double detailsBannerMaskOpacity = 0.7;
  static const double tabBarIndicatorHeight = designScreenFactor * 7;
  static const double tabBarIndicatorMargin = designScreenFactor * 7;
  static const double backButtonSize = designScreenFactor * 60;
}

class SplashDimens {
  static const double logoMargin = 50 - Dimens.screenMargin;
  static const double greetingMargin = 90 - Dimens.screenMargin;
}

class HomeDimens {
  static const double collectionsVerticalMargin = designScreenFactor * 53;
  static const double collectionTitleVerticalMargin = designScreenFactor * 16;
  static const double collectionTitleHorizontalMargin = designScreenFactor * 13;
  static const Map<CollectionDisplayType, double> displayTypeWidths = {
    CollectionDisplayType.banner: designScreenFactor * 390,
    CollectionDisplayType.normal: designScreenFactor * 250,
    CollectionDisplayType.vertical: designScreenFactor * 165,
    CollectionDisplayType.special: designScreenFactor * 130,
  };
  static const Map<CollectionDisplayType, double> displayTypeHeights = {
    CollectionDisplayType.banner: designScreenFactor * 485,
    CollectionDisplayType.normal: designScreenFactor * 140,
    CollectionDisplayType.vertical: designScreenFactor * 290,
    CollectionDisplayType.special: designScreenFactor * 225,
  };

  static double featuredGradientLayerHeight = designScreenFactor *
      displayTypeHeights[CollectionDisplayType.banner]! *
      0.7;

  static double featuredButtonsFontSize = 13;
}

class NewAdditionsDimens {
  static const double cardWidth = designScreenFactor * 190;
  static const double cardHeight = designScreenFactor * 290;
}

//banner :
//https://picsum.photos/390/485
//normal:
//https://picsum.photos/250/140
//vertical
//https://picsum.photos/165/290

class VideoDetailsDimens {
  static const double bannerHeight = designScreenFactor * 250;
  static const double shareIconSize = designScreenFactor * 20;
  static const double shareButtonSize =
      shareIconSize + (designScreenFactor * 9);

  static double gradientLayerHeight = designScreenFactor * bannerHeight * 0.2;
}
