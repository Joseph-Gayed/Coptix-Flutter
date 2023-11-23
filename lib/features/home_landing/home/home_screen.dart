import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/localization/app_localizations.dart';
import '../../../shared/utils/localization/localized_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: CoptixContainer(
        child: Text(
            AppLocalizations.of(context).translate(LocalizationKey.home),
            style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
