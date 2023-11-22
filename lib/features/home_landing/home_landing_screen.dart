import 'package:coptix/features/home_landing/new_additions/new_additions_screen.dart';
import 'package:coptix/features/home_landing/search/search_screen.dart';
import 'package:coptix/shared/utils/constants.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../shared/theme/colors.dart';
import '../../shared/theme/dimens.dart';
import 'home/home_screen.dart';
import 'my_profile/profile_screen.dart';

class HomeLandingScreen extends StatefulWidget {
  const HomeLandingScreen({super.key});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const NewAdditionsScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      appBar: const CoptixAppBar(),
      body: CoptixContainer(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: getBottomBarIcon("ic_home.png"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: getBottomBarIcon("ic_recent.png"),
            label: 'New Additions',
          ),
          BottomNavigationBarItem(
            icon: getBottomBarIcon("ic_search.png"),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: getBottomBarIcon("ic_profile.png"),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: secondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Image getBottomBarIcon(String iconName) {
    return Image.asset("$imagesPath$iconName",
        width: Dimens.bottomBarIconSize, height: Dimens.bottomBarIconSize);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
