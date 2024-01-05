import '../enums/collection_display_type.dart';

double dimensDesignScreenFactor = 0.80;
double fontsDesignScreenFactor = 0.85;

//banner :
//https://picsum.photos/390/485
//normal:
//https://picsum.photos/250/140
//vertical
//https://picsum.photos/165/290

class FontSizes {
  static double h4 = (fontsDesignScreenFactor * 34);
  static double h5 = (fontsDesignScreenFactor * 24);
  static double h6 = (fontsDesignScreenFactor * 20);
  static double subtitle1 = (fontsDesignScreenFactor * 18);
  static double subtitle2 = (fontsDesignScreenFactor * 14);
  static double body1 = (fontsDesignScreenFactor * 18);
  static double body2 = (fontsDesignScreenFactor * 14);
  static double button = (fontsDesignScreenFactor * 18);
  static double caption = (fontsDesignScreenFactor * 12);
  static double overline = (fontsDesignScreenFactor * 10);
}

class Dimens {
  static double screenMarginH = (dimensDesignScreenFactor * 20);
  static double halfScreenMarginH = (screenMarginH / 2);
  static double doubleScreenMarginH = (screenMarginH * 2);
  static double screenMarginV = (dimensDesignScreenFactor * 20);
  static double halfScreenMarginV = (screenMarginV / 2);
  static double doubleScreenMarginV = (screenMarginV * 2);
  static double appBarHeight = (dimensDesignScreenFactor * 75);
  static double appBarIconHeight = appBarHeight - 15;
  static double bottomNavBarIconSize = (dimensDesignScreenFactor * 25);
  static double defaultIconSize = (dimensDesignScreenFactor * 21);
  static double verticalDividerHeight = (dimensDesignScreenFactor * 31);
  static double verticalDividerWidth = (dimensDesignScreenFactor * 5);
  static double cornerRadius = (dimensDesignScreenFactor * 7);
  static double arrowIconSize = (dimensDesignScreenFactor * 20);
  static double indicatorDotsSize = (dimensDesignScreenFactor * 10);
  static double gridSpacing = screenMarginH;
  static double detailsBannerMaskOpacity = 0.7;
  static double tabBarIndicatorHeight = (dimensDesignScreenFactor * 4);
  static double tabBarIndicatorMargin = (dimensDesignScreenFactor * 7);
  static double backButtonSize = 30;
  static double chipHeight = (dimensDesignScreenFactor * 40);
  static double buttonHorizontalPadding = (dimensDesignScreenFactor * 6);
  static double buttonVerticalPadding = (dimensDesignScreenFactor * 10);

  static double buttonIconSize = (dimensDesignScreenFactor * 19);

  static double itemsHorizontalMargin = (dimensDesignScreenFactor * 10);
  static double itemsHalfHorizontalMargin = itemsHorizontalMargin / 2;
}

class SplashDimens {
  static double logoMargin =
      (dimensDesignScreenFactor * 50) - Dimens.screenMarginH;
  static double greetingMargin =
      (dimensDesignScreenFactor * 90) - Dimens.screenMarginH;
}

class HomeDimens {
  static Map<CollectionDisplayType, double> displayTypeWidths = {
    CollectionDisplayType.banner: (dimensDesignScreenFactor * 388),
    CollectionDisplayType.normal: (dimensDesignScreenFactor * 250),
    CollectionDisplayType.vertical: (dimensDesignScreenFactor * 165),
    CollectionDisplayType.special: (dimensDesignScreenFactor * 166),
  };
  static Map<CollectionDisplayType, double> displayTypeHeights = {
    CollectionDisplayType.banner: (dimensDesignScreenFactor * 687),
    CollectionDisplayType.normal: (dimensDesignScreenFactor * 140),
    CollectionDisplayType.vertical: (dimensDesignScreenFactor * 294),
    CollectionDisplayType.special: (dimensDesignScreenFactor * 292),
  };

  static double featuredGradientLayerHeight =
      (displayTypeHeights[CollectionDisplayType.banner]!) * 0.7;

  static double featuredDotsHeight = (dimensDesignScreenFactor * 41);

  static double specialVerticalPadding = (dimensDesignScreenFactor * 32);
  static double specialCollectionHeight = specialVerticalPadding +
      displayTypeHeights[CollectionDisplayType.special]!;
  static double specialTextContainerWidth = (dimensDesignScreenFactor * 215);

  static double collectionsVerticalMargin = (dimensDesignScreenFactor * 53);
  static double collectionTitleVerticalMargin = (dimensDesignScreenFactor * 16);
  static double categoriesVerticalMargin = (dimensDesignScreenFactor * 21);
  static double collectionTitleHorizontalMargin =
      (dimensDesignScreenFactor * 13);
}

class NewAdditionsDimens {
  static double cardWidth = (dimensDesignScreenFactor * 190);
  static double cardHeight = (dimensDesignScreenFactor * 290);
}

class VideoDetailsDimens {
  static double bannerHeightMobile = (dimensDesignScreenFactor * 250);
  static double bannerHeightTablet = (dimensDesignScreenFactor * 350);
  static double halfBannerHeightTablet = bannerHeightTablet / 2;
  static double shareIconSize = (dimensDesignScreenFactor * 20);
  static double shareButtonSize =
      shareIconSize + ((dimensDesignScreenFactor * 9));
  static double gradientLayerHeightMobile = (bannerHeightMobile * 0.2);
  static double gradientLayerHeightTablet = (bannerHeightTablet * 0.2);
}

class AuthDimens {
  static double borderWidth = (dimensDesignScreenFactor * 2);
  static double logoutIconSize = (dimensDesignScreenFactor * 43);
}
