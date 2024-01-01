import 'package:coptix/presentation/features/home_landing/search/screens/search_screen.dart';
import 'package:coptix/shared/utils/navigation/navigation_args.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/coptix_bottom_nav_bar.dart';
import '../../features/home_landing/new_additions/new_additions_screen.dart';
import 'home/screens/home_screen.dart';
import 'my_profile/profile_screen.dart';

class HomeLandingScreen extends StatefulWidget {
  final Map<String, dynamic>? arguments;
  const HomeLandingScreen({super.key, this.arguments});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  int _selectedIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.arguments?[NavArgsKeys.indexOfSelectedTab] ?? 0;
    _screens = <Widget>[
      HomeScreen.withCubit(),
      const NewAdditionsScreen(),
      SearchScreen.withCubit(),
      const ProfileScreen(),
    ];
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
    if (_selectedIndex != 0) {
      Future.delayed(const Duration(milliseconds: 200), () {
        onIemSelected(0);
      });
      return false;
    }
    return true;
  }

  void onIemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
