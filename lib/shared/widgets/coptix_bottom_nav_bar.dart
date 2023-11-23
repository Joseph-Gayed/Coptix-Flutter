import 'package:coptix/shared/theme/colors.dart';
import 'package:flutter/material.dart';

import '../theme/dimens.dart';
import '../utils/constants.dart';
import '../utils/localization/app_localizations.dart';
import '../utils/localization/localized_content.dart';

class CoptixBottomNavBar extends StatelessWidget {
  final Function(int) onIemSelected;
  final int selectedIndex;

  const CoptixBottomNavBar(
      {super.key, required this.selectedIndex, required this.onIemSelected});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: secondaryColor,
      unselectedItemColor: inActiveColor,
      onTap: onIemSelected,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_home_inactive.png"),
          activeIcon: getBottomBarIcon("ic_home_active.png"),
          label: AppLocalizations.of(context).translate(LocalizationKey.home),
        ),
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_additions_inactive.png"),
          activeIcon: getBottomBarIcon("ic_additions_active.png"),
          label: AppLocalizations.of(context)
              .translate(LocalizationKey.newAdditions),
        ),
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_search_inactive.png"),
          activeIcon: getBottomBarIcon("ic_search_active.png"),
          label: AppLocalizations.of(context).translate(LocalizationKey.search),
        ),
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_profile_inactive.png"),
          activeIcon: getBottomBarIcon("ic_profile_active.png"),
          label:
              AppLocalizations.of(context).translate(LocalizationKey.profile),
        ),
      ],
    );
  }

  Image getBottomBarIcon(String iconName) {
    return Image.asset("$imagesPath$iconName",
        width: Dimens.bottomNavBarIconSize,
        height: Dimens.bottomNavBarIconSize);
  }
}
