import 'package:coptix/presentation/features/home_landing/explore/explore_screen.dart';
import 'package:coptix/presentation/features/home_landing/search/screens/search_screen.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/utils/navigation/navigation_args.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/coptix_bottom_nav_bar.dart';
import 'home/screens/home_screen.dart';
import 'my_profile/profile_screen.dart';

class HomeLandingScreen extends StatefulWidget {
  final Map<String, dynamic>? arguments;
  const HomeLandingScreen({super.key, this.arguments});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();

  static const int indexOfHomeTab = 0;
  static const int indexOfExploreTab = 1;
  static const int indexOfSearchTab = 2;
  static const int indexOfProfileTab = 3;
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  int _selectedIndex = HomeLandingScreen.indexOfHomeTab;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.arguments?[NavArgsKeys.indexOfSelectedTab] ?? 0;
    _screens = <Widget>[];
    prepareTabs();
  }

  void prepareTabs() {
    _screens.insert(HomeLandingScreen.indexOfHomeTab, HomeScreen.withCubit());
    _screens.insert(
        HomeLandingScreen.indexOfExploreTab, ExploreScreen.withCubit());
    _screens.insert(
        HomeLandingScreen.indexOfSearchTab, SearchScreen.withCubit());
    _screens.insert(HomeLandingScreen.indexOfProfileTab, const ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: const CoptixAppBar(),
        body: CoptixContainer(child: _screens[_selectedIndex]),
        bottomNavigationBar: CoptixBottomNavBar(
          selectedIndex: _selectedIndex,
          onIemSelected: onIemSelected,
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != HomeLandingScreen.indexOfHomeTab) {
      Future.delayed(const Duration(milliseconds: 200), () {
        onIemSelected(HomeLandingScreen.indexOfHomeTab);
      });
      return false;
    }
    await context.exitApp();
    return true;
  }

  void onIemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
