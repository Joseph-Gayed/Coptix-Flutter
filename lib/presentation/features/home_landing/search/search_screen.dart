import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/localization/app_localizations_delegate.dart';
import '../../../../shared/utils/localization/localized_content.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: CoptixContainer(
        child: Text(LocalizationKey.search.tr(),
            style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
