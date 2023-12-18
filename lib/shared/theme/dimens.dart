import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enums/collection_display_type.dart';

double dimensDesignScreenFactor = 1;
double fontsDesignScreenFactor = 1;

//banner :
//https://picsum.photos/390/485
//normal:
//https://picsum.photos/250/140
//vertical
//https://picsum.photos/165/290

class FontSizes {
  static double h4 = (34).sp;
  static double h5 = (24).sp;
  static double h6 = (20).sp;
  static double subtitle1 = (16).sp;
  static double subtitle2 = (14).sp;
  static double body1 = (18).sp;
  static double body2 = (14).sp;
  static double button = (18).sp;
  static double caption = (12).sp;
  static double overline = (10).sp;
}

class Dimens {
  static double screenMarginH = (20).w;
  static double halfScreenMarginH = (screenMarginH / 2).w;
  static double doubleScreenMarginH = (screenMarginH * 2).w;
  static double screenMarginV = (20).h;
  static double halfScreenMarginV = (screenMarginV / 2).h;
  static double doubleScreenMarginV = (screenMarginV * 2).h;
  static double appBarHeight = (75).h;
  static double appBarIconHeight = appBarHeight - 15;
  static double bottomNavBarIconSize = (25).h;
  static double verticalDividerHeight = (31).h;
  static double verticalDividerWidth = (5).w;
  static double cornerRadius = (7).h;
  static double arrowIconSize = (20).w;
  static double indicatorDotsSize = (10).w;
  static double gridSpacing = screenMarginH;
  static double detailsBannerMaskOpacity = 0.7;
  static double tabBarIndicatorHeight = (4).h;
  static double tabBarIndicatorMargin = (7).h;
  static double backButtonSize = 30.w;
  static double chipHeight = (40).h;
  static double buttonHorizontalPadding = (6).w;
  static double buttonVerticalPadding = (10).h;

  static double buttonIconSize = 19.r;
}

class SplashDimens {
  static double logoMargin = (50) - Dimens.screenMarginH;
  static double greetingMargin = (90) - Dimens.screenMarginH;
}

class HomeDimens {
  static Map<CollectionDisplayType, double> displayTypeWidths = {
    CollectionDisplayType.banner: (388).w,
    CollectionDisplayType.normal: (250).w,
    CollectionDisplayType.vertical: (165).w,
    CollectionDisplayType.special: (166).w,
  };
  static Map<CollectionDisplayType, double> displayTypeHeights = {
    CollectionDisplayType.banner: (687).h,
    CollectionDisplayType.normal: (140).h,
    CollectionDisplayType.vertical: (294).h,
    CollectionDisplayType.special: (292).h,
  };

  static double featuredGradientLayerHeight =
      (displayTypeHeights[CollectionDisplayType.banner]!).h * 0.7;

  static double featuredDotsHeight = 41.h;

  static double specialVerticalPadding = (32).h;
  static double specialCollectionHeight = specialVerticalPadding +
      displayTypeHeights[CollectionDisplayType.special]!;
  static double specialTextContainerWidth = (195).w;

  static double collectionsVerticalMargin = (53).h;
  static double collectionTitleVerticalMargin = (16).h;
  static double categoriesVerticalMargin = (21).h;
  static double collectionTitleHorizontalMargin = (13).w;
}

class NewAdditionsDimens {
  static double cardWidth = (190).w;
  static double cardHeight = (290).h;
}

class VideoDetailsDimens {
  static double bannerHeightMobile = (250).h;
  static double bannerHeightTablet = (350).h;
  static double halfBannerHeightTablet = bannerHeightTablet / 2;
  static double shareIconSize = (20).h;
  static double shareButtonSize = shareIconSize + ((9).w);
  static double gradientLayerHeightMobile = (bannerHeightMobile * 0.2).h;

  static double gradientLayerHeightTablet = (bannerHeightTablet * 0.2).h;
}
