import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/localization/app_localizations.dart';
import '../../../shared/utils/localization/localized_content.dart';
import '../../../shared/utils/navigation/navigation_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return CoptixContainer(
        child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.changeAppLanguage);
      },
      child: Text(
          AppLocalizations.of(context).translate(LocalizationKey.profile),
          style: const TextStyle(fontSize: 24)),
    ));
  }
}
