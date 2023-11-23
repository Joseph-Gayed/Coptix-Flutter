import 'package:coptix/features/home_landing/new_additions/new_additions_screen.dart';
import 'package:coptix/features/home_landing/search/search_screen.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/coptix_bottom_nav_bar.dart';
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
    return Scaffold(
      appBar: const CoptixAppBar(),
      body: CoptixContainer(child: _screens[_selectedIndex]),
      bottomNavigationBar: CoptixBottomNavBar(
        selectedIndex: _selectedIndex,
        onIemSelected: onIemSelected,
      ),
    );
  }

  void onIemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
