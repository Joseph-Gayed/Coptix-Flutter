import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../utils/localization/app_localizations_delegate.dart';
import '../utils/localization/localized_content.dart';
import 'common_methods.dart';

class CoptixBottomNavBar extends StatelessWidget {
  final Function(int) onIemSelected;
  final int selectedIndex;

  const CoptixBottomNavBar(
      {super.key, required this.selectedIndex, required this.onIemSelected});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: selectedIndex,
      selectedItemColor: secondaryColor,
      unselectedItemColor: inActiveColor,
      selectedFontSize: FontSizes.body2,
      unselectedFontSize: FontSizes.body2,
      onTap: onIemSelected,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_home_inactive.png"),
          activeIcon: getBottomBarIcon("ic_home_active.png"),
          label: LocalizationKey.home.tr(),
        ),
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_additions_inactive.png"),
          activeIcon: getBottomBarIcon("ic_additions_active.png"),
          label: LocalizationKey.newAdditions.tr(),
        ),
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_search_inactive.png"),
          activeIcon: getBottomBarIcon("ic_search_active.png"),
          label: LocalizationKey.search.tr(),
        ),
        BottomNavigationBarItem(
          icon: getBottomBarIcon("ic_profile_inactive.png"),
          activeIcon: getBottomBarIcon("ic_profile_active.png"),
          label: LocalizationKey.myAccount.tr(),
        ),
      ],
    );
  }
}
