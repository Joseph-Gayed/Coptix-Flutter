import '../enums/collection_display_type.dart';
import '../utils/app_configurations.dart';

double designScreenFactor = 0.8 * (isTabletDimension ? 2 : 1);

//banner :
//https://picsum.photos/390/485
//normal:
//https://picsum.photos/250/140
//vertical
//https://picsum.photos/165/290

class FontSizes {
  static double h4 = designScreenFactor * 34;
  static double h5 = designScreenFactor * 24;
  static double h6 = designScreenFactor * 20;
  static double subtitle1 = designScreenFactor * 16;
  static double subtitle2 = designScreenFactor * 14;
  static double body1 = designScreenFactor * 16;
  static double body2 = designScreenFactor * 14;
  static double button = designScreenFactor * 18;
  static double caption = designScreenFactor * 12;
  static double overline = designScreenFactor * 10;
}

class Dimens {
  static double screenMargin = designScreenFactor * 16;
  static double halfScreenMargin = screenMargin / 2;
  static double doubleScreenMargin = screenMargin * 2;
  static double appBarHeight = designScreenFactor * 56;
  static double bottomNavBarIconSize = designScreenFactor * 25;
  static double buttonsCornerRadius = designScreenFactor * 5;
  static double verticalDividerHeight = designScreenFactor * 31;
  static double verticalDividerWidth = designScreenFactor * 5;
  static double verticalDividerCornerRadius = designScreenFactor * 2.5;
  static double cornerRadius = designScreenFactor * 10;
  static double arrowIconSize = designScreenFactor * 20;
  static double indicatorDotsSize = designScreenFactor * 10;
  static double gridSpacing = screenMargin;
  static double detailsBannerMaskOpacity = 0.7;
  static double tabBarIndicatorHeight = designScreenFactor * 4;
  static double tabBarIndicatorMargin = designScreenFactor * 7;
  static double backButtonSize = designScreenFactor * 60;
  static double chipHeight = designScreenFactor * 40;
  static double buttonHorizontalPadding = designScreenFactor * 6;
  static double buttonVerticalPadding = designScreenFactor * 10;

  static Map<CollectionDisplayType, double> displayTypeWidths = {
    CollectionDisplayType.banner: designScreenFactor * 385,
    CollectionDisplayType.normal: designScreenFactor * 250,
    CollectionDisplayType.vertical: designScreenFactor * 165,
    CollectionDisplayType.special: designScreenFactor * 165,
  };
  static Map<CollectionDisplayType, double> displayTypeHeights = {
    CollectionDisplayType.banner: designScreenFactor * 688,
    CollectionDisplayType.normal: designScreenFactor * 140,
    CollectionDisplayType.vertical: designScreenFactor * 294,
    CollectionDisplayType.special: designScreenFactor * 294,
  };
}

class SplashDimens {
  static double logoMargin = (designScreenFactor * 50) - Dimens.screenMargin;
  static double greetingMargin =
      (designScreenFactor * 90) - Dimens.screenMargin;
}

class HomeDimens {
  static double collectionsVerticalMargin = designScreenFactor * 53;
  static double collectionTitleVerticalMargin = designScreenFactor * 16;
  static double categoriesVerticalMargin = designScreenFactor * 32;
  static double collectionTitleHorizontalMargin = designScreenFactor * 13;

  static Map<CollectionDisplayType, double> displayTypeWidths = {
    CollectionDisplayType.banner: designScreenFactor * 385,
    CollectionDisplayType.normal: designScreenFactor * 250,
    CollectionDisplayType.vertical: designScreenFactor * 165,
    CollectionDisplayType.special: designScreenFactor * 165,
  };
  static Map<CollectionDisplayType, double> displayTypeHeights = {
    CollectionDisplayType.banner: designScreenFactor * 688,
    CollectionDisplayType.normal: designScreenFactor * 140,
    CollectionDisplayType.vertical: designScreenFactor * 294,
    CollectionDisplayType.special: designScreenFactor * 294,
  };

  static double featuredGradientLayerHeight = designScreenFactor *
      displayTypeHeights[CollectionDisplayType.banner]! *
      0.7;

  static double featuredButtonsFontSize = FontSizes.subtitle1;
  static double specialVerticalPadding = designScreenFactor * 32;
  static double specialCollectionHeight = specialVerticalPadding +
      displayTypeHeights[CollectionDisplayType.special]!;
  static double specialTextContainerWidth = designScreenFactor * 195;
}

class NewAdditionsDimens {
  static double cardWidth = designScreenFactor * 190;
  static double cardHeight = designScreenFactor * 290;
}

class VideoDetailsDimens {
  static double bannerHeight = designScreenFactor * 250;
  static double shareIconSize = designScreenFactor * 20;
  static double shareButtonSize = shareIconSize + (designScreenFactor * 9);
  static double gradientLayerHeight = designScreenFactor * bannerHeight * 0.2;
}
